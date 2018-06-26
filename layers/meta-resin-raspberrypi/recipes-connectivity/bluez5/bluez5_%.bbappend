SRC_URI_append_raspberrypi = " ${BCM_BT_SOURCES}"

do_install_append_raspberrypi() {
    enable_bcm_bluetooth
}

SYSTEMD_SERVICE_${PN}_append_raspberrypi = " ${BCM_BT_SERVICE}"

RDEPENDS_${PN}_append_raspberrypi = " ${BCM_BT_RDEPENDS}"
