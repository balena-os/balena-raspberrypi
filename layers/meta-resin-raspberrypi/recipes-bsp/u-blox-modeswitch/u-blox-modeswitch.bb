SUMMARY = "Switch u-blox modem from RNDIS to ECM mode"

LICENSE="Apache-2.0"
LIC_FILES_CHKSUM = "file://${RESIN_COREBASE}/COPYING.Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

DESCRIPTION = "Package contains udev rule and systemd service for switching u-blox modems from RNDIS to ECM mode. \
The mode switch is necessary to fix the problem of connecting to Resin VPN when the modem is in RNDIS mode on \
ResinOS version >2.3.0"

SRC_URI = 	"file://99-u-blox_switch_to_ecm.rules \
		file://u-blox-switch@.service \
		file://u-blox-switch.sh \
"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/u-blox-switch.sh ${D}${bindir}
    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/99-u-blox_switch_to_ecm.rules ${D}${sysconfdir}/udev/rules.d

    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
        install -m 0644 ${WORKDIR}/u-blox-switch@.service ${D}${systemd_unitdir}/system
    fi
}

FILES_${PN} = " \
  /etc/udev/rules.d/99-u-blox_switch_to_ecm.rules \
  /lib/systemd/system/u-blox-switch@.service \
  /usr/bin/u-blox-switch.sh \
"
