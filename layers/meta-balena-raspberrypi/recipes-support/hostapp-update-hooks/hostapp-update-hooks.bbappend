FILESEXTRAPATHS:append := ":${THISDIR}/files"

HOSTAPP_HOOKS += " 99-resin-uboot 999-resin-boot-cleaner"
HOSTAPP_HOOKS:append:revpi-core-3 = " 9999-bootfiles"

HOSTAPP_HOOKS:remove:raspberrypi4-64 = "99-resin-uboot 999-resin-boot-cleaner"
HOSTAPP_HOOKS:append:raspberrypi4-64 = " 99-balena-bootloader"
