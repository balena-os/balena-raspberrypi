SUMMARY = "Installation scripts and binaries for the Raspberry Pi 4 EEPROM"
DESCRIPTION = "This repository contains the rpi4 bootloader and scripts \
for updating it in the spi eeprom"
LICENSE = "BSD-3-Clause & Broadcom-RPi"
LIC_FILES_CHKSUM = "file://LICENSE;md5=f546ed4f47e9d4c1fe954ecc9d3ef4f3"

SRC_URI = " \
    git://github.com/raspberrypi/rpi-eeprom.git;protocol=https;branch=master \
    file://pieeprom-update.sh \
"

# EEPROM configuration default values for this version, as specified at
# https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md
SRC_URI += " \
    file://default-config.txt \
"

SRCREV = "3b393d31ac0f1864420d47028b5703a70ad8da8f"
PV = "v2023.10.18-2712"

# We use the latest stable version
# which is available in "stable"
LATEST_STABLE_PIEEPROM_FW:raspberrypi4-64 = "2023-05-11"
VL805_FW_REV = "000138a1"
FIRMWARE:raspberrypi4-64 = "firmware-2711"

S = "${WORKDIR}/git"

inherit deploy python3native sign-rsa

S = "${WORKDIR}/git"

RDEPENDS:${PN} = "dtc flashrom userlandtools"
DEPENDS += "${@oe.utils.conditional('SIGN_API','','',' usbboot-native',d)}"

# default-config.txt contains the default options
# for this fw release, and provides a way for altering
# the configuration that exists in the binary
do_compile() {
    src_eeprom_bin="pieeprom-${LATEST_STABLE_PIEEPROM_FW}.bin"
    tgt_eeprom_bin="pieeprom-latest-stable.bin"
    cp ${S}/rpi-eeprom-config "${WORKDIR}"
    cp "${S}/${FIRMWARE}/stable/${src_eeprom_bin}" "${WORKDIR}/"
    boot_conf="${WORKDIR}/default-config.txt"

    # Configure for development UART output
    if ${@bb.utils.contains('DISTRO_FEATURES','osdev-image','true','false',d)}; then
        if grep -q "BOOT_UART=" "${boot_conf}"; then
            sed -i 's/BOOT_UART=.*/BOOT_UART=1/g' "${boot_conf}"
        else
            echo "BOOT_UART=1" >> "${boot_conf}"
        fi
    fi

    if [ "x${SIGN_API}" != "x" ]; then
        # Make sure the firmware is secure boot capable
        BOOTLOADER_SECURE_BOOT_MIN_VERSION=1632136573
        update_version=$(strings "${WORKDIR}/${src_eeprom_bin}" | grep BUILD_TIMESTAMP | sed 's/.*=//g')
        if [ "${BOOTLOADER_SECURE_BOOT_MIN_VERSION}" -gt "${update_version}" ]; then
            bbfatal "Bootloader is not secure boot capable"
        fi

        # Configure for secure boot
        if grep -q "SIGNED_BOOT=" "${boot_conf}"; then
            sed -i 's/SIGNED_BOOT=.*/SIGNED_BOOT=1/g' "${boot_conf}"
        else
            echo "SIGNED_BOOT=1" >> "${boot_conf}"
        fi

        # Configure for self-update so that the EEPROM can be updated in secure boot mode
        if grep -q "ENABLE_SELF_UPDATE=" "${boot_conf}"; then
            sed -i 's/ENABLE_SELF_UPDATE=.*/ENABLE_SELF_UPDATE=1/g' "${boot_conf}"
        else
            echo "ENABLE_SELF_UPDATE=1" >> "${boot_conf}"
        fi

        # Sign the configuratin file
        do_sign_rsa "${boot_conf}" "${boot_conf}.sig"

        # Merge the configuration file into the firmware
        ${PYTHON} "${WORKDIR}/rpi-eeprom-config" --config "${boot_conf}" --digest "${boot_conf}.sig" \
              --out "${WORKDIR}/${tgt_eeprom_bin}" --pubkey "${DEPLOY_DIR_IMAGE}/balena-keys/rsa.pem" "${WORKDIR}/${src_eeprom_bin}"

        # Sign the firmware
        do_sign_rsa "${WORKDIR}/${tgt_eeprom_bin}" "${WORKDIR}/${tgt_eeprom_bin%.bin}.sig"
    else
        ${PYTHON} "${WORKDIR}/rpi-eeprom-config" --config "${boot_conf}" \
              --out "${WORKDIR}/${tgt_eeprom_bin}" "${WORKDIR}/${src_eeprom_bin}"
    fi
}
do_compile[network] = "1"
do_compile[depends] += " \
    curl-native:do_populate_sysroot \
    jq-native:do_populate_sysroot \
    ca-certificates-native:do_populate_sysroot \
    coreutils-native:do_populate_sysroot \
    python3-pycryptodomex-native:do_populate_sysroot \
    balena-keys:do_deploy \
"
do_compile[vardeps] = "SIGN_API"

do_install() {
  install -d ${D}${libexecdir}
	install -m 0775 ${WORKDIR}/pieeprom-update.sh ${D}${libexecdir}/pieeprom-update.sh
}
do_install[depends] += "\
    rpi-bootfiles:do_deploy \
"

do_deploy () {
    if [ -d ${DEPLOY_DIR_IMAGE}/rpi-eeprom ]; then
        rm -rf ${DEPLOY_DIR_IMAGE}/rpi-eeprom
    fi
    mkdir ${DEPLOY_DIR_IMAGE}/rpi-eeprom/

    cp ${WORKDIR}/pieeprom-latest-stable* ${DEPLOY_DIR_IMAGE}/rpi-eeprom/
    if [ -f "${S}/${FIRMWARE}/critical/vl805-${VL805_FW_REV}.bin" ]; then
        cp ${S}/${FIRMWARE}/critical/vl805-${VL805_FW_REV}.bin ${DEPLOY_DIR_IMAGE}/${PN}/vl805-latest-stable.bin
    fi
}

# vl805 utility is deprecated, see https://github.com/raspberrypi/rpi-eeprom/commit/fed1ca62a5752cb5a990608c8c897ce0b077600a
addtask do_deploy before do_package after do_compile

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

# Ensure binaries are really deployed
# on each build
do_deploy[nostamp] = "1"

do_deploy[depends] += " \
    rpi-bootfiles:do_deploy \
"

FILES:${PN} = "${libexecdir}/pieeprom-update.sh"
COMPATIBLE_MACHINE = "raspberrypi4-64"
