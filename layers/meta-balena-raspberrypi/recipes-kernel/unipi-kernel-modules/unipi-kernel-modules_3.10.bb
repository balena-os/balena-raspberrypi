SUMMARY = "UniPi Neuron/Axon kernel modules"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://github.com/UniPiTechnology/unipi-kernel-modules.git;protocol=https;nobranch=1 \
"

# Corresponds to 3.10
SRCREV = "ffc6bfaf4d26adcdf3c85e5ee642f58b6d9d3117"

S = "${WORKDIR}/git"

MODULES_MODULE_SYMVERS_LOCATION = "modules/unipi-mfd"
EXTRA_OEMAKE:append = " LINUX_DIR_PATH=${STAGING_KERNEL_DIR}"
