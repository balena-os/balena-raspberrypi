FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

INTERNAL_DEVICE_KERNEL = "mmcblk?"

SRC_URI:append = " \
    file://balena-init-flasher-rpi-secureboot \
    file://balena-init-flasher-rpi-diskenc \
"

do_install:append() {
	if [ "x${SIGN_API}" != "x" ]; then
		install -d ${D}${libexecdir}
		install -m 0755 ${WORKDIR}/balena-init-flasher-rpi-secureboot ${D}${libexecdir}/balena-init-flasher-secureboot
		sed -i -e "s,@@BALENA_FINGERPRINT_FILENAME@@,${BALENA_FINGERPRINT_FILENAME},g" ${D}${libexecdir}/balena-init-flasher-secureboot
		sed -i -e "s,@@BALENA_NONENC_BOOT_LABEL@@,${BALENA_NONENC_BOOT_LABEL},g" ${D}${libexecdir}/balena-init-flasher-secureboot
		sed -i -e "s,@@BALENA_FINGERPRINT_EXT@@,${BALENA_FINGERPRINT_EXT},g" ${D}${libexecdir}/balena-init-flasher-secureboot
		install -m 0755 ${WORKDIR}/balena-init-flasher-rpi-diskenc ${D}${libexecdir}/balena-init-flasher-diskenc
	fi
}

RDEPENDS:${PN}:append = "${@oe.utils.conditional('SIGN_API','','',' os-helpers-sb gnupg',d)}"
