FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
	file://cryptsetup-rpi \
	file://kexec_pi4_fwgpio \
"

PACKAGES:append = " initramfs-module-kexec-pi4-fwgpio"
SUMMARY:initramfs-module-kexec-pi4-fwgpio = "Hook necessary to persist the value of Pi4/CM4 firmware GPIOs after kexec"
RDEPENDS:initramfs-module-kexec-pi4-fwgpio = "initramfs-module-kexec"
FILES:initramfs-module-kexec-pi4-fwgpio = "/init.d/73-kexec_pi4_fwgpio"

PACKAGES:remove:revpi = "initramfs-module-migrate"
do_install:append:revpi() {
	rm -f ${D}/init.d/92-migrate
}

do_install:append() {
	install -d ${D}/init.d

	install -m 0755 ${WORKDIR}/cryptsetup-rpi ${D}/init.d/72-cryptsetup
	sed -i -e "s/@@BALENA_NONENC_BOOT_LABEL@@/${BALENA_NONENC_BOOT_LABEL}/g" ${D}/init.d/72-cryptsetup

	install -m 0755 ${WORKDIR}/kexec_pi4_fwgpio ${D}/init.d/73-kexec_pi4_fwgpio
}

RDEPENDS:initramfs-module-cryptsetup:append = " os-helpers-otp gnupg"
