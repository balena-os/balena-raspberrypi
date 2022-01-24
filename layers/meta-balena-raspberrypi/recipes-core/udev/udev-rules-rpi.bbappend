do_install:append () {
    # Move udev rules into /lib as /etc/udev/rules.d is bind mounted for custom rules
    install -d ${D}${base_libdir}/udev/rules.d
    mv ${D}/etc/udev/rules.d/*.rules ${D}${base_libdir}/udev/rules.d/
}
