require recipes-kernel/linux/linux-raspberrypi_6.12.inc

COMPATIBLE_MACHINE = "raspberrypi4-64|raspberrypi5"

KMETA = "kernel-meta"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;name=machine;nobranch=1;protocol=https \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
    file://powersave.cfg \
    file://android-drivers.cfg \
    "

require recipes-kernel/linux/linux-raspberrypi.inc

# Set to "1" (in local.conf or a machine/distro conf) to pull in
# files-rt-debug/*.cfg -- extra ftrace latency tracers useful while
# characterizing RT behavior
KERNEL_RT_DEBUG ?= "0"

FILESEXTRAPATHS:prepend := "${THISDIR}/files-rt:"
FILESEXTRAPATHS:prepend := "${@bb.utils.contains('KERNEL_RT_DEBUG', '1', '${THISDIR}/files-rt-debug:', '', d)}"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-balena-raspberrypi/recipes-kernel/linux/files:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-balena-raspberrypi/recipes-kernel/linux/linux-raspberrypi:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-raspberrypi/recipes-kernel/linux/files:"

KERNEL_DTC_FLAGS += "-@ -H epapr"

KERNEL_PACKAGE_NAME = "kernel-extension-rt"
PROVIDES = "virtual/kernel-extension-rt"

inherit kernel-balena

python () {
    import glob
    import os
    thisdir = d.getVar("THISDIR")
    fragments = sorted(glob.glob(os.path.join(thisdir, "files-rt", "*.cfg")))
    if d.getVar("KERNEL_RT_DEBUG") == "1":
        fragments += sorted(glob.glob(os.path.join(thisdir, "files-rt-debug", "*.cfg")))
    d.appendVarFlag(
        "do_kernel_balena_merge_fragments", "file-checksums",
        " " + " ".join(f"{p}:True" for p in fragments),
    )
}
