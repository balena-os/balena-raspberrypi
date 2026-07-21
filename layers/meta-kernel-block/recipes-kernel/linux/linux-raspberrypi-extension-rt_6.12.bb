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

# Ordered lowest -> highest priority
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-raspberrypi/recipes-kernel/linux/files:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-balena-raspberrypi/recipes-kernel/linux/linux-raspberrypi:"
FILESEXTRAPATHS:prepend := "${COREBASE}/../meta-balena-raspberrypi/recipes-kernel/linux/files:"
FILESEXTRAPATHS:prepend := "${THISDIR}/files-rt-debug:"
FILESEXTRAPATHS:prepend := "${THISDIR}/files-rt:"

KERNEL_DTC_FLAGS += "-@ -H epapr"

KERNEL_PACKAGE_NAME = "kernel-extension-rt"
PROVIDES = "virtual/kernel-extension-rt"

inherit kernel-balena-override

# raspberrypi4-64 EEPROM/A-B rollback SPI drivers. Shared with the base kernel
# via BALENA_CONFIGS[pieeprom] (early inject), so both stay in sync.
require recipes-kernel/linux/pieeprom.inc

# Set to "1" (in local.conf or a machine/distro conf) to also merge
# timerlat.cfg -- an extra ftrace latency, useful for cyclictest or
# debuging
KERNEL_RT_DEBUG ?= "0"

KERNEL_BALENA_OVERRIDE_FRAGMENTS = "rt.cfg"
KERNEL_BALENA_OVERRIDE_FRAGMENTS:append = "${@bb.utils.contains('KERNEL_RT_DEBUG', '1', ' timerlat.cfg', '', d)}"

# Single-pass initramfs bundling to avoid re-running pahole.
KERNEL_EXTRA_ARGS:append = " CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio"

do_compile[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
do_compile:prepend() {
    copy_initramfs
}

# The do_compile image already contains the initramfs, use it to
# avoid re-running pahole
do_bundle_initramfs() {
    for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
        cp -fL ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
    done
}
