# Due to an issue on CM3 we use FAT32 for boot partition on RaspberryPi boards
# See:
# https://www.raspberrypi.org/documentation/hardware/computemodule/cm-emmc-flashing.md
BALENA_BOOT_FAT32 = "1"
inherit balena-boot-helpers

IMAGE_FSTYPES_append_rpi = " balenaos-img"

# Kernel image name is different on Raspberry Pi 1/2/3-64bit

addhandler overlay_dtbs_handler
overlay_dtbs_handler[eventmask] = "bb.event.RecipePreFinalise"

IMAGE_INSTALL_append_rpi = " u-boot"

RPI_KERNEL_DEVICETREE_remove_revpi = "bcm2708-rpi-zero-w.dtb bcm2710-rpi-3-b-plus.dtb bcm2711-rpi-4-b.dtb"
