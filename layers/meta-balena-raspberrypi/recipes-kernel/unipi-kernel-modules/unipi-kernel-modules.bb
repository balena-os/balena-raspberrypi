SUMMARY = "UniPi Neuron/Axon kernel modules"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://github.com/UniPiTechnology/unipi-kernel-modules.git;protocol=https;nobranch=1 \
"

# Corresponds to 2.80.8
SRCREV = "06ff9e5faa7a466e3feecbd6feefae5edb50f804"

S = "${WORKDIR}/git"

MODULES_MODULE_SYMVERS_LOCATION = "modules/unipi"
EXTRA_OEMAKE:append = " LINUX_DIR_PATH=${STAGING_KERNEL_DIR}"
