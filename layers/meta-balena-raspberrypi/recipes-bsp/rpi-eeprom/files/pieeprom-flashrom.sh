# Flashrom-based EEPROM update for Raspberry Pi 4
# Usage: pieeprom-flashrom.sh
#
# This script handles the low-level SPI flashrom update.
# It is called by pieeprom-update.sh when self-update is not available,
# or can be invoked directly.

set -o errexit

# shellcheck disable=SC1091
. /usr/libexec/os-helpers-logging

CURR_IMG=pieeprom-current.bin.tmp
CURR_IMG_PATH=/tmp
BOOT_PART=/mnt/boot
DEFAULT_IMG_NAME=pieeprom.upd
FALLBACK_IMG_NAME=pieeprom.bin
SPI_SPEED=16000
SPI_DEVICE=""
VCHIQ_UNBOUND=0
SPI_WAS_UNBOUND=0
SPI_IS_BOUND=0
AUDIO_WAS_DISABLED=0
SPI_OVERLAY_WAS_ENABLED=0
MAILBOX_WAS_DISABLED=0

# Returns the sysfs symlink path for a bound device, or empty if none.
# Exits if more than one device matches (expected at most one).
get_driver_bound_symlink() {
    driver_path="${1}"
    device_pattern="${2}"

    devices="$(find "${driver_path}" -maxdepth 1 -type l -name "${device_pattern}" 2>/dev/null)"
    device_count="$(echo "${devices}" | grep -c . || true)"
    if [ "${device_count}" -gt 1 ]; then
        fail "Multiple devices matching ${device_pattern} found in ${driver_path}, expected exactly one"
    fi
    echo "${devices}" | head -n1
}

