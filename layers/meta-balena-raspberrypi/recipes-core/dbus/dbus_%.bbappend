FILESEXTRAPATHS:append:nebra-hnt := ":${THISDIR}/files"

SRC_URI:append:nebra-hnt = " \
        file://com.helium.Miner.conf \
"

do_install:append:nebra-hnt() {
    install -d ${D}${sysconfdir}/dbus-1/system.d
    install -m 644  ${WORKDIR}/com.helium.Miner.conf ${D}/etc/dbus-1/system.d
}
