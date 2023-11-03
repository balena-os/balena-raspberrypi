include balena-image.inc

init_board_config() {
    sed -i 's/$/ root=LABEL=flash-rootA flasher migrate/g' "${BALENA_BOOT_WORKDIR}/cmdline.txt"
}
