FILESEXTRAPATHS_append := ":${THISDIR}/files"

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
    if [ "${MACHINE}" != "raspberrypi4-64" ]; then
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
    fi
}

do_deploy_append_fincm3() {
    # Install the dt-blob needed for camera support in Balena Fin CM3
    install -m 644 ${WORKDIR}/fincm3-dt-blob.bin ${DEPLOYDIR}/${PN}/dt-blob.bin
}