# Unbind a device from a driver
# Usage: device=$(driver_unbind <driver_path> <device_pattern>)
# Returns: device name on stdout if successful, empty string if not found
# Exits: using fail function if multiple devices found or unbind operation fails
driver_unbind() {
    driver_path="${1}"
    device_pattern="${2}"

    if [ ! -d "${driver_path}" ]; then
        echo ""
        return
    fi

    device_path="$(get_driver_bound_symlink "${driver_path}" "${device_pattern}")"
    if [ -z "${device_path}" ]; then
        echo ""
        return
    fi
    device="$(basename "${device_path}")"
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

# SPI driver helpers
SPI_DRIVER_PATH="/sys/bus/platform/drivers/spi-bcm2835"
spi_unbind() {
    driver_unbind "${SPI_DRIVER_PATH}" "*.spi"
}
spi_bind() {
    driver_bind "${SPI_DRIVER_PATH}" "${1}"
}
get_spi_bound_symlink() {
    get_driver_bound_symlink "${SPI_DRIVER_PATH}" "*.spi"
}

# VCHIQ driver helpers (optional - unbind releases GPIO pins used by audio
# to avoid pinctrl conflicts with SPI on GPIO 40-45)
# WARNING: VCHIQ cannot be rebound at runtime due to firmware limitations,
# audio/camera will be unavailable until reboot if unbound.
VCHIQ_DRIVER_PATH="/sys/bus/platform/drivers/bcm2835_vchiq"
vchiq_unbind() {
    driver_unbind "${VCHIQ_DRIVER_PATH}" "*.mailbox"
}

cleanup() {
    exit_code=$?
    cleanup_failed=0

    # Cleanup must be best-effort and should not fail the script.
    set +o errexit

    rm -f "${CURR_IMG_PATH}/${CURR_IMG}"

    if [ "${SPI_IS_BOUND}" = "1" ] && [ -n "${SPI_DEVICE}" ]; then
        if ! echo "${SPI_DEVICE}" > "${SPI_DRIVER_PATH}/unbind" 2>/dev/null; then
            warn "Failed to unbind ${SPI_DEVICE} during cleanup"
        else
            SPI_IS_BOUND=0
        fi
    fi

    if [ "${SPI_OVERLAY_WAS_ENABLED}" = "1" ]; then
        /usr/bin/dtparam -d /mnt/boot/overlays/ -R spi-gpio40-45 || \
            {
                warn "Failed to remove spi-gpio40-45 overlay during cleanup"
                cleanup_failed=1
            }
    fi

    if [ "${AUDIO_WAS_DISABLED}" = "1" ]; then
        /usr/bin/dtparam -d /mnt/boot/overlays/ audio=on || \
            {
                warn "Failed to restore audio=on during cleanup"
                cleanup_failed=1
            }
    fi

    if [ "${MAILBOX_WAS_DISABLED}" = "1" ]; then
        /usr/bin/vcmailbox 0x00030056 4 4 1 > /dev/null || \
            {
                warn "Failed to restore mailbox state during cleanup"
                cleanup_failed=1
            }
    fi

    if [ "${SPI_WAS_UNBOUND}" = "1" ] && [ "${SPI_IS_BOUND}" = "0" ] && [ -n "${SPI_DEVICE}" ]; then
        if ! spi_bind "${SPI_DEVICE}"; then
            warn "Failed to restore SPI driver during cleanup"
            cleanup_failed=1
        fi
    fi

    # VCHIQ cannot be restored at runtime due to firmware limitations.
    # Even with mailbox/audio restored, VideoCore services remain unavailable until reboot.
    # https://github.com/raspberrypi/rpi-eeprom/issues/801#issuecomment-3859373151
    if [ "${VCHIQ_UNBOUND}" = "1" ]; then
        warn "VCHIQ was unbound during EEPROM update and cannot be restored at runtime."
        warn "Audio, camera and other VideoCore services will not work until the next reboot."
    fi

    if [ "${exit_code}" -eq 0 ] && [ "${cleanup_failed}" -eq 1 ]; then
        warn "EEPROM update was successful, but cleanup failed. Exiting."
        exit 2
    fi

    exit "${exit_code}"
}

trap cleanup EXIT

NEW_EEPROM_PATH="${BOOT_PART}/${DEFAULT_IMG_NAME}"
if [ ! -r "${NEW_EEPROM_PATH}" ]; then
    NEW_EEPROM_PATH="${BOOT_PART}/${FALLBACK_IMG_NAME}"
    if [ ! -r "${NEW_EEPROM_PATH}" ]; then
        fail "EEPROM image is not accessible: ${BOOT_PART}/${DEFAULT_IMG_NAME} or ${BOOT_PART}/${FALLBACK_IMG_NAME}"
    fi
fi
info "Using EEPROM image: ${NEW_EEPROM_PATH}"

# spi=on: SPI0 is bound at boot and must be unbound before remuxing GPIO 40-45.
# spi=off (e.g. superhub): nothing to unbind; overlay enables SPI0 later.
bound_spi="$(get_spi_bound_symlink)"
if [ -n "${bound_spi}" ]; then
    SPI_DEVICE=$(spi_unbind)
    SPI_WAS_UNBOUND=1
fi

if /usr/bin/vcmailbox 0x00030056 4 4 0 > /dev/null; then
    MAILBOX_WAS_DISABLED=1
else
    warn "Failed to disable mailbox before EEPROM update; continuing"
fi
if /usr/bin/dtparam -d /mnt/boot/overlays/ audio=off; then
    AUDIO_WAS_DISABLED=1
else
    fail "Failed to disable audio before EEPROM update"
fi

if /usr/bin/dtoverlay -d /mnt/boot/overlays/ spi-gpio40-45; then
    SPI_OVERLAY_WAS_ENABLED=1
else
    fail "Failed to apply spi-gpio40-45 overlay before EEPROM update"
fi

# spi=off: overlay may bind SPI0 already; spi=on: bind using the name from unbind above.
bound_spi="$(get_spi_bound_symlink)"
if [ -n "${bound_spi}" ]; then
    SPI_DEVICE="$(basename "${bound_spi}")"
    SPI_IS_BOUND=1
else
    # spi=off with no boot-time bind: SPI_DEVICE is only set by unbind (spi=on) or when
    # already under spi-bcm2835 after the overlay. If the overlay did not bind SPI0 and
    # we have no name from unbind, bind cannot run (spi_bind needs a platform device id).
    if [ -z "${SPI_DEVICE}" ]; then
        fail "SPI device not found after overlay, cannot proceed with EEPROM update"
    fi
    if ! spi_bind "$SPI_DEVICE"; then
        warn "Unbinding VCHIQ to release GPIO 40-45 (audio/camera will be unavailable until reboot)"
        vchiq_unbind
        VCHIQ_UNBOUND=1
        if ! spi_bind "$SPI_DEVICE"; then
            fail "SPI bind failed even after VCHIQ unbind, cannot proceed"
        fi
    fi
    SPI_IS_BOUND=1
fi

/usr/sbin/flashrom -p "linux_spi:dev=/dev/spidev0.0,spispeed=${SPI_SPEED}" --read "${CURR_IMG_PATH}/${CURR_IMG}"

curr_eeprom_md5sum=$(md5sum "${CURR_IMG_PATH}/${CURR_IMG}" | awk '{print $1}')
new_eeprom_md5sum=$(md5sum "${NEW_EEPROM_PATH}" | awk '{print $1}')

if [ "$curr_eeprom_md5sum" = "$new_eeprom_md5sum" ]; then
    info "SPI EEPROM fw update is not necessary"
else
    info "Performing SPI EEPROM fw update..."
    /usr/sbin/flashrom -p "linux_spi:dev=/dev/spidev0.0,spispeed=${SPI_SPEED}" --write "${NEW_EEPROM_PATH}"
    info "SPI EEPROM fw update successful"
fi
