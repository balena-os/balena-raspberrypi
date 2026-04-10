# EEPROM update orchestrator for Raspberry Pi 4
# Decides between self-update (bootloader handles it on reboot) and
# flashrom (direct SPI write via pieeprom-flashrom.sh).
#
# Based on https://github.com/raspberrypi/rpi-eeprom/blob/master/rpi-eeprom-update

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
DT_BOOTLOADER_TS="/proc/device-tree/chosen/bootloader/build-timestamp"
# Minimum bootloader version that supports self-update (2022-04-26)
# See https://github.com/raspberrypi/rpi-eeprom/blob/master/rpi-eeprom-update
SELF_UPDATE_MIN_VER=1650968668

# According to documentation, custom EEPROM update scripts
# must also check for FREEZE_VERSION flag
if [ "$(/usr/bin/vcgencmd bootloader_config | grep "FREEZE_VERSION=1" || true)" ]; then
    warn "Bootloader config contains FREEZE_VERSION=1. Will NOT update SPI EEPROM firmware!"
    exit 0
fi

# bootloader_update=0 in config.txt disables all EEPROM updates (self-update and flashrom)
if grep -q "^bootloader_update=0" /mnt/boot/config.txt 2>/dev/null; then
    warn "EEPROM updates disabled in config.txt (bootloader_update=0). Will NOT update!"
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
if [ "${CURRENT_VERSION}" -ge "${SELF_UPDATE_MIN_VER}" ]; then
    # Check if self-update has been explicitly disabled in the EEPROM config
    if /usr/bin/vcgencmd bootloader_config | grep -q "ENABLE_SELF_UPDATE=0"; then
        warn "Self-update is supported but disabled in EEPROM config (ENABLE_SELF_UPDATE=0)"
    else
        info "Bootloader supports self-update. EEPROM will be updated on next reboot if needed."
        exit 0
    fi
fi

info "Falling back to flashrom"
/usr/libexec/pieeprom-flashrom.sh "${NEW_IMG}"
