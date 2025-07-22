SUMMARY = "Kunbus PiControl kernel module"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://src/COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://gitlab.com/revolutionpi/piControl;protocol=https;branch=master; \
	file://0001-Use-modules_install-as-wanted-by-yocto.patch \
	file://0002-Search-for-config-file-in-mnt-boot-instead-of-etc-re.patch \
"

# commit for tag 2.3.7
SRCREV = "a193da23444466592ab53523eda8e657a59fd6e5"

S = "${WORKDIR}/git"

EXTRA_OEMAKE:append = " KDIR=${STAGING_KERNEL_DIR}"
