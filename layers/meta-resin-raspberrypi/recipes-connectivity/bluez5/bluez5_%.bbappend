FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# XXX raspberrypi3-64 inherits raspberrypi and raspberrypi3.
# this is a type of uniq(SRC_URI)
do_patch_prepend() {
    src_uri = d.getVar("SRC_URI", True)
    unique = " ".join(list(set(src_uri.split())))
    d.setVar("SRC_URI", unique)
}

# apply the same patches we apply for the rpi3. this makes bluetooth on
# rpi0-wireless actually work.
# The following was copied from meta-raspberrypi/ - keep it in sync.

SRC_URI_append_raspberrypi = " \
    file://BCM43430A1.hcd \
    file://0001-bcm43xx-Add-bcm43xx-3wire-variant.patch \
    file://0002-bcm43xx-The-UART-speed-must-be-reset-after-the-firmw.patch \
    file://0003-Increase-firmware-load-timeout-to-30s.patch \
    file://0004-Move-the-43xx-firmware-into-lib-firmware.patch \
    file://brcm43438.service \
    "

do_install_append_raspberrypi() {
    install -d ${D}/lib/firmware/brcm/
    install -m 0644 ${WORKDIR}/BCM43430A1.hcd ${D}/lib/firmware/brcm/BCM43430A1.hcd

    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
        install -m 0644 ${WORKDIR}/brcm43438.service ${D}${systemd_unitdir}/system
    fi
}

FILES_${PN}_append_raspberrypi = " \
    /lib/firmware/brcm/BCM43430A1.hcd \
    "

SYSTEMD_SERVICE_${PN}_append_raspberrypi = " brcm43438.service"
