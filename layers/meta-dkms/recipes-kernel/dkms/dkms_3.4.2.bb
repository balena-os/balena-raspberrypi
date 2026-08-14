SUMMARY = "DKMS - Dynamic Kernel Module Support"
HOMEPAGE = "https://github.com/dkms-project/dkms"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"

# Adapted from ni/openembedded-core@5789a27b68d95f3840bb8c4cb0d7b28d538c9a50
SRC_URI = "https://github.com/dkms-project/${BPN}/archive/v${PV}.tar.gz"

SRC_URI[sha256sum] = "cee890e478e5e38228c83262509bf5931d894670a1832ffcf534268ccfc4f302"

INSANE_SKIP:${PN} += "dev-deps"

RDEPENDS:${PN} += "bash kmod gcc binutils libc-dev libgcc-dev make patch"

do_install() {
    oe_runmake install DESTDIR="${D}"
    rm -rf ${D}${datadir}/bash-completion ${D}${datadir}/zsh
}
