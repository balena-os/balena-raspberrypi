FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "6.18.57"

# v6.18.57-revpi0
SRCREV = "494b36568711263bca1049e0c2bd3057479efaeb"
SRC_URI = " \
	git://gitlab.com/revolutionpi/linux.git;protocol=https;branch=revpi-6.18 \
"
require recipes-kernel/linux/linux-raspberrypi.inc

SRC_URI:remove = "file://rpi-kernel-misc.cfg"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
