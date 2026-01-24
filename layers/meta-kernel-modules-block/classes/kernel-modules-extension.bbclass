# kernel-modules-extension.bbclass
#
# Builds a kernel extension block with additional loadable modules using
# targeted enablement from a curated config fragment (modules-selection.cfg).
#
# Strategy:
# 1. Let normal kernel config flow run (defconfig + BALENA_CONFIGS)
# 2. Save the base .config, normalize via olddefconfig
# 3. Apply modules-selection.cfg via merge_config.sh
# 4. Run olddefconfig to resolve dependencies
# 5. Config stability check: verify no =y options were added or removed
# 6. Compile kernel + modules (normal do_compile flow)
# 7. Install all modules (base + new)
# 8. After install, rebuild with base config to get base symvers for CRC
#    verification
#
# Usage:
#   inherit kernel-modules-extension
#   # Place modules-selection.cfg in FILESEXTRAPATHS-reachable directory


def kernel_modules_read_config(config_path):
    """Read a kernel .config into a dict of CONFIG_OPTION -> full line."""
    import re

    values = {}
    with open(config_path) as f:
        for line in f:
            line = line.strip()
            m = re.match(r"^(CONFIG_\w+)=", line)
            if m:
                values[m.group(1)] = line
                continue
            m = re.match(r"^# (CONFIG_\w+) is not set$", line)
            if m:
                values[m.group(1)] = line

    return values


python do_kernel_extend_config() {
    import os
    import shutil
    import subprocess

    S = d.getVar("S")
    B = d.getVar("B")

    base_config = os.path.join(B, ".config")
    base_saved = os.path.join(B, ".config.base")

    make_cmd = d.getVar("KERNEL_MAKE_CMD") or "make"
    make_opts = d.getVar("EXTRA_OEMAKE") or ""
    arch = d.getVar("ARCH")
    if not arch:
        bb.fatal("kernel-modules-extension: ARCH variable not set")

    # 1. Normalize base config via olddefconfig to get a clean baseline.
    #    The .config may contain stale/renamed kconfig symbols, or may be
    #    leftover from a previous extended build if the build dir was reused.
    #    Normalizing ensures a clean starting point for comparison.
    cmd = f'{make_cmd} {make_opts} -C {S} O={B} ARCH={arch} olddefconfig'
    bb.note("Normalizing base config via olddefconfig")
    ret = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if ret.returncode != 0:
        bb.fatal(f"olddefconfig (base normalization) failed:\n{ret.stderr}")

    # 2. Save the normalized .config as .config.base AFTER normalization.
    #    This ensures .config.base is always a clean, normalized base config
    #    regardless of any stale state in the build directory.
    shutil.copy(base_config, base_saved)
    bb.note(f"Saved normalized base config to {base_saved}")

    base_values = kernel_modules_read_config(base_config)
    base_y = {k for k, v in base_values.items() if v.endswith("=y")}
    base_m = {k for k, v in base_values.items() if v.endswith("=m")}
    bb.note(f"Base config (normalized): {len(base_y)} =y, {len(base_m)} =m")

    # 3. Find modules-selection.cfg via FILESEXTRAPATHS
    selection_cfg = None
    filesextrapaths = d.getVar("FILESEXTRAPATHS") or ""
    for path in filesextrapaths.split(":"):
        candidate = os.path.join(path, "modules-selection.cfg")
        if os.path.exists(candidate):
            selection_cfg = candidate
            break

    if not selection_cfg:
        bb.fatal(
            "kernel-modules-extension: modules-selection.cfg not found.\n"
            "Place it in a directory reachable via FILESEXTRAPATHS.\n"
            f"Searched paths: {filesextrapaths}"
        )

    bb.note(f"Using module selection fragment: {selection_cfg}")

    # 4. Apply modules-selection.cfg via merge_config.sh
    merge_script = os.path.join(S, "scripts", "kconfig", "merge_config.sh")
    cmd = f'{merge_script} -m -O {B} {base_config} {selection_cfg}'
    bb.note("Merging modules-selection.cfg")
    ret = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if ret.returncode != 0:
        bb.fatal(f"merge_config.sh failed:\n{ret.stderr}")

    # 5. Run olddefconfig to resolve dependencies
    cmd = f'{make_cmd} {make_opts} -C {S} O={B} ARCH={arch} olddefconfig'
    bb.note("Running olddefconfig")
    ret = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if ret.returncode != 0:
        bb.fatal(f"olddefconfig failed:\n{ret.stderr}")

    # 6. Config stability check: compare =y sets
    extended_values = kernel_modules_read_config(base_config)
    extended_y = {k for k, v in extended_values.items() if v.endswith("=y")}
    extended_m = {k for k, v in extended_values.items() if v.endswith("=m")}

    added_y = sorted(extended_y - base_y)
    removed_y = sorted(base_y - extended_y)

    if added_y or removed_y:
        msg = "Config stability check FAILED — =y options changed after applying modules-selection.cfg.\n"
        if added_y:
            msg += f"\nNew =y options ({len(added_y)}):\n"
            for opt in added_y:
                msg += f"  {opt}=y\n"
        if removed_y:
            msg += f"\nLost =y options ({len(removed_y)}):\n"
            for opt in removed_y:
                msg += f"  {opt}=y (was in base, now missing)\n"
        msg += (
            "\nTo fix: remove the offending CONFIG_*=m lines from modules-selection.cfg "
            "that trigger these =y dependencies, or add the required =y options to the "
            "base kernel config first."
        )
        bb.fatal(msg)

    new_m = extended_m - base_m
    bb.note(f"Config extension summary:")
    bb.note(f"  Base: {len(base_y)} =y, {len(base_m)} =m")
    bb.note(f"  Extended: {len(extended_y)} =y, {len(extended_m)} =m")
    bb.note(f"  New =m (additional modules): {len(new_m)}")
    bb.note(f"  Config stability: PASSED (zero =y changes)")
}

