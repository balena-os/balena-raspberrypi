FILESEXTRAPATHS:append := ":${THISDIR}/files"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

SRC_URI += " \
    file://fincm3-dt-blob.bin \
"

# 1 out of 3 Pi4s in the rig cannot boot with firmware newer than 2021.04
# See internal discussion: https://www.flowdock.com/app/rulemotion/device-testing/threads/oOxI7aUO_0eAR3YpxXaXpUfMSO0
RPIFW_DATE = "20220120"
SRCREV = "c6d56567ff6ef17fd85159770f22abcf2c5953ed"

SRC_URI[md5sum] = "fb3890d4ae3f4caf432698e944989254"
SRC_URI[sha256sum] = "9324356498f1b6a21f2af1229604c4de7c3b3ee8cc3e2b08c290366a0534fa75"

do_deploy:append() {
    # exclude from balenaOS the binaries with additional debug assertions (they
    # grow the used size in resin-boot and this potentially breaks hostapps
    # update)
    rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup_db.dat
    rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start_db.elf
    rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup4db.dat
    rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start4db.elf
    if [ "${MACHINE}" != "raspberrypi4-64" ] && [ "${MACHINE}" != "rt-rpi-300" ] && [ "${MACHINE}" != "raspberrypi400-64" ] && [ "${MACHINE}" != "raspberrypicm4-ioboard" ] ; then
        # exclude RaspberryPi4 specific firmware from non raspberrypi4-64 balenaOS builds
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup4.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup4cd.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup4x.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start4.elf
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start4cd.elf
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start4x.elf
    else
        # exclude from raspberrypi4-64 balenaOS the binaries which are for previous RaspberryPi versions
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup_cd.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup_x.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start.elf
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start_cd.elf
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start_x.elf
	# bootcode.bin is not used anymore on rpi4 as the boot code is now in an EEPROM (https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md)
	rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/bootcode.bin
    fi
}

do_deploy:append:fincm3() {
    # Install the dt-blob needed for camera support in Balena Fin CM3
    install -m 644 ${WORKDIR}/fincm3-dt-blob.bin ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/dt-blob.bin
}
