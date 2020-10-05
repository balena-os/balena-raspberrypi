FILESEXTRAPATHS_prepend_revpi := "${THISDIR}/files:"

SRC_URI_append_revpi = "\
	file://resin-boot.conf \
"

do_install_append_revpi() {
	install -d ${D}${sysconfdir}/systemd/system/resin-boot.service.d
	install -m 0644 resin-boot.conf ${D}${sysconfdir}/systemd/system/resin-boot.service.d/
}
