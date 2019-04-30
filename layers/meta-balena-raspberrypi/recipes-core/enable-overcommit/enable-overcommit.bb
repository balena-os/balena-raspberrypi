DESCRIPTION = "Enable memory overcommit"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${RESIN_COREBASE}/COPYING.Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

SRC_URI = "file://enable-overcommit.conf"

do_install() {
	mkdir -p ${D}${sysconfdir}/sysctl.d
	install -m 0644 ${WORKDIR}/enable-overcommit.conf ${D}${sysconfdir}/sysctl.d
}
