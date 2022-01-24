FILESEXTRAPATHS:prepend:rpi := "${THISDIR}/files:"

RDEPENDS:${PN}:append = " kmod"
