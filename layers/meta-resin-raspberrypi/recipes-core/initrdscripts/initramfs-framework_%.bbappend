FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://usbflasher \
    "

do_install_append() {
    install -m 0755 ${WORKDIR}/usbflasher ${D}/init.d/20-usbflasher
}

PACKAGES_append = " \
    initramfs-module-usbflasher \
    "

SUMMARY_initramfs-module-usbflasher = "initramfs support for switching into USB flasher mode"
RDEPENDS_initramfs-module-usbflasher = "${PN}-base"
FILES_initramfs-module-usbflasher = "/init.d/20-usbflasher"
