FILESEXTRAPATHS_append := ":${THISDIR}/files"

RPIFW_DATE = "20180924"
SRCREV = "5b49caa17e91d0e64024380119ad739bb201c674"

SRC_URI[md5sum] = "51352972a029c6f47bde6d302b69440e"
SRC_URI[sha256sum] = "d1f9c58957dfe681fff7e1cf1eabb9e0f6fdc99720f1d059fb24a37750573310"

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
