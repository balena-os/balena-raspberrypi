FILESEXTRAPATHS_append := ":${THISDIR}/files"

HOSTAPP_HOOKS += " 99-resin-uboot 999-resin-boot-cleaner"
HOSTAPP_HOOKS_append_revpi-core-3 = " 9999-bootfiles"
