require recipes-kernel/linux/linux-raspberrypi_6.12.inc

KMETA = "kernel-meta"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;name=machine;nobranch=1;protocol=https \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
    file://powersave.cfg \
    file://android-drivers.cfg \
    "

require recipes-kernel/linux/linux-raspberrypi.inc

FILESEXTRAPATHS:prepend := "${THISDIR}/files-exein:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-balena-raspberrypi/recipes-kernel/linux/files:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-balena-raspberrypi/recipes-kernel/linux/linux-raspberrypi:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-raspberrypi/recipes-kernel/linux/files:"

KERNEL_DTC_FLAGS += "-@ -H epapr"

KERNEL_PACKAGE_NAME = "kernel-extension-exein"
PROVIDES = "virtual/kernel-extension-exein"

inherit kernel-balena

python () {
    import glob
    import os
    thisdir = d.getVar("THISDIR")
    fragments = sorted(glob.glob(os.path.join(thisdir, "files-exein", "*.cfg")))
    d.appendVarFlag(
        "do_kernel_balena_merge_fragments", "file-checksums",
        " " + " ".join(f"{p}:True" for p in fragments),
    )
}
