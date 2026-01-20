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

spi_bind() {
    command="${1}"
    case $command in
        "unbind")
            SPI_BCM2835_SYSPATH="/sys/bus/platform/drivers/spi-bcm2835"
            SPI_DEVICE="$(basename "$(find "${SPI_BCM2835_SYSPATH}" -type l -name "*.spi" | head -n1)")"
            if [ -n "${SPI_DEVICE}" ]; then
                echo "${SPI_DEVICE}" > "${SPI_BCM2835_SYSPATH}/${command}" || true
            fi
            ;;
        "bind")
            if [ -n "${SPI_DEVICE}" ]; then
                echo "${SPI_DEVICE}" > "${SPI_BCM2835_SYSPATH}/${command}" || true
                SPI_DEVICE=""
            fi
            ;;
        *) fatal "$command not supported";;
    esac
}

# According to documentation, custom EEPROM update scripts
# must also check for FREEZE_VERSION flag
if [ "$(/usr/bin/vcgencmd bootloader_config | grep "FREEZE_VERSION=1" || true)" ]; then
    warn "Bootloader config contains FREEZE_VERSION=1. Will NOT update SPI EEPROM firmware!"
    exit 0
fi

spi_bind unbind

/usr/bin/vcmailbox 0x00030056 4 4 0 > /dev/null || true
/usr/bin/dtparam -d /mnt/boot/overlays/ audio=off
/usr/bin/dtoverlay -d /mnt/boot/overlays/ spi-gpio40-45

spi_bind bind

/usr/sbin/flashrom -p "linux_spi:dev=/dev/spidev0.0,spispeed=${SPI_SPEED}" --read ${CURR_IMG_PATH}/${CURR_IMG}

curr_eeprom_md5sum=$(md5sum "${CURR_IMG_PATH}/${CURR_IMG}" | awk '{print $1}')
new_eeprom_md5sum=$(md5sum "${NEW_IMG_PATH}/${NEW_IMG}" | awk '{print $1}')

if [ "$curr_eeprom_md5sum" = "$new_eeprom_md5sum" ]; then
    info "SPI EEPROM fw update is not necessary"
else
    info "Performing SPI EEPROM fw update..."
    /usr/sbin/flashrom -p "linux_spi:dev=/dev/spidev0.0,spispeed=${SPI_SPEED}" --write "${NEW_IMG_PATH}/${NEW_IMG}"
fi

rm ${CURR_IMG_PATH}/$CURR_IMG

spi_bind unbind

/usr/bin/dtparam -d /mnt/boot/overlays/ -R spi-gpio40-45
/usr/bin/dtparam -d /mnt/boot/overlays/ audio=on
/usr/bin/vcmailbox 0x00030056 4 4 1 > /dev/null || true

spi_bind bind
