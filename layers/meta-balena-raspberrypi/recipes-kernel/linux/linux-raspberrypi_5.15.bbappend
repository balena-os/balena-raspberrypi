FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}_${LINUX_VERSION}:${THISDIR}/${PN}:${THISDIR}/${MACHINE}:"

SRC_URI:append:fincm3 = " \
	file://0001-overlays-fin-add-internal-pull-ups-to-i2c_soft.patch \
	file://0004-mmc-pwrseq-Repurpose-for-Marvell-SD8777.patch \
	file://0005-balena-fin-wifi-sta-uap-mode.patch \
	file://0007-overlays-Add-spyfly.dts.patch \
"

SRC_URI:append:raspberrypi4-superhub = " \
	file://0001-Add-gpio-wdt-DT-overlay-for-Phoenix-Board.patch \
	file://0002-Add-infineon-tpm-DT-overlay-for-Phoenix-Board.patch \
	file://0003-Add-spi1-DT-overlay-for-Phoenix-Board.patch \
	file://0004-Add-SD-host-DT-overlay-for-Phoenix-Board.patch \
"

SRC_URI:append = " \
	file://0002-wireless-wext-Bring-back-ndo_do_ioctl-fallback.patch \
	file://0001-Add-npe-x500-m3-overlay.patch \
	file://0001-seeed-studio-can-bus-v2-Add-dtbo-for-this-can-bus.patch \
	file://0011-USB-serial-Add-support-for-more-Quectel-modules.patch \
	file://0001-waveshare-sim7600-Add-dtbo-for-this-modem.patch \
	file://0001-overlays-Add-overlay-for-Seeed-reComputer-R1000.patch \
"

SRC_URI:append:rt-rpi-300 = " \
	file://rt-rpi-300-Add-changes-for-this-dt.patch \
	file://rt-rpi-Add-ch-432t-driver-for-this-chip.patch \
"

# The shared driver list comes from balena-os-drivers.cfg, added to SRC_URI by
# linux-raspberrypi_%.bbappend. This carries only the symbols that do not exist
# on newer kernels.
SRC_URI += "file://balena-os-drivers-5.15.cfg"

BALENA_CONFIGS:append:rt-rpi-300 = " rtrpi300cfgs"
BALENA_CONFIGS[rtrpi300cfgs] = " \
    CONFIG_RTC_DRV_RX8010=m \
    CONFIG_SPI=y \
    CONFIG_SPI_BCM2835=m \
    CONFIG_CH432T_SPI=m \
"

# The Pi3-64 and Pi4-64 are the only boards very low on rootfs space for now
# so we add this as per https://github.com/balena-os/meta-balena/pull/2411
BALENA_CONFIGS:append:raspberrypi4-64 = " optimize-size"
BALENA_CONFIGS:append:raspberrypi3-64 = " optimize-size"
BALENA_CONFIGS[optimize-size] = " \
    CONFIG_CC_OPTIMIZE_FOR_SIZE=y \
"

# Fix dtbo loading on 64bits,
# see commit 949b88bb for details
get_cc_option () {
		# Check if KERNEL_CC supports the option "file-prefix-map".
		# This option allows us to build images with __FILE__ values that do not
		# contain the host build path.
		if ${KERNEL_CC} -Q --help=joined | grep -q "\-ffile-prefix-map=<old=new>"; then
			echo "-ffile-prefix-map=${S}=/kernel-source/"
		fi
}
do_compile:append() {
    if [ "${SITEINFO_BITS}" = "64" ]; then
        cc_extra=$(get_cc_option)
        oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
    fi
}

# we need to clean up all the following RPI_KERNEL_DEVICETREE changes when we switch to a newer 6.x kernel
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
    bcm2710-rpi-zero-2.dtb \
    bcm2711-rpi-4-b.dtb \
    bcm2711-rpi-400.dtb \
    bcm2708-rpi-cm.dtb \
    bcm2710-rpi-cm3.dtb \
    bcm2711-rpi-cm4.dtb \
    bcm2711-rpi-cm4s.dtb \
"

RPI_KERNEL_DEVICETREE:raspberrypi0-2w-64 = " \
    broadcom/bcm2710-rpi-zero-2.dtb \
    broadcom/bcm2710-rpi-cm3.dtb \
"

# Only include arm64 dtbs for rt-rpi-300
RPI_KERNEL_DEVICETREE:rt-rpi-300 = " \
    broadcom/bcm2711-rpi-4-b.dtb \
    broadcom/bcm2711-rpi-400.dtb \
    broadcom/bcm2711-rpi-cm4.dtb \
    broadcom/bcm2711-rpi-cm4s.dtb \
"
