SUMMARY = "UniPi Neuron/Axon kernel modules"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://github.com/UniPiTechnology/unipi-kernel.git;protocol=https;nobranch=1 \
	file://0001-Fix-compile-on-kernel-5.10.patch \
"

SRCREV = "1.68"

S = "${WORKDIR}/git"

EXTRA_OEMAKE:append = " LINUX_DIR_PATH=${STAGING_KERNEL_DIR}"
