FILESEXTRAPATHS:append := ":${THISDIR}/files"

SRC_URI:append = " \
	file://86-nm-unmanaged-fin.rules \
	"

do_install:append:fincm3() {
	# Install balenaFin uAP interface rules
	install -D -m 0644 ${WORKDIR}/86-nm-unmanaged-fin.rules ${D}/lib/udev/rules.d/86-nm-unmanaged-fin.rules
}

do_install:append:revpi-connect-4() {
	# Install RevPi specific rules
	install -D -m 0644 ${WORKDIR}/50-revpi.rules ${D}/lib/udev/rules.d/50-revpi.rules
	install -D -m 0755 ${WORKDIR}/revpi_mac ${D}/lib/udev/revpi_mac
}

do_install:append:revpi-connect-s() {
	# Install RevPi specific rules
	install -D -m 0644 ${WORKDIR}/50-revpi.rules ${D}/lib/udev/rules.d/50-revpi.rules
	install -D -m 0755 ${WORKDIR}/revpi_mac ${D}/lib/udev/revpi_mac
}

do_install:append:revpi-connect() {
	# Install RevPi specific rules
	install -D -m 0644 ${WORKDIR}/50-revpi.rules ${D}/lib/udev/rules.d/50-revpi.rules
	install -D -m 0755 ${WORKDIR}/revpi_mac ${D}/lib/udev/revpi_mac
}

do_install:append:revpi-core-3() {
	# Install RevPi specific rules
	install -D -m 0644 ${WORKDIR}/50-revpi.rules ${D}/lib/udev/rules.d/50-revpi.rules
	install -D -m 0755 ${WORKDIR}/revpi_mac ${D}/lib/udev/revpi_mac
}
