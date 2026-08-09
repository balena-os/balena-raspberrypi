# Raspberry Pi kernel extension.
#

# This restates SRC_URI instead of appending to it. To pin by SRCREV alone
# you need nobranch=1. A restated SRC_URI must also restate KMETA.
KMETA = "kernel-meta"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;name=machine;nobranch=1;protocol=https \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
    file://powersave.cfg \
    file://android-drivers.cfg \
    "

require linux-raspberrypi.inc

FILESEXTRAPATHS:prepend := "${THISDIR}/fragments:"

KERNEL_DTC_FLAGS += "-@ -H epapr"

# Must stay below the require above. See kernel-extension.bbclass for why.
inherit kernel-extension kernel-balena-override

# :append so a capability class fragment does not overwrite this one.
KERNEL_BALENA_OVERRIDE_FRAGMENTS:append = " balena-os-drivers.cfg"

# raspberrypi4-64 EEPROM and A-B rollback SPI drivers. The base kernel uses
# the same BALENA_CONFIGS[pieeprom], so both kernels stay in sync.
require recipes-kernel/linux/pieeprom.inc
