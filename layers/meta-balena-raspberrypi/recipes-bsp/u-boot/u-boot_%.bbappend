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
"

SRC_URI_append_raspberrypi3-64 = " \
    file://0001-otp-regs-Read-customer-otp-register.patch \
"
