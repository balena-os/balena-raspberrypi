do_deploy_append() {
    # Enable i2c by default
    echo "dtparam=i2c_arm=on" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    # Enable SPI by default
    echo "dtparam=spi=on" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}

# On Raspberry Pi 3 serial console on ttyS0 is only usable if ENABLE_UART = 1
# On builds set with DEBUG_IMAGE, we want serial console available on Raspberry Pi 3
ENABLE_UART_raspberrypi3 = "${@bb.utils.contains('DISTRO_FEATURES','debug-image','1','0',d)}"
