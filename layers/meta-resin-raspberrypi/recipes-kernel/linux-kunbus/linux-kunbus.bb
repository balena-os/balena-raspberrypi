FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "4.14.44"

SRCREV = "6cc45d85b2835ae21d36289344a10cb45430360a"
SRC_URI = " \
	git://github.com/RevolutionPi/linux;branch=revpi-4.14 \
"

require linux-raspberrypi.inc
