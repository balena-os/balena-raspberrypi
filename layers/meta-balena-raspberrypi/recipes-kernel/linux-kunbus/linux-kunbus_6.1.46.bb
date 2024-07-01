FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "6.1.46"

SRCREV = "raspberrypi-kernel_1%9.20240205+1-6.1.46-1-revpi11+1"
SRC_URI = " \
	git://github.com/RevolutionPi/linux;protocol=https;branch=revpi-6.1 \
"
require recipes-kernel/linux/linux-raspberrypi.inc

SRC_URI:remove = "file://rpi-kernel-misc.cfg"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
