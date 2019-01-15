inherit resin-u-boot
UBOOT_KCONFIG_SUPPORT = "1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# Remove patch inherited from meta-raspberrypi already upstream in v2018.07
SRC_URI_remove = " file://0002-rpi_0_w-Add-configs-consistent-with-RpI3.patch "

# Remove patch inherited from meta-resin. This needs to be rebased for v2018.07
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch "

SRC_URI += " \
    file://rpi-Add-autoboot-configuration-in-defconfigs.patch \
    file://0001-Integrate-machine-independent-resin-environment-conf.patch \
    file://rpi-Use-CONFIG_OF_BOARD-instead-of-CONFIG_EMBED.patch \
    file://bootcount-Add-support-to-write-bootcount-to-any-file.patch \
    file://increase-usb-interface-nr.patch \
"
