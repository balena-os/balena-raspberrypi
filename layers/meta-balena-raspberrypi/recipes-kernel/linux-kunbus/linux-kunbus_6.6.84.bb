FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "6.6.84"

SRCREV = "v6.6.84-rt52-revpi9"
SRC_URI = " \
	git://github.com/RevolutionPi/linux;protocol=https;branch=revpi-6.6 \
"
require recipes-kernel/linux/linux-raspberrypi.inc

SRC_URI:remove = "file://rpi-kernel-misc.cfg"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI:append = " file://0001-aufs-i_op-Add-handling-for-au_pin_hdir_set_owner-wit.patch;apply=no"

apply_aufs_rt_patch () {
    if [ -d ${WORKDIR}/aufs_standalone ]; then
        git -C ${WORKDIR}/aufs_standalone am ${WORKDIR}/0001-aufs-i_op-Add-handling-for-au_pin_hdir_set_owner-wit.patch
    fi
}

do_kernel_resin_aufs_fetch_and_unpack[postfuncs] += "apply_aufs_rt_patch"
