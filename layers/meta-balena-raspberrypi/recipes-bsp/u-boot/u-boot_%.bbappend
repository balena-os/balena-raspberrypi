inherit resin-u-boot
UBOOT_KCONFIG_SUPPORT = "1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/raspberrypi400-64:"

# Remove patch inherited from meta-raspberrypi already upstream in v2018.07
SRC_URI_remove = " file://0002-rpi_0_w-Add-configs-consistent-with-RpI3.patch "

# Remove patch inherited from meta-resin. This needs to be rebased for v2018.07
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch "

RPI_PATCHES = " \
    file://rpi-Use-CONFIG_OF_BOARD-instead-of-CONFIG_EMBED.patch \
    file://increase-usb-interface-nr.patch \
    file://0002-raspberrypi-Disable-simple-framebuffer-support.patch \
    file://0001-avoid-block-uart-write.patch \
"

SRC_URI += " \
    file://0001-Integrate-machine-independent-resin-environment-conf.patch \
    ${RPI_PATCHES} \
"

# Disable flasher check since it starts usb unnecessarily
# and we don't generate flasher images for any of the RPIs.
SRC_URI_append = " \
    file://0001-rpi-Disable-image-flasher-check.patch \
"

RESIN_UBOOT_DEVICE_TYPES_append = " usb"

# Patches for rpi4 usb support are not part of upstream u-boot v2020.07,
# but are merged in master branch
SRCREV_raspberrypi4-64 = "49cf75101db58ad3540d8de6749cf0c1d780dc76"

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

# config_defaults.h is removed starting usptream v2020.06
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

# Switch to u-boot 2020.10-rc5 to include pi400/cm4 u-boot patches that are
# not yet merged in upstream. Pi4 1G does not boot from USB with this version,
# so we keep it only for the Pi400 for now.
# These patches were reworked to apply u-boot 2020.10-rc5
# from: http://patchwork.ozlabs.org/project/uboot/list/?series=215597
SRCREV_raspberrypi400-64 = "ba2a0cbb053951ed6d36161989d38da724696b4d"
LIC_FILES_CHKSUM_raspberrypi400-64 = " file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"

SRC_URI_append_raspberrypi400-64 = " \
    file://0001-pi400-rpi-Add-rpi-400-model-to-known-types.patch \
    file://0002-pi400-pi-Add-identifier-for-the-new-CM4.patch \
    file://0003-pi400-pci-pcie-brcmstb-Fix-inbound-window-configurations.patch \
    file://0004-pi400-dm-Introduce-xxx_get_dma_range.patch \
    file://0005-pi400-dm-Introduce-DMA-constraints-into-the-core-device-mo.patch \
    file://0006-pi400-dm-Introduce-dev_phys_to_bus-dev_bus_to_phys.patch \
    file://0007-pi400-xhci-translate-virtual-addresses-into-the-bus-s-addr.patch \
    file://0008-pi400-mmc-Introduce-mmc_phys_to_bus-mmc_bus_to_phys.patch \
    file://0009-rpi400-usb-xhci-xhci_bulk_tx-Don-t-BUG-when-comparing-addre.patch \
"
