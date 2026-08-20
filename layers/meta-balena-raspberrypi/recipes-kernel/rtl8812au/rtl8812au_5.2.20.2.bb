SUMMARY = "Realtek 802.11n WLAN Adapter Linux driver"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://Kconfig;md5=4b85004ff83dd932ff28f7f348fb2a28"

inherit module

SRC_URI = " \
	git://github.com/gordboy/rtl8812au.git;protocol=https \
	file://0001-Use-modules_install-as-wanted-by-yocto.patch \
"

# Latest HEAD as of today
# We leave this here so we know which OS release
# contains which version of the driver. Using autorev
# makes it difficult to determine which version a build
# uses - may cause a staging build use one version and the
# prod use another
SRCREV = "772ad434b91a8cc1a0f5a0bd227d46a5caf610ec"

S = "${WORKDIR}/git"

EXTRA_OEMAKE_append = " KSRC=${STAGING_KERNEL_DIR}"
