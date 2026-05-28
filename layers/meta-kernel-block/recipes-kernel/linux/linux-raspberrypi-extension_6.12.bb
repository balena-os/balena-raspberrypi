require recipes-kernel/linux/linux-raspberrypi_6.12.inc

# Bump the extension kernel ahead of the base kernel for HUP testing.
LINUX_VERSION = "6.12.62"
SRCREV_machine = "f8e11438119efd4bd88de4ff394acd5a596ce0a2"
SRCREV_meta = "0bc72383691f29eb7fc4661afa9d67e106635929"

KMETA = "kernel-meta"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;name=machine;nobranch=1;protocol=https \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
    file://powersave.cfg \
    file://android-drivers.cfg \
    "

require recipes-kernel/linux/linux-raspberrypi.inc

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-balena-raspberrypi/recipes-kernel/linux/files:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-balena-raspberrypi/recipes-kernel/linux/linux-raspberrypi:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-raspberrypi/recipes-kernel/linux/files:"

KERNEL_DTC_FLAGS += "-@ -H epapr"

# Brand this kernel as the extension provider.
KERNEL_PACKAGE_NAME = "kernel-extension"
PROVIDES = "virtual/kernel-extension"

inherit kernel-balena

# When modules are compressed, OR standard strip will not strip debug symbols.
# Usually balenaOS does not set CONFIG_DEBUG_INFO=y, but this extension does
# so we need to make sure debug symbols are stripped, while keeping the BTF
# data that survives the strip debug.
do_install:prepend() {
    if grep -q '^CONFIG_MODULE_COMPRESS=y$' "${B}/.config"; then
        export INSTALL_MOD_STRIP=1
    fi
}

# Track local fragments in the task hash; kernel-balena's
# do_kernel_balena_merge_fragments does the actual *.cfg merge.
python () {
    import glob
    import os
    thisdir = d.getVar("THISDIR")
    fragments = sorted(glob.glob(os.path.join(thisdir, "files", "*.cfg")))
    d.appendVarFlag(
        "do_kernel_balena_merge_fragments", "file-checksums",
        " " + " ".join(f"{p}:True" for p in fragments),
    )
}
