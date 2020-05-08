FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_append = " file://0001-Lower-the-bt-uart-baudrate-to-460800-for-rpi3-v1.2.patch"

do_install_append () {
    # Move udev rules into /lib as /etc/udev/rules.d is bind mounted for custom rules
    install -d ${D}${base_libdir}/udev/rules.d
    mv ${D}/etc/udev/rules.d/*.rules ${D}${base_libdir}/udev/rules.d/
}

FILES_${PN} += "/lib/udev/rules.d"
