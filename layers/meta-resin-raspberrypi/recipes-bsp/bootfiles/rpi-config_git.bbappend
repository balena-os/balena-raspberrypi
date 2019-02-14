do_deploy_append() {
    # Enable i2c by default
    echo "dtparam=i2c_arm=on" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    # Enable SPI by default
    echo "dtparam=spi=on" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    # Disable firmware splash by default
    echo "disable_splash=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    # Disable firmware warnings showing in non-debug images
    if ! ${@bb.utils.contains('DISTRO_FEATURES','development-image','true','false',d)}; then
        echo "avoid_warnings=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi
    # Enable audio (loads snd_bcm2835)
    echo "dtparam=audio=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}

do_deploy_append_fincm3() {
	# Use the Balena Fin device tree overlay
	echo "dtoverlay=balena-fin" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}

do_deploy_append_revpi-core-3() {
    cat >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt << EOF

# serial port needs to be kept clean for RS485 communication
avoid_warnings=1

# Enable RevPi specific pins for i2c
dtoverlay=i2c1-bcm2708,sda1_pin=44,scl1_pin=45,pin_func=6

# Enable RevPi realtime clock
dtoverlay=i2c-rtc,pcf2127

# Enable RevPi specific pins for spi
dtparam=spi=on
dtoverlay=kunbus

EOF
}

# On Raspberry Pi 3 and Raspberry Pi Zero WiFi, serial ttyS0 console is only
# usable if ENABLE_UART = 1. On development images, we want serial console
# available.
ENABLE_UART = "${@bb.utils.contains('DISTRO_FEATURES','development-image','1','0',d)}"
