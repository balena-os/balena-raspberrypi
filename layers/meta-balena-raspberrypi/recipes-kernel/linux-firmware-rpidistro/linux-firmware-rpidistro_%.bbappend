SRCREV = "b66ab26cebff689d0d3257f56912b9bb03c20567"
PV = "20190114-1+rpt10"

do_install_append() {
     install -m 0644 brcm/brcmfmac43456-sdio.* ${D}${nonarch_base_libdir}/firmware/brcm/
}

PACKAGES += " \
    ${PN}-bcm43456 \
"

LICENSE_${PN}-bcm43456 = "Firmware-broadcom_bcm43xx-rpidistro"
FILES_${PN}-bcm43456 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43456*"
RDEPENDS_${PN}-bcm43456 += "${PN}-broadcom-license"

RCONFLICTS_${PN}-bcm43456 = " \
    linux-firmware-bcm43456 \
    linux-firmware-raspbian-bcm43456 \
"
RREPLACES_${PN}-bcm43456 = " \
    linux-firmware-bcm43456 \
    linux-firmware-raspbian-bcm43456 \
"
