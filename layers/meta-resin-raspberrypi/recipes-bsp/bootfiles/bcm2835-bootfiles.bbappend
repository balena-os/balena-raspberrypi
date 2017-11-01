# exclude from resinOS the binaries with additional debug assertions (they grow the used size in resin-boot and this potentially breaks hostapps update)
do_deploy_append() {
    rm ${DEPLOYDIR}/${PN}/fixup_db.dat
    rm ${DEPLOYDIR}/${PN}/start_db.elf
}
