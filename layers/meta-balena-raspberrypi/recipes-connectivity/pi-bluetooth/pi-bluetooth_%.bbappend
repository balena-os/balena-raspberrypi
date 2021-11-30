# Should be removed when we update the upstream meta-raspberrypi
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRCREV = "fd4775bf90e037551532fc214a958074830bb80d"

SRC_URI_remove = "file://0001-bthelper-correct-path-for-hciconfig-under-Yocto.patch"

SRC_URI_append = " \
	file://0002-bthelper-correct-path-for-hciconfig-under-Yocto.patch \
	file://0003-bthelper-Set-BDADDR-if-not-initialized.patch \
"

do_install_append () {
    # Move udev rules into /lib as /etc/udev/rules.d is bind mounted for custom rules
    install -d ${D}${base_libdir}/udev/rules.d
    mv ${D}/etc/udev/rules.d/*.rules ${D}${base_libdir}/udev/rules.d/
}

FILES_${PN} += "/lib/udev/rules.d"
