SUMMARY = "Kunbus PiControl kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://github.com/RevolutionPi/piControl;protocol=https; \
	file://0001-Use-modules_install-as-wanted-by-yocto.patch \
	file://0002-Search-config-file-in-mnt-boot.patch \
"

SRCREV ="raspberrypi-kernel_9.20200616-4.19.95+revpi1"

S = "${WORKDIR}/git"

EXTRA_OEMAKE:append = " KDIR=${STAGING_KERNEL_DIR}"
