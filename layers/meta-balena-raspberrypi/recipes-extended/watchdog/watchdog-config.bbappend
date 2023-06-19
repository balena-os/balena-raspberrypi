FILESEXTRAPATHS:append:raspberrypi4-superhub := ":${THISDIR}/watchdog-config:${THISDIR}/${BPN}"

SRC_URI:append:raspberrypi4-superhub = " \
    file://watchdog-phoenix.conf \
"

FILES:${PN}:append:raspberrypi4-superhub = " ${sysconfdir}/*"

do_install:append:raspberrypi4-superhub() {
    install -Dm 0644 ${WORKDIR}/watchdog-phoenix.conf ${D}${sysconfdir}/watchdog.conf
}
