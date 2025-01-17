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

# we need to clean up all the following RPI_KERNEL_DEVICETREE changes when we switch to a newer kernel for revpi-connect and revpi-core-3
RPI_KERNEL_DEVICETREE = " \
    bcm2708-rpi-zero.dtb \
    bcm2708-rpi-zero-w.dtb \
    bcm2708-rpi-b.dtb \
    bcm2708-rpi-b-rev1.dtb \
    bcm2708-rpi-b-plus.dtb \
    bcm2709-rpi-2-b.dtb \
    bcm2710-rpi-2-b.dtb \
    bcm2710-rpi-3-b.dtb \
    bcm2710-rpi-3-b-plus.dtb \
    bcm2711-rpi-4-b.dtb \
    bcm2711-rpi-400.dtb \
    bcm2708-rpi-cm.dtb \
    bcm2710-rpi-cm3.dtb \
    bcm2711-rpi-cm4.dtb \
"
