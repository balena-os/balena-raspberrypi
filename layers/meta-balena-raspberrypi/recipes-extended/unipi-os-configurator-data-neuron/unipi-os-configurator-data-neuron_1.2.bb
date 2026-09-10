SUMMARY = "UniPi OS Configurator data for Neuron/Axon boards - per-model device-tree overlays and staged udev rules"
DESCRIPTION = "Provides the device-tree overlays and udev rules unipi-os-configurator activates at boot once it detects which specific Neuron model (L4xx/M3xx/S103/...) is attached, via its EEPROM-based hardware ID. Restores /dev/ttyNS* and other board-IO device nodes that the vendor's kernel-6.1+ rework (see unipi-kernel-modules) moved to this per-model mechanism, replacing the single generic overlay this device type used before."
HOMEPAGE = "https://github.com/UniPiTechnology/os-configurator-data-neuron"
LICENSE = "GPL-3.0-or-later"
LIC_FILES_CHKSUM = "file://debian/copyright;md5=87e7938d0f6a1ed6761fd8a2abc0350c"

SRC_URI = "git://github.com/UniPiTechnology/os-configurator-data-neuron.git;protocol=https;branch=master"

# 1.2 - current tip as of writing.
SRCREV = "23153abdade9f5defaca58a8b9e21d408468f840"

S = "${WORKDIR}/git"

DEPENDS = "dtc-native"
RDEPENDS:${PN} += "unipi-os-configurator"

COMPATIBLE_MACHINE = "(raspberrypi3-unipi-neuron|raspberrypi4-unipi-neuron)"

inherit deploy

do_compile() {
    cd ${S}/overlays
    for dts in *-overlay.dts; do
        dtc -@ -O dtb -o "${dts%-overlay.dts}.dtbo" "${dts}"
    done
}

do_install() {
    install -d ${D}${datadir}/unipi-os-configurator/udev
    install -m 0644 ${S}/udev/*.rules ${D}${datadir}/unipi-os-configurator/udev/

    install -d ${D}${libdir}/unipi
    install -m 0644 ${S}/unipi_values.py ${D}${libdir}/unipi/
}

FILES:${PN} += " \
    ${datadir}/unipi-os-configurator/udev \
    ${libdir}/unipi \
"

# What actually puts an overlay on the boot partition for this device's
# balenaos-img fstype (meta-balena-raspberrypi/recipes-core/images/
# balena-image.inc's overlay_dtbs_handler, a do_resin_boot_dirgen_and_deploy
# prefunc):
#   1. It reads DEPLOY_DIR_IMAGE/overlays.txt as the complete, authoritative
#      list of overlay dtbo names (as "overlays/<name>.dtbo" entries) and
#      REPLACES KERNEL_DEVICETREE with it - not a directory scan of any kind.
#   2. overlays.txt itself is written by linux-raspberrypi's own do_overlays
#      prefunc (recipes-kernel/linux/linux-raspberrypi_%.bbappend), which
#      globs *-overlay.dts ONLY from the kernel recipe's own source tree and
#      overwrites (not appends) the file - so anything from a different
#      recipe has to be appended after that write, not before.
#   3. make_dtb_boot_files() then expects each dtbo's SOURCE file sitting
#      flat at DEPLOY_DIR_IMAGE/<name>.dtbo (matching where the kernel's own
#      compiled overlays land) - not in any overlays/ or bootfiles/overlays/
#      subdirectory (both tried and confirmed wrong before this).
do_deploy() {
    install -d ${DEPLOY_DIR_IMAGE}
    install -m 0644 ${S}/overlays/*.dtbo ${DEPLOY_DIR_IMAGE}/
    for f in ${S}/overlays/*.dtbo; do
        echo -n " overlays/$(basename ${f})" >> ${DEPLOY_DIR_IMAGE}/overlays.txt
    done
}
do_deploy[depends] += "virtual/kernel:do_deploy"
addtask deploy after do_compile before do_build
