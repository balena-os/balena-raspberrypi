FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI += " \
    file://fincm3-dt-blob.bin \
"

do_deploy_append() {
    # exclude from resinOS the binaries with additional debug assertions (they
    # grow the used size in resin-boot and this potentially breaks hostapps
    # update)
    rm ${DEPLOYDIR}/${PN}/fixup_db.dat
    rm ${DEPLOYDIR}/${PN}/start_db.elf
}

do_deploy_append_fincm3() {
    # Install the dt-blob needed for camera support in Balena Fin CM3
    install -m 644 ${WORKDIR}/fincm3-dt-blob.bin ${DEPLOYDIR}/${PN}/dt-blob.bin
}
