SRCREV = "54ffdd6e2ea6055d46656b78e148fe7def3ec9d8"
PV = "20190114-2+rpt4"

do_install_append() {
     install -m 0644 brcm/brcmfmac43456-sdio.* ${D}${nonarch_base_libdir}/firmware/brcm/
     install -m 0644 brcm/brcmfmac43436-sdio.* ${D}${nonarch_base_libdir}/firmware/brcm/
     install -m 0644 brcm/brcmfmac43436s-sdio.* ${D}${nonarch_base_libdir}/firmware/brcm/
}

PACKAGES += " \
    ${PN}-bcm43456 \
    ${PN}-bcm43436 \
    ${PN}-bcm43436s \
"

LICENSE_${PN}-bcm43456 = "Firmware-broadcom_bcm43xx-rpidistro"
FILES_${PN}-bcm43456 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43456*"
RDEPENDS_${PN}-bcm43456 += "${PN}-broadcom-license"

LICENSE_${PN}-bcm43436 = "Firmware-broadcom_bcm43xx-rpidistro"
LICENSE_${PN}-bcm43436s = "Firmware-broadcom_bcm43xx-rpidistro"

FILES_${PN}-bcm43436 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43436-*"
FILES_${PN}-bcm43436s = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43436s*"

RDEPENDS_${PN}-bcm43436 += "${PN}-broadcom-license"
RDEPENDS_${PN}-bcm43436s += "${PN}-broadcom-license"

RCONFLICTS_${PN}-bcm43436 = "\
    linux-firmware-bcm43436 \
    linux-firmware-raspbian-bcm43436 \
"

RREPLACES_${PN}-bcm43436 = "\
    linux-firmware-bcm43436 \
    linux-firmware-raspbian-bcm43436 \
"

RCONFLICTS_${PN}-bcm43436s = "\
    linux-firmware-bcm43436s \
    linux-firmware-raspbian-bcm43436s \
"

RREPLACES_${PN}-bcm43436s = "\
    linux-firmware-bcm43436s \
    linux-firmware-raspbian-bcm43436s \
"

RCONFLICTS_${PN}-bcm43456 = " \
    linux-firmware-bcm43456 \
    linux-firmware-raspbian-bcm43456 \
"
RREPLACES_${PN}-bcm43456 = " \
    linux-firmware-bcm43456 \
    linux-firmware-raspbian-bcm43456 \
"


# the following should be a temporary workaround until https://github.com/balena-os/meta-balena/pull/2270 gets merged
fakeroot do_firmware_compression () {
    if [ "${FIRMWARE_COMPRESSION}" = "1" ]; then
        bbnote "Compressing firmware files"
        find "${D}${nonarch_base_libdir}/firmware" -type l -exec sh -c 'target=$(readlink "$0"); ln -sf "${target}.xz" "$0"; mv "$0" "$0".xz' {} \;
        find "${D}${nonarch_base_libdir}/firmware" -path "*/amd-ucode" -prune -o -type f -print -exec xz -C crc32 {} \;
    fi
}
addtask firmware_compression after do_install before do_package
addtask firmware_compression after do_install before do_populate_sysroot
do_unpack[vardeps] = 'FIRMWARE_COMPRESSION'
