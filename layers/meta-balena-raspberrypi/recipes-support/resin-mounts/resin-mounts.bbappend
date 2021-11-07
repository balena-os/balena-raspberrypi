FILESEXTRAPATHS:prepend:revpi := "${THISDIR}/files:"

SRC_URI:append:revpi = "\
	file://resin-boot.conf \
"

do_install:append:revpi() {
	install -d ${D}${sysconfdir}/systemd/system/resin-boot.service.d
	install -m 0644 resin-boot.conf ${D}${sysconfdir}/systemd/system/resin-boot.service.d/
}
