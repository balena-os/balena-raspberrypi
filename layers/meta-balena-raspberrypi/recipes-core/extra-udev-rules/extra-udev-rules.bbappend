FILESEXTRAPATHS:append := ":${THISDIR}/files"

SRC_URI:append = " \
	file://50-revpi.rules \
	file://86-nm-unmanaged-fin.rules \
	file://revpi_mac \
	file://51-hailo-udev.rules \
	"

do_install:append:fincm3() {
	# Install balenaFin uAP interface rules
	install -D -m 0644 ${WORKDIR}/86-nm-unmanaged-fin.rules ${D}/lib/udev/rules.d/86-nm-unmanaged-fin.rules
}

do_install:append:revpi() {
	# Install RevPi specific rules
	install -D -m 0644 ${WORKDIR}/50-revpi.rules ${D}/lib/udev/rules.d/50-revpi.rules
	install -D -m 0755 ${WORKDIR}/revpi_mac ${D}/lib/udev/revpi_mac
}

do_install:append:raspberrypi5() {
	# Install hailo AI accelerator rules
	install -D -m 0644 ${WORKDIR}/51-hailo-udev.rules ${D}/lib/udev/rules.d/51-hailo-udev.rules
}

RDEPENDS:${PN}:append:revpi = "bash"
