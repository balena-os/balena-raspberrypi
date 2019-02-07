SUMMARY = "Kunbus PiControl kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://github.com/RevolutionPi/piControl;branch=revpi-4.14 \
	file://0001-Use-modules_install-as-wanted-by-yocto.patch \
	file://0002-Search-config-file-in-mnt-boot.patch \
"

SRCREV ="f3f4e463d0269d8e4ef2b0a8d599cbf759326427"

S = "${WORKDIR}/git"

EXTRA_OEMAKE_append = " KDIR=${STAGING_KERNEL_DIR}"
