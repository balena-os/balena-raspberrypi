FILESEXTRAPATHS:append := ":${THISDIR}/files"

DESCRIPTION = "This repository contains the rpi4 bootloader and scripts \
for updating it in the spi eeprom"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=7dcd1a1eb18ae569857c21cae81347cb"

# EEPROM configuration default values for this version, as specified at
# https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md
SRC_URI = " \
    git://github.com/${SRCFORK}/rpi-eeprom.git;protocol=https;branch=${SRCBRANCH} \
    file://default-config.txt \
"

COMPATIBLE_MACHINE = "raspberrypi4-64"

SRCBRANCH = "master"
SRCFORK = "raspberrypi"
SRCREV = "7cb9d4162f330c5ca578376b1a3d5e748843e81c"

inherit deploy python3native

# Use the date of the above commit as the package version. Update this when
# SRCREV is changed.
PV = "20210111"

# We use the latest stable version
# which is available in "stable"
LATEST_STABLE_PIEEPROM_FW = "2021-01-11"
VL805_FW_REV = "000138a1"

S = "${WORKDIR}/git"

# default-config.txt contains the default options
# for this fw release, and provides a way for altering
# the configuration that exists in the binary
do_compile() {
    cd ${WORKDIR} && cp ${S}/rpi-eeprom-config .
    $(which python3) ./rpi-eeprom-config ${S}/firmware/stable/pieeprom-${LATEST_STABLE_PIEEPROM_FW}.bin \
        --config ./default-config.txt \
        --out ./pieeprom-latest-stable.bin
}

do_deploy () {
    if [ -d ${DEPLOY_DIR_IMAGE}/rpi-eeprom ]; then
        rm -rf ${DEPLOY_DIR_IMAGE}/rpi-eeprom
    fi
    mkdir ${DEPLOY_DIR_IMAGE}/rpi-eeprom/

    cp "${WORKDIR}/pieeprom-latest-stable.bin" ${DEPLOY_DIR_IMAGE}/rpi-eeprom/pieeprom-latest-stable.bin

    cp ${S}/firmware/critical/vl805-${VL805_FW_REV}.bin ${DEPLOY_DIR_IMAGE}/${PN}/vl805-latest-stable.bin
}

# vl805 utility is deprecated, see https://github.com/raspberrypi/rpi-eeprom/commit/fed1ca62a5752cb5a990608c8c897ce0b077600a
addtask do_deploy before do_package after do_compile

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

# Ensure binaries are really deployed
# on each build
do_deploy[nostamp] = "1"

do_deploy[depends] += " \
    bootfiles:do_deploy \
"
