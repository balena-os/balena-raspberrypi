# Raspberry Pi kernel extension.
#
# The kernel source and the configuration shared with the hostapp kernel come
# from linux-raspberrypi_<ver>.inc, linux-raspberrypi-balena.inc and
# linux-raspberrypi-balena_<ver>.inc.

require linux-raspberrypi.inc

# Must stay below the require above. See kernel-extension.bbclass for why.
inherit kernel-extension kernel-balena-override

require recipes-kernel/linux/linux-raspberrypi-balena.inc

# Raspberry Pi in-tree defconfigs pin CONFIG_LSM=""
#
# Append "bpf" to the list that the merged configuration already has. Keep
# every existing entry and its initialization order. This does not change
# which other LSMs run.
python do_kernel_lsm_enable_bpf() {
    import os
    import re

    config = os.path.join(d.getVar("B"), ".config")
    current = kernel_balena_parse_config(config).get("CONFIG_LSM")
    if current is None:
        bb.fatal("CONFIG_LSM is absent from %s. security/Kconfig emits the "
                 "symbol unconditionally, so this .config is incomplete."
                 % config)

    entries = [entry for entry in
               (candidate.strip() for candidate in current.strip('"').split(",")) if entry]
    if "bpf" in entries:
        return
    entries.append("bpf")
    merged = ",".join(entries)

    with open(config) as handle:
        content = handle.read()
    content, replaced = re.subn(r"^CONFIG_LSM=.*$", 'CONFIG_LSM="%s"' % merged,
                                content, count=1, flags=re.MULTILINE)
    # The parser strips leading space; this pattern does not.
    if not replaced:
        bb.fatal("No '^CONFIG_LSM=' line to rewrite in %s, so the bpf entry "
                 "would be dropped without an error." % config)
    with open(config, "w") as handle:
        handle.write(content)

    bb.note("kernel-lsm: CONFIG_LSM=\"%s\"" % merged)
}
do_kernel_lsm_enable_bpf[dirs] += "${B}"

# The LSM list needs bpf only for the kernel-ebpf class, so the task hangs off
# that class's check. Without the class nothing requires the task and it never
# runs.
#
# Ordered after do_kernel_balena_verify_fragments, which already runs after the
# fragment merge. Not beside it: both tasks touch ${B}/.config, and BitBake runs
# sibling tasks of one recipe in parallel, so an unordered pair would race this
# writer against that reader.
addtask kernel_lsm_enable_bpf after do_kernel_balena_verify_fragments before do_kernel_ebpf_verify_lsm
