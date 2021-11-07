SRCREV = "b66ab26cebff689d0d3257f56912b9bb03c20567"
PV = "20190114-1+rpt10"

do_install:append() {
     install -m 0644 brcm/brcmfmac43456-sdio.* ${D}${nonarch_base_libdir}/firmware/brcm/
}

PACKAGES += " \
    ${PN}-bcm43456 \
"

LICENSE:${PN}-bcm43456 = "Firmware-broadcom_bcm43xx-rpidistro"
FILES:${PN}-bcm43456 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43456*"
RDEPENDS:${PN}-bcm43456 += "${PN}-broadcom-license"

RCONFLICTS:${PN}-bcm43456 = " \
    linux-firmware-bcm43456 \
    linux-firmware-raspbian-bcm43456 \
"
RREPLACES:${PN}-bcm43456 = " \
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
