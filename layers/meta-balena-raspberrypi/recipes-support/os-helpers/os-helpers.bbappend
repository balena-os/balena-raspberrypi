FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

SRC_URI += " \
    file://os-helpers-otp \
    file://os-helpers-sb \
"

RDEPENDS:${PN}-sb = "os-helpers-otp"
RDEPENDS:${PN}-otp:raspberrypi4-64 = "userlandtools"

PACKAGES += " \
	${PN}-otp \
"

do_install:append() {
	install -m 0775 ${WORKDIR}/os-helpers-otp ${D}${libexecdir}
	install -m 0775 ${WORKDIR}/os-helpers-sb ${D}${libexecdir}
	sed -i -e "s,@@KERNEL_IMAGETYPE@@,${KERNEL_IMAGETYPE},g" ${D}${libexecdir}/os-helpers-sb
	sed -i -e "s,@@BALENA_IMAGE_FLAG_FILE@@,${BALENA_IMAGE_FLAG_FILE},g" ${D}${libexecdir}/os-helpers-sb
}

FILES:${PN}-otp = "${libexecdir}/os-helpers-otp"
