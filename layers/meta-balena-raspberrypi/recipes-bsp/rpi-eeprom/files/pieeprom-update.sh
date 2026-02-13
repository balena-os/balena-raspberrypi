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

NEW_IMG="${1:-pieeprom.upd}"
FORCE_FLASHROM="${2:-}"
CURR_IMG=pieeprom-current.bin.tmp
CURR_IMG_PATH=/tmp
NEW_IMG_PATH=/mnt/boot
SPI_SPEED=16000
DT_BOOTLOADER_TS="/proc/device-tree/chosen/bootloader/build-timestamp"
# Minimum bootloader version that supports self-update (2022-04-26)
# See https://github.com/raspberrypi/rpi-eeprom/blob/master/rpi-eeprom-update
SELF_UPDATE_MIN_VER=1650968668

# Unbind a device from a driver
# Usage: device=$(driver_unbind <driver_path> <device_pattern>)
# Returns: device name on stdout if successful, empty string if not found
# Exits: using fail function if multiple devices found or unbind operation fails
driver_unbind() {
    driver_path="${1}"
    device_pattern="${2}"

    if [ ! -d "${driver_path}" ]; then
        # Driver path ${driver_path} is not found, returning empty string
        echo ""
        return
    fi

    devices="$(find "${driver_path}" -maxdepth 1 -type l -name "${device_pattern}" 2>/dev/null)"
    device_count="$(echo "${devices}" | grep -c . || true)"
    if [ "${device_count}" -gt 1 ]; then
        fail "Multiple devices matching ${device_pattern} found in ${driver_path}, expected exactly one"
    fi
    device="$(basename "$(echo "${devices}" | head -n1)" 2>/dev/null)"
    if [ -z "${device}" ]; then
        echo ""
        return
    fi
    if ! echo "${device}" > "${driver_path}/unbind" 2>/dev/null; then
        fail "Failed to unbind ${device} from ${driver_path}"
    fi
    echo "${device}"
}

# Bind a device to a driver
# Usage: driver_bind <driver_path> <device>
# Returns: 0 on success, 1 if device is empty or driver path not found, 2 if bind fails
driver_bind() {
    driver_path="${1}"
    device="${2}"

    if [ -z "${device}" ]; then
        warn "Device is empty, cannot bind to ${driver_path}"
        return 1
    fi

    if [ ! -d "${driver_path}" ]; then
        warn "Driver path ${driver_path} not found, skipping bind"
        return 1
    fi

    if ! echo "${device}" > "${driver_path}/bind" 2>/dev/null; then
        warn "Failed to bind ${device} to ${driver_path}"
        return 2
    fi
}

# SPI driver helpers (required - script fails if SPI device not found)
SPI_DRIVER_PATH="/sys/bus/platform/drivers/spi-bcm2835"
spi_unbind() {
    driver_unbind "${SPI_DRIVER_PATH}" "*.spi"
}
spi_bind() {
    driver_bind "${SPI_DRIVER_PATH}" "${1}"
}

# VCHIQ driver helpers (optional - unbind releases GPIO pins used by audio
# to avoid pinctrl conflicts with SPI on GPIO 40-45)
# WARNING: VCHIQ cannot be rebound at runtime due to firmware limitations,
# audio/camera will be unavailable until reboot if unbound.
VCHIQ_DRIVER_PATH="/sys/bus/platform/drivers/bcm2835_vchiq"
vchiq_unbind() {
    driver_unbind "${VCHIQ_DRIVER_PATH}" "*.mailbox"
}

# According to documentation, custom EEPROM update scripts
# must also check for FREEZE_VERSION flag
if [ "$(/usr/bin/vcgencmd bootloader_config | grep "FREEZE_VERSION=1" || true)" ]; then
    warn "Bootloader config contains FREEZE_VERSION=1. Will NOT update SPI EEPROM firmware!"
    exit 0
fi

# Get current bootloader version (unix timestamp)
if [ -f "${DT_BOOTLOADER_TS}" ]; then
    CURRENT_VERSION=$(printf "%d" "0x$(od "${DT_BOOTLOADER_TS}" -v -An -t x1 | tr -d ' ')")
else
    CURRENT_VERSION=$(/usr/bin/vcgencmd bootloader_version | grep timestamp | awk '{print $2}')
