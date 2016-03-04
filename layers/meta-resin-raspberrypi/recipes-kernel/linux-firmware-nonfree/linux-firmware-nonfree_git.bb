SUMMARY = "Firmware files for use with Linux kernel"
SECTION = "kernel"

LICENSE = "Firmware-broadcom"

LIC_FILES_CHKSUM = "file://brcm80211/LICENSE;md5=8cba1397cda6386db37210439a0da3eb"

SRCREV = "54bab3d6a6d43239c71d26464e6e10e5067ffea7"
PE = "1"
PV = "0.0+git${SRCPV}"

SRC_URI = "git://github.com/RPi-Distro/firmware-nonfree.git"

S = "${WORKDIR}/git"

inherit allarch update-alternatives

do_install() {
    install -d  ${D}/lib/firmware/brcm

    # For Brodcom 43430
    cp -r ./brcm80211/brcm/brcmfmac43430* ${D}/lib/firmware/brcm
}


PACKAGES =+ "${PN}-bcm43430 \
             ${PN}-license \
             "

# For broadcom
FILES_${PN}-bcm43430 = " \
    /lib/firmware/brcm/brcmfmac43430-sdio.bin \
    /lib/firmware/brcm/brcmfmac43430-sdio.txt \
    "

ALTERNATIVE_TARGET_linux-firmware-bcm43430[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac43430-sdio.bin"
ALTERNATIVE_linux_firmware-bcm43430 = "brcmfmac-sdio.bin"

FILES_${PN} = "/lib/firmware/*"

# Make linux-firmware depend on all of the split-out packages.
python populate_packages_prepend () {
    firmware_pkgs = oe.utils.packages_filter_out_system(d)
    d.appendVar('RDEPENDS_linux-firmware-nonfree', ' ' + ' '.join(firmware_pkgs))
}
