FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "4.19.95"

SRCREV = "raspberrypi-kernel_9.20200616-4.19.95+revpi1"
SRC_URI = " \
	git://github.com/RevolutionPi/linux;branch=revpi-4.19;protocol=https \
"

require recipes-kernel/linux/linux-raspberrypi.inc

SRC_URI_remove = "file://rpi-kernel-misc.cfg"

LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
