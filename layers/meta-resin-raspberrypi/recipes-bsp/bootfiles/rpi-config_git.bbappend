do_deploy_append() {
    # Enable i2c by default
    echo "dtparam=i2c_arm=on" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    # Enable SPI by default
    echo "dtparam=spi=on" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    # Disable firmware splash by default
    echo "disable_splash=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    # Disable firmware warnings showing in non-debug images
    if ! ${@bb.utils.contains('DISTRO_FEATURES','debug-image','true','false',d)}; then
        echo "avoid_warnings=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi
    # Enable audio (loads snd_bcm2835)
    echo "dtparam=audio=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}

# On Raspberry Pi 3 serial console on ttyS0 is only usable if ENABLE_UART = 1
# On builds set with DEBUG_IMAGE, we want serial console available on Raspberry Pi 3
ENABLE_UART_raspberrypi3 = "${@bb.utils.contains('DISTRO_FEATURES','development-image','1','0',d)}"
