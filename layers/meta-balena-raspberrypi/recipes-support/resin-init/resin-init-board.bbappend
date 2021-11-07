FILESEXTRAPATHS:prepend_rpi := "${THISDIR}/files:"

RDEPENDS:${PN}:append = " kmod"
