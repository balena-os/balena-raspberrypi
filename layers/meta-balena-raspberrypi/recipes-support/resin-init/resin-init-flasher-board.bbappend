FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

RDEPENDS:${PN}:append:raspberrypi4-64 = " os-helpers-logging rpi-eeprom"
RDEPENDS:${PN}:append:raspberrypi5 = " os-helpers-logging rpi-eeprom"
