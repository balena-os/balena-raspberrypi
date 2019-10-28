FILESEXTRAPATHS_append := ":${THISDIR}/files"

HOSTAPP_HOOKS += " 99-resin-uboot 999-resin-boot-cleaner"
HOSTAPP_HOOKS_append_revpi-core-3 = " 9999-bootfiles"
HOSTAPP_HOOKS_DIRS_append_raspberrypi4-64 = " 98-pieeprom"
HOSTAPP_HOOKS_append_raspberrypi4-64 = " 98-pieeprom/before 98-pieeprom/forward 98-pieeprom/after"
