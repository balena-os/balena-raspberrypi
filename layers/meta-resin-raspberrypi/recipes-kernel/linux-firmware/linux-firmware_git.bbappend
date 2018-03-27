FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://brcmfmac43455-sdio.bin \
    file://brcmfmac43455-sdio.clm_blob \
    file://brcmfmac43455-sdio.txt \
    file://sd8887_uapsta.bin"

# Install a newer SD8887 firmware
do_install_append() {
    cp ${WORKDIR}/brcmfmac43455-sdio.* ${D}/lib/firmware/brcm
    cp ${WORKDIR}/sd8887_uapsta.bin ${D}${nonarch_base_libdir}/firmware/mrvl/
}

PACKAGES =+ "${PN}-bcm43455"

FILES_${PN}-bcm43455 = " \
    /lib/firmware/brcm/brcmfmac43455-sdio.* \
"
