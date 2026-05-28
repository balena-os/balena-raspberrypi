FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:${THISDIR}/${MACHINE}:${THISDIR}/files:"

SRC_URI:append:raspberrypi4-superhub = " \
	file://0001-Add-gpio-wdt-DT-overlay-for-Phoenix-Board.patch \
	file://0002-Add-infineon-tpm-DT-overlay-for-Phoenix-Board.patch \
	file://0003-Add-spi1-DT-overlay-for-Phoenix-Board.patch \
	file://0004-Add-SD-host-DT-overlay-for-Phoenix-Board.patch \
"

SRC_URI:append:raspberrypicm4-ioboard = " \
	file://0001-Add-ed-mcp2515-overlay-and-ed-sdhost-overlay.patch \
"

SRC_URI:append = " \
	file://0002-wireless-wext-Bring-back-ndo_do_ioctl-fallback.patch \
	file://0001-Add-npe-x500-m3-overlay.patch \
	file://0006-overlays-Add-Hyperpixel4-overlays.patch \
	file://0001-Add-tpm-slb9670-tis-spi-DT-overlay.patch \
	file://0001-seeed-studio-can-bus-v2-Add-dtbo-for-this-can-bus.patch \
	file://0011-USB-serial-Add-support-for-more-Quectel-modules.patch \
	file://0001-waveshare-sim7600-Add-dtbo-for-this-modem.patch \
	file://0001-overlays-Add-overlay-for-Seeed-reComputer-R1000.patch \
	file://0001-overlays-Add-overlay-for-RPI-PLC-SC16IS752.patch \
	file://0010-dts-overlays-Add-UniPi-overlays.patch \
"

SRC_URI:remove:raspberrypi = "file://0010-dts-overlays-Add-UniPi-overlays.patch"

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
