SUMMARY = "Kunbus PiControl kernel module"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://gitlab.com/revolutionpi/piControl;protocol=https;branch=master; \
	file://0001-Use-modules_install-as-wanted-by-yocto.patch \
	file://0002-Search-config-file-in-mnt-boot.patch \
"
SRCREV = "79ad74f89ad7485a67de8fc90907a2e98f314c5f"

S = "${WORKDIR}/git"

EXTRA_OEMAKE:append = " KDIR=${STAGING_KERNEL_DIR}"
