FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_remove_fincm3 = "file://0001-bcm43xx-Add-bcm43xx-3wire-variant.patch"
SRC_URI_remove_fincm3 = "file://0002-bcm43xx-The-UART-speed-must-be-reset-after-the-firmw.patch"
SRC_URI_remove_fincm3 = "file://0003-Increase-firmware-load-timeout-to-30s.patch"
SRC_URI_remove_fincm3 = "file://0004-Move-the-43xx-firmware-into-lib-firmware.patch"

RDEPENDS_${PN}_remove_fincm3 = "pi-bluetooth"

# These patches are specific to this device's
# use-case and should be removed once
# an updated Bluez version from Poky includes them.
SRC_URI_append_nebra-hnt = " \
    file://fix-registerin-dis-without-valid-source.patch \
    file://main-conf-enable-passing-false-deviceid.patch \
    file://main.conf \
"

do_install_append_nebra-hnt() {
    install -d ${D}${sysconfdir}/bluetooth
    install -m 644  ${WORKDIR}/main.conf ${D}/etc/bluetooth
}
