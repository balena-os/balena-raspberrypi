inherit resin-u-boot
UBOOT_KCONFIG_SUPPORT = "1"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Remove patch inherited from meta-resin. This needs to be rebased for v2018.07
SRC_URI:remove = " file://resin-specific-env-integration-kconfig.patch "

RPI_PATCHES = " \
    file://Revert-remove-include-config_defaults.h.patch \
    file://rpi4-include-configs-Use-config-defaults.patch \
    file://rpi-Use-CONFIG_OF_BOARD-instead-of-CONFIG_EMBED.patch \
    file://increase-usb-interface-nr.patch \
    file://0002-raspberrypi-Disable-simple-framebuffer-support.patch \
    file://0001-avoid-block-uart-write.patch \
    file://u-boot-Remove-usb-start-from-CONFIG_PREBOOT.patch \
"

SRC_URI += " \
    file://0001-Integrate-machine-independent-resin-environment-conf.patch \
    ${RPI_PATCHES} \
"

# Disable flasher check since it starts usb unnecessarily
# and we don't generate flasher images for any of the RPIs.
# Also, add a retry count limit for the uart on u-boot 2020.x
SRC_URI:append = " \
    file://0001-rpi-Disable-image-flasher-check.patch \
    file://serial_pl01x-Add-retry-limit-when-writing-to-uart-co.patch \
"

BALENA_UBOOT_DEVICE_TYPES:append = " usb"

SRC_URI:append:raspberrypi4-64 = " \
    file://pi4-fix-crash-when-issuing-usb-reset.patch \
"
