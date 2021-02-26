FILESEXTRAPATHS_append_nebra-hnt := ":${THISDIR}/files"

SRC_URI_append_nebra-hnt = " \
        file://com.helium.Miner.conf \
"

do_install_append_nebra-hnt() {
    install -d ${D}${sysconfdir}/dbus-1/system.d
    install -m 644  ${WORKDIR}/com.helium.Miner.conf ${D}/etc/dbus-1/system.d
}
