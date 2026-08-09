# Raspberry Pi kernel extension.
#

# SRC_URI is restated rather than appended to, because pinning this kernel by
# SRCREV alone needs nobranch=1, and restating SRC_URI means restating KMETA.
KMETA = "kernel-meta"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;name=machine;nobranch=1;protocol=https \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
    file://powersave.cfg \
    file://android-drivers.cfg \
    "

require recipes-kernel/linux/linux-raspberrypi.inc

FILESEXTRAPATHS:prepend := "${THISDIR}/fragments:"

KERNEL_DTC_FLAGS += "-@ -H epapr"

# Must stay below the require above; see kernel-extension.bbclass for why.
inherit kernel-extension kernel-balena-override

# :append so this and a capability class's fragments cannot clobber each other.
KERNEL_BALENA_OVERRIDE_FRAGMENTS:append = " balena-os-drivers.cfg"

# raspberrypi4-64 EEPROM/A-B rollback SPI drivers. Shared with the base kernel
# via BALENA_CONFIGS[pieeprom] (early inject), so both stay in sync.
require recipes-kernel/linux/pieeprom.inc
