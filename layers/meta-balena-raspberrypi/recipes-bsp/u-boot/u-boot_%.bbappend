inherit resin-u-boot
UBOOT_KCONFIG_SUPPORT = "1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# Remove patch inherited from meta-raspberrypi already upstream in v2018.07
SRC_URI_remove = " file://0002-rpi_0_w-Add-configs-consistent-with-RpI3.patch "

# Remove patch inherited from meta-resin. This needs to be rebased for v2018.07
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch "

RPI_PATCHES = " \
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
SRC_URI_append = " \
    file://0001-rpi-Disable-image-flasher-check.patch \
    file://serial_pl01x-Add-retry-limit-when-writing-to-uart-co.patch \
"

BALENA_UBOOT_DEVICE_TYPES_append = " usb"

SRCREV_raspberrypi4-64 = "52ba373b7825e9feab8357065155cf43dfe2f4ff"
LIC_FILES_CHKSUM_raspberrypi4-64 = " file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
# Patches that apply on poky u-boot and are not present
# in this list are either merged in upstream master,
# or are re-based below.
SRC_URI_remove_raspberrypi4-64 = "${RPI_PATCHES}"
SRC_URI_append_raspberrypi4-64 = " \
    file://rpi4-Increase-to-16-the-number-of-USB-interfaces.patch \
    file://rpi4-Disable-simple-framebuffer-support.patch \
    file://rpi4-avoid-block-uart-write.patch \
"

# The following patch is already applied in the 49cf75101db58ad3540d8de6749cf0c1d780dc76 revision we use for rpi4
SRC_URI_remove_raspberrypi4-64 = "file://remove-redundant-yyloc-global.patch"

# These are added by meta-raspberrypi on top of poky uboot (pi0 - pi3)
SRC_URI_remove_raspberrypi4-64 = "${UBOOT_RPI4_SUPPORT_PATCHES}"

# config_defaults.h is removed starting upstream v2020.06
SRC_URI_append_raspberrypi4-64 = " \
    file://Revert-remove-include-config_defaults.h.patch \
    file://rpi4-include-configs-Use-config-defaults.patch \
    file://pi4-fix-crash-when-issuing-usb-reset.patch \
"

# In production builds enable_uart is not set, and this makes
# the pi4 serial driver freeze. Let's not use this driver in
# production, because we don't want to output anything to the
# console anyway.
SRC_URI_append_raspberrypi4-64 = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'development-image', '', 'file://rpi4-disable-pl01-serial-driver.patch', d)} \
"
