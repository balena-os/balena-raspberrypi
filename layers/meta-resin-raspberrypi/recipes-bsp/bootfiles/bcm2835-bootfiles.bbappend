FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI += " \
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
