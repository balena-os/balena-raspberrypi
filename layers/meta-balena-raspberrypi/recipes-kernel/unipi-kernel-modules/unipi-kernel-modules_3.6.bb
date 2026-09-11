SUMMARY = "UniPi Neuron/Axon kernel modules"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://github.com/UniPiTechnology/unipi-kernel-modules.git;protocol=https;nobranch=1 \
"

# Corresponds to 3.6 - the vendor's rework for kernel 6.1+ support (3.3:
# "Remove support for Linux older than 6.1"). The previously-pinned 2.80.8
# predates that rework and is why /dev/ttyNS* stopped appearing once this
# device type's shared kernel moved to 6.12.61
SRCREV = "3623cde6511758622eafe1b412fb69427e49004a"

S = "${WORKDIR}/git"

MODULES_MODULE_SYMVERS_LOCATION = "modules/unipi"
EXTRA_OEMAKE:append = " LINUX_DIR_PATH=${STAGING_KERNEL_DIR}"
