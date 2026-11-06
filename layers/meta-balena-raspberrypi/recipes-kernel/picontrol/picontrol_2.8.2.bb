SUMMARY = "Kunbus PiControl kernel module"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://src/COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://gitlab.com/revolutionpi/piControl;protocol=https;branch=master; \
	file://0001-Search-for-config-file-in-mnt-boot-instead-of-etc-re.patch \
"

# v2.8.2
SRCREV = "7980b36f361a8c31680dbd1cbc8d567a7afa4a38"

S = "${WORKDIR}/git"

EXTRA_OEMAKE:append = " KDIR=${STAGING_KERNEL_DIR}"
