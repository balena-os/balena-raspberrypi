LIC_FILES_CHKSUM = "\
    file://LICENCE.cypress-rpidistro;md5=c5d12ae0b24ef7177902a8e288751a4e \
"

SRCREV = "1e4ee0c05bae10002124b56c0e44bb9ac6581ddc"
PV = "1.2+git${SRCPV}"

PACKAGES += " \
    ${PN}-bcm4345c5-hcd \
    ${PN}-bcm43430b0-hcd \
"

FILES_${PN}-bcm4345c5-hcd = " \
    ${nonarch_base_libdir}/firmware/brcm/BCM4345C5.hcd \
"

FILES_${PN}-bcm43430b0-hcd = " \
    ${nonarch_base_libdir}/firmware/brcm/BCM43430B0.hcd \
"

LICENSE_${PN}-bcm43430b0-hcd = "Firmware-cypress-rpidistro"
RDEPENDS_${PN}-bcm4340b0-hcd += "${PN}-cypress-license"

CONFLICTS_${PN}-bcm43430b0-hcd = "linux-firmware-bcm43430b0-hcd"
RREPLACES_${PN}-bcm43430b0-hcd = "linux-firmware-bcm43430b0-hcd"

LICENSE_${PN}-bcm4345c5-hcd = "Firmware-cypress-rpidistro"
RDEPENDS_${PN}-bcm4345c5-hcd += "${PN}-cypress-license"

CONFLICTS_${PN}-bcm43435c5-hcd = "linux-firmware-bcm4345c5-hcd"
RREPLACES_${PN}-bcm43435c5-hcd = "linux-firmware-bcm4345c5-hcd"
