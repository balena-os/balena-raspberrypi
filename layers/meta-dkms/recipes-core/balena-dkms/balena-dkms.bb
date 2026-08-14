DESCRIPTION = "On-device DKMS build/load machinery for the dkms hostapp extension"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${BALENA_COREBASE}/COPYING.Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

SRC_URI = " \
    file://balena-dkms \
    file://balena-dkms.service \
    "

RDEPENDS:${PN} += "dkms"

INSANE_SKIP:${PN} += "file-rdeps"

inherit allarch systemd

SYSTEMD_SERVICE:${PN} = " \
    balena-dkms.service \
    "

FILES:${PN} += "${systemd_system_unitdir}/multi-user.target.wants"

do_patch[noexec] = "1"
do_compile[noexec] = "1"
do_build[noexec] = "1"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${UNPACKDIR}/balena-dkms ${D}${bindir}/

    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
        install -d ${D}${systemd_system_unitdir}/
        install -m 0644 ${UNPACKDIR}/balena-dkms.service ${D}${systemd_system_unitdir}/

        sed -i -e 's,@BINDIR@,${bindir},g' \
            ${D}${systemd_system_unitdir}/balena-dkms.service

        install -d ${D}${systemd_system_unitdir}/multi-user.target.wants/
        ln -sf ../balena-dkms.service ${D}${systemd_system_unitdir}/multi-user.target.wants/balena-dkms.service

    fi
}
