FILESEXTRAPATHS_append := ":${THISDIR}/files"

RPIFW_DATE = "20210421"
SRCREV = "2ac4de4eaac5c1d1b25acec4a5e0a9fdb16f0c91"

SRC_URI[md5sum] = "43c92418c2634d4c0c8ce3da696dcad5"
SRC_URI[sha256sum] = "c687aa1b5127a8dc0773e8aefb1f009f24bf71ccb4c9e8b40a1d46cbbb7bee0c"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

SRC_URI += " \
    file://fincm3-dt-blob.bin \
"

do_deploy_append() {
    # exclude from balenaOS the binaries with additional debug assertions (they
    # grow the used size in resin-boot and this potentially breaks hostapps
    # update)
    rm -f ${DEPLOYDIR}/${PN}/fixup_db.dat
    rm -f ${DEPLOYDIR}/${PN}/start_db.elf
    rm -f ${DEPLOYDIR}/${PN}/fixup4db.dat
    rm -f ${DEPLOYDIR}/${PN}/start4db.elf
    if [ "${MACHINE}" != "raspberrypi4-64" ] && [ "${MACHINE}" != "rt-rpi-300" ] && [ "${MACHINE}" != "raspberrypi400-64" ] && [ "${MACHINE}" != "raspberrypicm4-ioboard" ] ; then
        # exclude RaspberryPi4 specific firmware from non raspberrypi4-64 balenaOS builds
        rm -f ${DEPLOYDIR}/${PN}/fixup4.dat
        rm -f ${DEPLOYDIR}/${PN}/fixup4cd.dat
        rm -f ${DEPLOYDIR}/${PN}/fixup4x.dat
        rm -f ${DEPLOYDIR}/${PN}/start4.elf
        rm -f ${DEPLOYDIR}/${PN}/start4cd.elf
        rm -f ${DEPLOYDIR}/${PN}/start4x.elf
    else
        # exclude from raspberrypi4-64 balenaOS the binaries which are for previous RaspberryPi versions
        rm -f ${DEPLOYDIR}/${PN}/fixup.dat
        rm -f ${DEPLOYDIR}/${PN}/fixup_cd.dat
        rm -f ${DEPLOYDIR}/${PN}/fixup_x.dat
        rm -f ${DEPLOYDIR}/${PN}/start.elf
        rm -f ${DEPLOYDIR}/${PN}/start_cd.elf
        rm -f ${DEPLOYDIR}/${PN}/start_x.elf
	# bootcode.bin is not used anymore on rpi4 as the boot code is now in an EEPROM (https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md)
	rm -f ${DEPLOYDIR}/${PN}/bootcode.bin
    fi
}

do_deploy_append_fincm3() {
    # Install the dt-blob needed for camera support in Balena Fin CM3
    install -m 644 ${WORKDIR}/fincm3-dt-blob.bin ${DEPLOYDIR}/${PN}/dt-blob.bin
}
