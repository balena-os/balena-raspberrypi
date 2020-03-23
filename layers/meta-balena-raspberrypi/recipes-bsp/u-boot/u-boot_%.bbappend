inherit resin-u-boot
UBOOT_KCONFIG_SUPPORT = "1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# Remove patch inherited from meta-raspberrypi already upstream in v2018.07
SRC_URI_remove = " file://0002-rpi_0_w-Add-configs-consistent-with-RpI3.patch "

# Remove patch inherited from meta-resin. This needs to be rebased for v2018.07
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch "

SRC_URI += " \
    file://0001-Integrate-machine-independent-resin-environment-conf.patch \
    file://rpi-Use-CONFIG_OF_BOARD-instead-of-CONFIG_EMBED.patch \
    file://increase-usb-interface-nr.patch \
    file://rpi.h-Remove-usb-start-from-CONFIG_PREBOOT.patch \
    file://0002-raspberrypi-Disable-simple-framebuffer-support.patch \
    file://0001-avoid-block-uart-write.patch \
"

# Disable flasher check since it starts usb unnecessarily
# and we don't generate flasher images for any of the RPIs.
SRC_URI_append = " \
    file://0001-rpi-Disable-image-flasher-check.patch \
"

RESIN_UBOOT_DEVICE_TYPES_append = " usb"
