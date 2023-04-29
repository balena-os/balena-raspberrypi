FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "5.10.152"

SRCREV = "raspberrypi-kernel_1%9.20221118-5.10.152+revpi1"
SRC_URI = " \
	git://github.com/RevolutionPi/linux;protocol=https;branch=revpi-5.10 \
"

require recipes-kernel/linux/linux-raspberrypi.inc

SRC_URI:remove = "file://rpi-kernel-misc.cfg"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
