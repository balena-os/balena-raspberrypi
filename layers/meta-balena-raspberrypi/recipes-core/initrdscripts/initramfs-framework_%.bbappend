FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
	file://cryptsetup-rpi \
"

PACKAGES:remove:revpi = "initramfs-module-migrate"
do_install:append:revpi() {
	rm -f ${D}/init.d/92-migrate
}

do_install:append() {
	install -d ${D}/init.d
	install -m 0755 ${WORKDIR}/cryptsetup-rpi ${D}/init.d/72-cryptsetup
	sed -i -e "s/@@BALENA_NONENC_BOOT_LABEL@@/${BALENA_NONENC_BOOT_LABEL}/g" ${D}/init.d/72-cryptsetup
}

RDEPENDS:initramfs-module-cryptsetup:append = " os-helpers-otp gnupg"
