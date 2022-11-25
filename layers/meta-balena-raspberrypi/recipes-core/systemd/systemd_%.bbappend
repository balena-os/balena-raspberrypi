FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

SRC_URI:prepend = " \
    file://watchdog_shutdown.conf \
"

do_install:append() {
    install -d -m 0755 ${D}/${sysconfdir}/systemd/system.conf.d
    install -m 0644 ${WORKDIR}/watchdog_shutdown.conf ${D}/${sysconfdir}/systemd/system.conf.d
}
