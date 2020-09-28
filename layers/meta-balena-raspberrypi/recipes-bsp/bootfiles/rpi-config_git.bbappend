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

do_deploy_append_npe-x500-m3() {
  # Use the NPE X500 M3 device tree overlay
  echo "dtoverlay=npe-x500-m3" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}

do_deploy_append_revpi-core-3() {
    cat >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt << EOF

# serial port needs to be kept clean for RS485 communication
avoid_warnings=1

dtoverlay=revpi-core

EOF
    # prevent u-boot logging on uart
    sed -i 's/enable_uart=1//' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}

# On Raspberry Pi 3 and Raspberry Pi Zero WiFi, serial ttyS0 console is only
# usable if ENABLE_UART = 1. On development images, we want serial console
# available.
ENABLE_UART = "${@bb.utils.contains('DISTRO_FEATURES','development-image','1','0',d)}"
