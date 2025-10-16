FILESEXTRAPATHS:append := ":${THISDIR}/files"

LIC_FILES_CHKSUM = "file://LICENCE.broadcom;md5=c403841ff2837657b2ed8e5bb474ac8d"

SRC_URI += " \
    file://fincm3-dt-blob.bin \
"

RPIFW_DATE = "20250915"
SRCREV = "676efed1194de38975889a34276091da1f5aadd3"

# The Pi0 stays on the older firmware
# for now, due to reported issues with uart
# caused by the updated firmware.
RPIFW_DATE:raspberrypi = "20241126"
SRCREV:raspberrypi = "9f24f4bc2bdd07ffd158cfbb4bce88a2efc4c1f5"

# stick to older version because if we use a newer version of the pi firmware then the EEPROM on revpi-connect-4 for example won't be read and the correct overlays won't be autoloaded
RPIFW_DATE:revpi = "20230405"
SRCREV:revpi = "055e044d5359ded1aacc5a17a8e35365373d0b8b"
RPIFW_DATE:revpi4 = "20230405"
SRCREV:revpi4 = "055e044d5359ded1aacc5a17a8e35365373d0b8b"

SHORTREV = "${@d.getVar("SRCREV", False).__str__()[:7]}"
RPIFW_SRC_URI = "https://api.github.com/repos/raspberrypi/firmware/tarball/${SRCREV};downloadfilename=raspberrypi-firmware-${SHORTREV}.tar.gz;name=rpifw"
RPIFW_SRC_URI:raspberrypi = "https://api.github.com/repos/raspberrypi/firmware/tarball/${SRCREV};downloadfilename=raspberrypi-firmware-${SHORTREV}.tar.gz;name=rpifw-pi0"
RPIFW_SRC_URI:revpi = "https://api.github.com/repos/raspberrypi/firmware/tarball/${SRCREV};downloadfilename=raspberrypi-firmware-${SHORTREV}.tar.gz;name=rpifw-revpis"
RPIFW_SRC_URI:revpi4 = "https://api.github.com/repos/raspberrypi/firmware/tarball/${SRCREV};downloadfilename=raspberrypi-firmware-${SHORTREV}.tar.gz;name=rpifw-revpis"
RPIFW_S = "${WORKDIR}/raspberrypi-firmware-${SHORTREV}"

SRC_URI = "${RPIFW_SRC_URI}"

SRC_URI[rpifw.sha256sum] = "649c49254ed0e78b31d77ece7dadd5bd31f76a2362e2bc9a3556a0a87d6f6c0e"
SRC_URI[rpifw-pi0.sha256sum] = "4b436f8946b139c6a1202375ef55d4848e3bcd8c1a9cb47000e06d7ecec828f7"
SRC_URI[rpifw-revpis.sha256sum] = "be906803fe55aec321e01fe6af61f7ebca603fc193dbc6bc2e1301b7d152e11a"

PV = "${RPIFW_DATE}"

do_deploy:append() {
    # exclude from balenaOS the binaries with additional debug assertions (they
    # grow the used size in resin-boot and this potentially breaks hostapps
    # update)
    rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup_db.dat
    rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start_db.elf
    rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup4db.dat
    rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start4db.elf

    if echo ${MACHINEOVERRIDES} | grep -i "raspberrypi4-64"; then
        # exclude from raspberrypi4-64 based balenaOS builds the binaries which are for previous RaspberryPi versions
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup_cd.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup_x.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start.elf
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start_cd.elf
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start_x.elf
        # bootcode.bin is not used anymore on rpi4 as the boot code is now in an EEPROM (https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md)
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/bootcode.bin
    else
        # exclude RaspberryPi4 specific firmware from non raspberrypi4-64 based balenaOS builds
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup4.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup4cd.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/fixup4x.dat
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start4.elf
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start4cd.elf
        rm -f ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/start4x.elf
    fi
}

do_deploy:append:fincm3() {
    # Install the dt-blob needed for camera support in Balena Fin CM3
    install -m 644 ${WORKDIR}/fincm3-dt-blob.bin ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/dt-blob.bin
}
