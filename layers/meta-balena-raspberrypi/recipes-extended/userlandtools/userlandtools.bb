FILESEXTRAPATHS_append := ":${THISDIR}/files"

DESCRIPTION = "This repository contains the source code for ARM side \
libraries and host binaries used on Raspberry Pi."
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENCE;md5=0448d6488ef8cc380632b1569ee6d196"

SRC_URI = "\
           git://github.com/${SRCFORK}/userland.git;protocol=git;branch=${SRCBRANCH} \
           file://0001-dtoverlay_main-Fix-configfs-mount-failure.patch \
"

COMPATIBLE_MACHINE = "raspberrypi4-64"

SRCBRANCH = "master"
SRCFORK = "raspberrypi"
SRCREV = "17d2fdc1abd370e09ba7074753294c7976dd6b0d"

# Use the date of the above commit as the package version. Update this when
# SRCREV is changed.
PV = "20190724"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

ASNEEDED = ""
EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS='-Wl,--no-as-needed' \
                 -DVMCS_INSTALL_PREFIX=${exec_prefix} -DARM64=ON "

# Keep only those libs & bins that are actually
# used during boot EEPROM image update
do_install_append () {
        rm -rf ${D}${bindir}/tvservice
        rm -rf ${D}${bindir}/vchiq_test
        rm -rf ${D}${bindir}/dtmerge
        rm -rf ${D}${prefix}/include
        rm -rf ${D}${prefix}/src
        rm -rf ${D}${libdir}/pkgconfig
        rm -rf ${D}${libdir}/*debug*
        rm -rf ${D}${libdir}/*host*
        rm -rf ${D}${libdir}/*.a
        rm -rf ${D}${bindir}/*post
        rm -rf ${D}${bindir}/*pre
}

# Shared libs from userland package build aren't versioned, so we need
# to force the .so files into the runtime package (and keep them
# out of -dev package).
FILES_SOLIBSDEV = ""
INSANE_SKIP_${PN} += "dev-so"
FILES_${PN} += " ${libdir}/*.so "
RDEPENDS_${PN} += "bash"
