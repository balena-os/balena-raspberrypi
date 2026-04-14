# Kernel modules extension block configuration
#
# Enables a curated set of additional kernel modules while preserving ABI
# compatibility with the base OS kernel. See kernel-modules-extension.bbclass.

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Track modules-selection.cfg content in the task hash so changes trigger
# re-execution. NOT in SRC_URI because Yocto auto-merges .cfg files into
# the kernel config — the bbclass applies it manually after saving the base.
do_kernel_extend_config[file-checksums] += "${THISDIR}/files/modules-selection.cfg:True"

inherit kernel-modules-extension
