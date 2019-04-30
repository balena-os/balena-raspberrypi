FILESEXTRAPATHS_append := ":${THISDIR}/files"

RPIFW_DATE = "20181112"
SRCREV = "12e0bf86e08d6067372bc0a45d7e8a10d3113210"

SRC_URI[md5sum] = "1d6b3dc59aa4fc4ff53470682e709fbc"
SRC_URI[sha256sum] = "4cc835ba0f437de494b391df7fdb88c96e6264a6c06a2c9e8371e304945e7540"

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
