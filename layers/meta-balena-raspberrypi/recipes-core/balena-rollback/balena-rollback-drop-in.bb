FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

DESCRIPTION = "BalenaOS Rollback Drop-In"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${RESIN_COREBASE}/COPYING.Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

SRC_URI = " \
    file://tegra-drop-in.conf \
    "
S = "${WORKDIR}"

inherit allarch

do_install() {
    install -d ${D}${systemd_unitdir}/system/rollback-altboot.service.d
    install -c -m 0644 ${S}/tegra-drop-in.conf ${D}${systemd_unitdir}/system/rollback-altboot.service.d
}

FILES_${PN} = "/lib/systemd/system/rollback-altboot.service.d/tegra-drop-in.conf"
