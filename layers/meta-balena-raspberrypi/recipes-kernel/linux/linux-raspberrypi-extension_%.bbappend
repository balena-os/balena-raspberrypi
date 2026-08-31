# Raspberry Pi in-tree defconfigs pin CONFIG_LSM=""
#
# Append "bpf" to the list the merged configuration already has,
# keeping every existing entry and its initialization order, so which other
# LSMs run is unchanged.
python kernel_lsm_enable_bpf() {
    import os
    import re

    config = os.path.join(d.getVar("B"), ".config")
    current = kernel_balena_parse_config(config).get("CONFIG_LSM")
    if current is None:
        bb.fatal("CONFIG_LSM is absent from %s. It is gated on CONFIG_SECURITY, "
                 "which the BPF LSM also needs." % config)

    entries = [entry for entry in
               (candidate.strip() for candidate in current.strip('"').split(",")) if entry]
    if "bpf" in entries:
        return
    entries.append("bpf")

    with open(config) as handle:
        content = handle.read()
    content = re.sub(r"^CONFIG_LSM=.*$", 'CONFIG_LSM="%s"' % ",".join(entries),
                     content, count=1, flags=re.MULTILINE)
    with open(config, "w") as handle:
        handle.write(content)

    bb.note("kernel-lsm: CONFIG_LSM=\"%s\"" % ",".join(entries))
}
kernel_lsm_enable_bpf[dirs] += "${B}"

# This recipe is the extension kernel for whichever capability class it inherits,
# and the LSM list only needs # bpf when that class is kernel-ebpf.
do_kernel_ebpf_verify_lsm[prefuncs] += "kernel_lsm_enable_bpf"