addtask kernel_extend_config after do_kernel_resin_injectconfig before do_compile


python do_check_module_compat() {
    """Check CRC compatibility between extended and base kernel.

    Runs AFTER do_install so the extended .ko files are safely in ${D}.
    Rebuilds with the base config to get base symvers, then verifies that
    all shared symbol CRCs match — ensuring modules will load on the base kernel.
    """
    import os
    import shutil
    import subprocess

    B = d.getVar("B")
    S = d.getVar("S")
    base_saved = os.path.join(B, ".config.base")
    base_config = os.path.join(B, ".config")

    if not os.path.exists(base_saved):
        bb.fatal("do_check_module_compat: .config.base not found")

    make_cmd = d.getVar("KERNEL_MAKE_CMD") or "make"
    make_opts = d.getVar("EXTRA_OEMAKE") or ""
    arch = d.getVar("ARCH")

    # 1. Save extended symvers
    extended_symvers = os.path.join(B, "vmlinux.symvers")
    if not os.path.exists(extended_symvers):
        extended_symvers = os.path.join(B, "Module.symvers")
    if not os.path.exists(extended_symvers):
        bb.fatal(
            "do_check_module_compat: neither vmlinux.symvers nor Module.symvers "
            f"found in {B}. Did do_compile run successfully?"
        )
    extended_symvers_saved = extended_symvers + ".extended"
    shutil.copy(extended_symvers, extended_symvers_saved)

    # 2. Save extended config, restore base, and build base modules for symvers comparison.
    extended_config_saved = base_config + ".extended"
    shutil.copy(base_config, extended_config_saved)
    shutil.copy(base_saved, base_config)
    bb.note("Building base modules for symvers comparison")

    cmd = (f'{make_cmd} {make_opts} -C {S} O={B} ARCH={arch} '
           f'KBUILD_MODPOST_NOFINAL=1 modules')
    ret = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if ret.returncode != 0:
        bb.fatal(f"Base module build failed:\n{ret.stderr}")

    # 3. CRC compatibility check using symvers
    def parse_symvers(path):
        syms = {}
        with open(path) as f:
            for line in f:
                parts = line.strip().split("\t")
                if len(parts) >= 2:
                    syms[parts[1]] = parts[0]  # symbol -> CRC
        return syms

    base_symvers = os.path.join(B, os.path.basename(extended_symvers))
    base_syms = parse_symvers(base_symvers)
    extended_syms = parse_symvers(extended_symvers_saved)

    mismatched = []
    for sym, ext_crc in extended_syms.items():
        if sym in base_syms:
            base_crc = base_syms[sym]
            if ext_crc != base_crc and base_crc != "0x00000000" and ext_crc != "0x00000000":
                mismatched.append((sym, base_crc, ext_crc))

    bb.note(f"Module compatibility check:")
    bb.note(f"  Base symbols: {len(base_syms)}")
    bb.note(f"  Extended symbols: {len(extended_syms)}")
    bb.note(f"  Shared symbols: {len(set(base_syms) & set(extended_syms))}")
    bb.note(f"  CRC mismatches: {len(mismatched)}")

    if mismatched:
        sample = mismatched[:20]
        lines = [f"  {sym}: base={bcrc} ext={ecrc}" for sym, bcrc, ecrc in sample]
        bb.fatal(
            f"{len(mismatched)} symbol CRC mismatches between base and extended kernel.\n"
            f"Modules using these symbols will fail to load.\n"
            + "\n".join(lines)
            + (f"\n  ... and {len(mismatched) - 20} more" if len(mismatched) > 20 else "")
        )

    # 4. Restore extended config and symvers so subsequent tasks see the correct state.
    shutil.copy(extended_config_saved, base_config)
    shutil.copy(extended_symvers_saved, extended_symvers)
    bb.note("Restored extended .config and symvers")

    bb.note("Module compatibility check passed — all CRCs match")
}

addtask check_module_compat after do_install before do_package

# Remove files not needed for the loadable modules block
do_install:append() {
    rm -f ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.ranges
}

# Skip kernel_configcheck since we're using a non-standard config flow
do_kernel_configcheck() {
    :
}
