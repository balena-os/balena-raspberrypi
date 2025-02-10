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

# unipi module deinitialize char dev
UNIPI_DEINIT_DEV=/dev/unipispi_deinit

# unipi LED devices path
UNIPI_PLC_DEV=/sys/devices/platform/unipi_plc/

if [ ! -e ${UNIPI_DEINIT_DEV} ]; then
    info "unipi module cannot be uninitialized, will not update EEPROM"
    exit 0
fi

unload_unipi_modules() {
    # Below modules are loaded on UniPi only,
    # to allow spidev to re-bind
    unipi_modules=("uio_pdrv_genirq" "uio")
    retry=5

    for unipi_module in "${unipi_modules[@]}"
    do
        if lsmod | grep -q $unipi_module ; then
            info "Unloading $unipi_module"
            rmmod $unipi_module

            if [ $? -eq 0 ]; then
                info "Unloaded $unipi_module"
            else
                # proceeding without unloading these modules can cause the board to fail to reboot
                fatal "Failed to unload ${unipi_module}, aborting EEPROM firmware check and update"
            fi
        fi
     done

     # This prevents hang on reboot after running flashrom,
     # but only if the unipi module has been deinitialized
     # completely and its' led drivers were deregistered
     echo "deinit" > ${UNIPI_DEINIT_DEV}

     # All led devices, including the unipi ones, have rfkill
     # as available triggers, even if they are not specifically
     # set as active. When the bluetooth subsystem stops and
     # the hci device is unregistered, a hang occurs because it
     # unregisters all rfkill triggers from leds, which leds
     # have dupplicate drivers registered during the spi re-bind procedure.
     # Let's ensure the unipi drivers are deregistered completely
     # before proceeding with unbinding/binding spi.
     while [ -e ${UNIPI_PLC_DEV} ] && [ $retry -gt 0 ]
     do
         info "Waiting for unipi module to deinitialize..."
         sleep 1
         retry=$(( retry - 1))
     done

     if [ -e ${UNIPI_PLC_DEV} ]; then
         warn "Failed to deinitialize unipi drivers. Will not check or update EEPROM firmware"
         exit 0
     else
         info "unipi module is deinitialized"
     fi
}

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

# unipi devices will fail to bind back spidev
# unless device-specific modules are removed
# or deinitialized first.
unload_unipi_modules
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
