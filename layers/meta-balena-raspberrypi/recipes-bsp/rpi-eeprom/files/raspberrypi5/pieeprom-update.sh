#!/bin/sh

# Update procedure is based on the rpi-eeprom-update script available at
# https://github.com/raspberrypi/rpi-eeprom/blob/master/rpi-eeprom-update

set -o errexit

# shellcheck disable=SC1091
. /usr/libexec/os-helpers-logging
# shellcheck disable=SC1091
[ -f "/usr/libexec/os-helpers-sb" ] && . /usr/libexec/os-helpers-sb

if type is_secured >/dev/null 2>&1 && is_secured; then
    info "A signed boot enabled system must use the self-update EEPROM mechanism"
    exit 0
fi

NEW_IMG="${1:-pieeprom-latest-stable.bin}"
CURR_IMG=pieeprom-current.bin.tmp
CURR_IMG_PATH=/tmp
NEW_IMG_PATH=/mnt/boot
SPI_SPEED=16000
SPIDEV=/dev/spidev10.0

/usr/sbin/flashrom -p "linux_spi:dev=${SPIDEV},spispeed=${SPI_SPEED}" --read ${CURR_IMG_PATH}/${CURR_IMG}

curr_eeprom_md5sum=$(md5sum "${CURR_IMG_PATH}/${CURR_IMG}" | awk '{print $1}')
new_eeprom_md5sum=$(md5sum "${NEW_IMG_PATH}/${NEW_IMG}" | awk '{print $1}')

if [ "$curr_eeprom_md5sum" = "$new_eeprom_md5sum" ]; then
   info "SPI EEPROM fw update is not necessary"
   if type get_bootloader_version >/dev/null 2>&1; then
       info "Current version: $(get_bootloader_version))"
    fi
else
    info "Performing SPI EEPROM fw update..."
    /usr/sbin/flashrom -p "linux_spi:dev=${SPIDEV},spispeed=${SPI_SPEED}" --write "${NEW_IMG_PATH}/${NEW_IMG}"
fi

rm ${CURR_IMG_PATH}/$CURR_IMG
