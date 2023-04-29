FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "4.19.95"

SRCREV = "raspberrypi-kernel_9.20200616-4.19.95+revpi1"
SRC_URI = " \
	git://github.com/RevolutionPi/linux;protocol=https;branch=revpi-4.19 \
"

require recipes-kernel/linux/linux-raspberrypi.inc

SRC_URI:remove = "file://rpi-kernel-misc.cfg"

SRC_URI:append = " \
    file://scripts-Fix-kernel-module-headers-build-in-Honister.patch \
    file://0001-rtc-hctosys-Correctly-guard-hw-clock-polling-code.patch \
"

LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
