FILESEXTRAPATHS:append := ":${THISDIR}/files"

HOSTAPP_HOOKS += " 99-resin-uboot 999-resin-boot-cleaner"
HOSTAPP_HOOKS:append:revpi-core-3 = " 9999-bootfiles"

HOSTAPP_HOOKS:remove:raspberrypi5 = "99-resin-uboot 999-resin-boot-cleaner"
HOSTAPP_HOOKS:append:raspberrypi5 = " 99-balena-bootloader"

HOSTAPP_HOOKS:append:raspberrypi4-64 = " 98-pieeprom"
RDEPENDS:${PN}:append:raspberrypi4-64 = " rpi-eeprom"
