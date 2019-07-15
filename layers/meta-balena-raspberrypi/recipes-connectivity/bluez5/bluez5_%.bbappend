SRC_URI_remove_fincm3 = "file://0001-bcm43xx-Add-bcm43xx-3wire-variant.patch"
SRC_URI_remove_fincm3 = "file://0002-bcm43xx-The-UART-speed-must-be-reset-after-the-firmw.patch"
SRC_URI_remove_fincm3 = "file://0003-Increase-firmware-load-timeout-to-30s.patch"
SRC_URI_remove_fincm3 = "file://0004-Move-the-43xx-firmware-into-lib-firmware.patch"

RDEPENDS_${PN}_remove_fincm3 = "pi-bluetooth"
