SRC_URI_append_raspberrypi = " ${BCM_BT_SOURCES}"

do_install_append_raspberrypi() {
    enable_bcm_bluetooth
}

SYSTEMD_SERVICE_${PN}_append_raspberrypi = " ${BCM_BT_SERVICE}"

RDEPENDS_${PN}_append_raspberrypi = " ${BCM_BT_RDEPENDS}"

# clear out the enable_bcm_bluetooth() function as we don't use the bcm chipset on the balena fin
enable_bcm_bluetooth_fincm3() {
    :
}

SRC_URI_remove_fincm3 = " ${BCM_BT_SOURCES}"

SYSTEMD_SERVICE_${PN}_remove_fincm3 = "${BCM_BT_SERVICE}"

RDEPENDS_${PN}_remove_fincm3 = "${BCM_BT_RDEPENDS}"
