FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "4.9.76"

SRCREV = "4df2f71c072b25e04fbc84152f8bb9e5712bdea0"
SRC_URI = " \
	git://github.com/RevolutionPi/linux;branch=revpi-4.9 \
"

require linux-raspberrypi.inc

RPI_KERNEL_DEVICETREE_remove = "bcm2710-rpi-3-b-plus.dtb"
