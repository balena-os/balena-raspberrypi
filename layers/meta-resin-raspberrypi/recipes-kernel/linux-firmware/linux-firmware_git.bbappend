# This .txt file is required for the wifi firmware to work. It used to be
# shipped in meta-raspberrypi, but now it's ommitted.
#
# XXX 2017.02.27 We believe this to be a bug, and the code below is a workaround

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://brcmfmac43430-sdio.txt"

do_install_append() {
    cp ${WORKDIR}/brcmfmac43430-sdio.txt ${D}/lib/firmware/brcm/
}

FILES_${PN}-bcm43430_append = " /lib/firmware/brcm/brcmfmac43430-sdio.txt"
