SUMMARY = "UniPi OS Configurator data for Neuron/Axon boards - per-model device-tree overlays and staged udev rules"
DESCRIPTION = "Provides the device-tree overlays and udev rules unipi-os-configurator activates at boot once it detects which specific Neuron model (L4xx/M3xx/S103/...) is attached, via its EEPROM-based hardware ID. Restores /dev/ttyNS* and other board-IO device nodes that the vendor's kernel-6.1+ rework (see unipi-kernel-modules) moved to this per-model mechanism, replacing the single generic overlay this device type used before."
HOMEPAGE = "https://github.com/UniPiTechnology/os-configurator-data-neuron"
# Licence basis (upstream checked at this SRCREV): the upstream repo declares
# NO licence for what this recipe ships - no LICENSE/COPYING file, nothing in
# the README, no licence shown on GitHub. The only statements are
# overlays/unipi_finaltest-overlay.dts's SPDX tag "(GPL-2.0+ OR MIT)" and
# debian/copyright's GPL-3.0+, which claims only debian/* (packaging, not
# shipped here). The 20 other overlays, the udev rules and unipi_values.py
# carry no statement at all.
# DOCUMENTED ASSUMPTION, not an upstream declaration: GPL-2.0-or-later, the
# closest thing to evidence (the one tagged file) and the project's chosen
# fallback where the licence is in doubt. To be replaced by whatever UniPi
# states if they add a licence to the repo.
LICENSE = "GPL-2.0-or-later"
LIC_FILES_CHKSUM = " \
    file://overlays/unipi_finaltest-overlay.dts;beginline=1;endline=1;md5=f61b767a4cf3b59d18009170e9415c29 \
    file://debian/copyright;md5=87e7938d0f6a1ed6761fd8a2abc0350c \
"

SRC_URI = "git://github.com/UniPiTechnology/os-configurator-data-neuron.git;protocol=https;branch=master"

# 1.2 - current tip as of writing.
SRCREV = "23153abdade9f5defaca58a8b9e21d408468f840"

S = "${WORKDIR}/git"

DEPENDS = "dtc-native"
# unipi-os-configurator (and its python3 RDEPENDS) is NOT currently required:
# the shipped fix hardcodes the per-model overlay in config.txt rather than
# relying on this package's daemon to detect the model and stage udev rules
# dynamically, and python3 alone is a meaningful chunk of an already-tight
# HUP size budget on this existing device type. Re-add this RDEPENDS if/when
# real per-unit dynamic model detection is built on top of this package's
# staged (but currently unused) udev rules.

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
#
# The .dtbo files themselves go through ${DEPLOYDIR} (inherit deploy's own
# sstate-cached staging dir, promoted to DEPLOY_DIR_IMAGE by sstate.bbclass's
# sstate_install - a plain relative-path-preserving copy, confirmed against
# sstate.bbclass directly, so the flat DEPLOY_DIR_IMAGE/<name>.dtbo layout
# point 3 above depends on is unaffected). Writing them straight into the
# shared DEPLOY_DIR_IMAGE, as before, bypassed sstate/cleansstate entirely.
#
# overlays.txt is different and deliberately NOT routed through DEPLOYDIR:
# it's a single shared manifest another recipe (the kernel) already wrote
# directly into DEPLOY_DIR_IMAGE, and this task only ever appends one line
# to it. Sstate promotion is a directory copy, not a merge - staging our own
# copy in DEPLOYDIR and promoting it would overwrite the kernel's entries
# instead of appending to them. This one line keeps the same direct-write,
# ordering-dependent shape (do_deploy[depends] on the kernel's do_deploy,
# below) it always had - that's inherent to a cross-recipe shared manifest,
# not something this recipe can fix on its own.
do_deploy() {
    install -d ${DEPLOYDIR}
    install -m 0644 ${S}/overlays/*.dtbo ${DEPLOYDIR}/

    install -d ${DEPLOY_DIR_IMAGE}
    for f in ${S}/overlays/*.dtbo; do
        echo -n " overlays/$(basename ${f})" >> ${DEPLOY_DIR_IMAGE}/overlays.txt
    done
}
do_deploy[depends] += "virtual/kernel:do_deploy"
addtask deploy after do_compile before do_build
