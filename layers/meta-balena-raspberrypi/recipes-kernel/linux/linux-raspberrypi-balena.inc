# balenaOS kernel configuration shared by every linux-raspberrypi version. The
# hostapp kernel and the kernel extension both use it.
#
# Version-specific configuration goes in linux-raspberrypi-balena_<ver>.inc.
# Configuration that only the hostapp kernel may carry stays in
# linux-raspberrypi_%.bbappend.

inherit kernel-balena

# Driver fragments shared by every linux-raspberrypi version.
FILESEXTRAPATHS:prepend := "${THISDIR}/fragments:"

# Merged by do_kernel_configme, which runs before BALENA_CONFIGS, on both
# kernels. Keep it out of KERNEL_BALENA_OVERRIDE_FRAGMENTS: that merge runs
# after BALENA_CONFIGS, so the two kernels would settle a conflict between the
# two differently.
SRC_URI += "file://balena-os-drivers.cfg"

# These device types have been using the aufs storage driver,
# and during a HUP the storage in the inactive sysroot will
# still be aufs, so we need to include the aufs driver further
# for them, as per the internal thread
# https://www.flowdock.com/app/rulemotion/resin-devices/threads/K2TQiSUfNDqBT5Ih6cciNI2d9QJ
BALENA_CONFIGS:append:fincm3 = " aufs"
BALENA_CONFIGS:append:npe-x500-m3 = " aufs"
BALENA_CONFIGS:append:raspberrypi = " aufs"
BALENA_CONFIGS:append:raspberrypi2 = " aufs"
BALENA_CONFIGS:append:raspberrypi3-64 = " aufs"
BALENA_CONFIGS:append:raspberrypi3 = " aufs"

# Built-in SPI drivers for the raspberrypi4-64 EEPROM update and A-B rollback
# path.
require recipes-kernel/linux/pieeprom.inc
