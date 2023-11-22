FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

SRC_URI += " \
    file://os-helpers-otp \
"

RDEPENDS:${PN}-otp = "userlandtools"


PACKAGES += " \
	${PN}-otp \
"

do_install:append() {
	install -m 0775 ${WORKDIR}/os-helpers-otp ${D}${libexecdir}
}

FILES:${PN}-otp = "${libexecdir}/os-helpers-otp"
