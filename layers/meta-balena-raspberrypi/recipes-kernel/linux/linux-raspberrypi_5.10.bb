LINUX_VERSION ?= "5.10.13"
LINUX_RPI_BRANCH ?= "rpi-5.10.y"

SRCREV_machine = "34263dc81a12862c66e2593bb26c09d5fd20f46d"
SRCREV_meta = "5833ca701711d487c9094bd1efc671e8ef7d001e"

KMETA = "kernel-meta"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;name=machine;branch=${LINUX_RPI_BRANCH} \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA} \
    "

SRC_URI_append_fincm3 = " \
	file://0004-mmc-pwrseq-Repurpose-for-Marvell-SD8777.patch \
	file://0005-balena-fin-wifi-sta-uap-mode.patch \
	file://0007-overlays-Add-spyfly.dts.patch \
"

SRC_URI_append = " \
	file://0002-wireless-wext-Bring-back-ndo_do_ioctl-fallback.patch \
	file://0001-Add-npe-x500-m3-overlay.patch \
	file://0006-overlays-Add-Hyperpixel4-overlays.patch \
	file://0001-waveshare-sim7600-Add-dtbo-for-this-modem-v5.10.patch \
	file://0001-Add-tpm-slb9670-tis-spi-DT-overlay-v5.10.patch \
"

SRC_URI_append_raspberrypi4-64 = " \
	file://0008-usb-xhci-pci-Raspberry-Pi-FW-loader-for-VIA-VL805.patch \
"

SRC_URI_append_rt-rpi-300 = " \
	file://rt-rpi-300-Add-changes-for-this-dt.patch \
	file://rt-rpi-Add-ch-432t-driver-for-this-chip.patch \
"

require linux-raspberrypi.inc

KERNEL_DTC_FLAGS += "-@ -H epapr"
