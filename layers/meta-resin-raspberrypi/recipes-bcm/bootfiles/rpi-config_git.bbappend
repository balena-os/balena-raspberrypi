do_deploy_append() {
    # Enable i2c by default
    echo "dtparam=i2c_arm=on" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    # Enable SPI by default
    echo "dtparam=spi=on" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}

# On Raspberry Pi 3 serial console on ttyS0 is only usable if ENABLE_UART = 1
# On staging builds we want serial console available on Raspberry Pi 3
ENABLE_UART_raspberrypi3 = "${@bb.utils.contains('DISTRO_FEATURES','resin-staging','1','0',d)}"
