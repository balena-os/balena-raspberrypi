FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI += " \
    file://fincm3-dt-blob.bin \
    file://fixup.dat \
    file://fixup_cd.dat \
    file://fixup_x.dat \
    file://start.elf \
    file://start_cd.elf \
    file://start_x.elf \
"

# exclude from resinOS the binaries with additional debug assertions (they grow the used size in resin-boot and this potentially breaks hostapps update)
do_deploy_append() {
    rm ${DEPLOYDIR}/${PN}/fixup_db.dat
    rm ${DEPLOYDIR}/${PN}/start_db.elf

    for i in ${WORKDIR}/*.elf ; do
        cp $i ${DEPLOYDIR}/${PN}
    done

    for i in ${WORKDIR}/*.dat ; do
        cp $i ${DEPLOYDIR}/${PN}
    done
}

do_deploy_append_fincm3() {
    # Install the dt-blob needed for camera support in Balena Fin CM3
    install -m 644 ${WORKDIR}/fincm3-dt-blob.bin ${DEPLOYDIR}/${PN}/dt-blob.bin
}
