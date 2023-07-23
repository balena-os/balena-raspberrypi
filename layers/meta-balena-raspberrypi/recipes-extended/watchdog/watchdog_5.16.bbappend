SYSTEMD_AUTO_ENABLE:raspberrypi4-superhub = "enable"

FILESEXTRAPATHS:prepend:raspberrypi4-superhub := "${THISDIR}/${PN}:"

SRC_URI:append:raspberrypi4-superhub = " \
    file://0001-Move-watchdog-service-before-networking.patch \
"