fi
if ! [ "${CURRENT_VERSION:-0}" -gt 0 ] 2>/dev/null; then
    warn "Could not determine bootloader version, falling back to flashrom"
    CURRENT_VERSION=0
fi
info "Current bootloader version: ${CURRENT_VERSION}"

# Check if self-update is supported by the bootloader
if [ -n "${FORCE_FLASHROM}" ]; then
    info "Flashrom forced via argument, skipping self-update check"
elif [ "${CURRENT_VERSION}" -ge "${SELF_UPDATE_MIN_VER}" ]; then
    # Check if self-update has been explicitly disabled
    if /usr/bin/vcgencmd bootloader_config | grep -q "ENABLE_SELF_UPDATE=0"; then
        warn "Self-update is supported but disabled in EEPROM config (ENABLE_SELF_UPDATE=0)"
    elif grep -q "bootloader_update=0" /mnt/boot/config.txt 2>/dev/null; then
        warn "Self-update is supported but disabled in config.txt (bootloader_update=0)"
    else
        info "Bootloader supports self-update. EEPROM will be updated on next reboot if needed."
        exit 0
    fi
fi

info "Self-update not supported: bootloader version too old or forced update or self-update disabled"
info "Falling back to flashrom"

SPI_DEVICE=$(spi_unbind)
if [ -z "${SPI_DEVICE}" ]; then
    fail "SPI device not found or failed to unbind, cannot proceed with EEPROM update"
fi

/usr/bin/vcmailbox 0x00030056 4 4 0 > /dev/null || true
/usr/bin/dtparam -d /mnt/boot/overlays/ audio=off
/usr/bin/dtoverlay -d /mnt/boot/overlays/ spi-gpio40-45

# Try binding SPI; if it fails (pinctrl conflict with VCHIQ holding GPIO 40-45),
# unbind VCHIQ and retry. VCHIQ cannot be rebound at runtime, so audio/camera
# will be unavailable until reboot.
VCHIQ_UNBOUND=0
if ! spi_bind "$SPI_DEVICE"; then
    warn "Unbinding VCHIQ to release GPIO 40-45 (audio/camera will be unavailable until reboot)"
    vchiq_unbind
    VCHIQ_UNBOUND=1
    if ! spi_bind "$SPI_DEVICE"; then
        fail "SPI bind failed even after VCHIQ unbind, cannot proceed"
    fi
fi

/usr/sbin/flashrom -p "linux_spi:dev=/dev/spidev0.0,spispeed=${SPI_SPEED}" --read ${CURR_IMG_PATH}/${CURR_IMG}

curr_eeprom_md5sum=$(md5sum "${CURR_IMG_PATH}/${CURR_IMG}" | awk '{print $1}')
new_eeprom_md5sum=$(md5sum "${NEW_IMG_PATH}/${NEW_IMG}" | awk '{print $1}')

if [ "$curr_eeprom_md5sum" = "$new_eeprom_md5sum" ]; then
    info "SPI EEPROM fw update is not necessary"
else
    info "Performing SPI EEPROM fw update..."
    /usr/sbin/flashrom -p "linux_spi:dev=/dev/spidev0.0,spispeed=${SPI_SPEED}" --write "${NEW_IMG_PATH}/${NEW_IMG}"
    info "SPI EEPROM fw update successful"
fi

rm ${CURR_IMG_PATH}/${CURR_IMG}

SPI_DEVICE=$(spi_unbind)
if [ -z "${SPI_DEVICE}" ]; then
    fail "SPI device not found during cleanup, cannot restore system state"
fi

/usr/bin/dtparam -d /mnt/boot/overlays/ -R spi-gpio40-45
/usr/bin/dtparam -d /mnt/boot/overlays/ audio=on
/usr/bin/vcmailbox 0x00030056 4 4 1 > /dev/null || true

if ! spi_bind "$SPI_DEVICE"; then
    fail "Failed to restore SPI driver during cleanup"
fi

# In an ideal world we would restore the mailbox, but unfortunately this is impossible https://github.com/raspberrypi/rpi-eeprom/issues/801#issuecomment-3859373151
if [ "${VCHIQ_UNBOUND}" = "1" ]; then
    warn "VCHIQ was unbound during EEPROM update and cannot be restored at runtime."
    warn "Audio, camera and other VideoCore services will not work until the next reboot."
fi
