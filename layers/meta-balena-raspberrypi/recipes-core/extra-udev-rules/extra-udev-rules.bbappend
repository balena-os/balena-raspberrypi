FILESEXTRAPATHS:append := ":${THISDIR}/files"

SRC_URI:append = " \
	file://86-nm-unmanaged-fin.rules \
	"

do_install:append:fincm3() {
	# Install balenaFin uAP interface rules
	install -D -m 0644 ${WORKDIR}/86-nm-unmanaged-fin.rules ${D}/lib/udev/rules.d/86-nm-unmanaged-fin.rules
}
