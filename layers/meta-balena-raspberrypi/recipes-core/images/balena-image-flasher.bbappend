include balena-image.inc

RDEPENDS:${PN} += "os-helpers-logging rpi-eeprom"

do_resin_boot_dirgen_and_deploy:append:raspberrypi4-64() {
    if [ "x${SIGN_API}" != "x" ]; then
        echo "$(cat ${BALENA_BOOT_WORKDIR}/config.json | jq -S ".installer += {migrate: { force: true }}")" > "${BALENA_BOOT_WORKDIR}/config.json"
    fi
}
