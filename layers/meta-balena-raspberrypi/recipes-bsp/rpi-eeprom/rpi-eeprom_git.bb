FILESEXTRAPATHS_append := ":${THISDIR}/files"

DESCRIPTION = "This repository contains the rpi4 bootloader and scripts \
for updating it in the spi eeprom"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=7dcd1a1eb18ae569857c21cae81347cb"

# EEPROM configuration default values for this version, as specified at
# https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md
SRC_URI = " \
    git://github.com/${SRCFORK}/rpi-eeprom.git;protocol=git;branch=${SRCBRANCH} \
    file://default-config.txt \
"

COMPATIBLE_MACHINE = "raspberrypi4-64"

SRCBRANCH = "master"
SRCFORK = "raspberrypi"
SRCREV = "b959175b447941b9b25b0712bd11bb80e7b8c6ed"

inherit deploy pythonnative

# Use the date of the above commit as the package version. Update this when
# SRCREV is changed.
PV = "20190925"

# We use the latest stable version
# which is available in "critical"
LATEST_STABLE_FW = "2019-09-10"

S = "${WORKDIR}/git"

# default-config.txt contains the default options
# for this fw release, and provides a way for altering
# the configuration that exists in the binary
do_compile() {
    cd ${WORKDIR} && cp ${S}/rpi-eeprom-config .
    $(which python) ./rpi-eeprom-config ${S}/firmware/critical/pieeprom-${LATEST_STABLE_FW}.bin \
        --config ./default-config.txt \
        --out ./pieeprom-latest-stable.bin
}

do_deploy () {
    if [ -d ${DEPLOY_DIR_IMAGE}/rpi-eeprom ]; then
        rm -rf ${DEPLOY_DIR_IMAGE}/rpi-eeprom
    fi
    mkdir ${DEPLOY_DIR_IMAGE}/rpi-eeprom/

    cp "${WORKDIR}/pieeprom-latest-stable.bin" ${DEPLOY_DIR_IMAGE}/rpi-eeprom/pieeprom-latest-stable.bin
}

addtask do_deploy before do_package after do_compile

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

# Ensure binary really is deployed
# on each build
do_deploy[nostamp] = "1"
