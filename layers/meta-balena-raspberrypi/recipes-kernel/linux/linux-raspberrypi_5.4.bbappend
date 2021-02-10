inherit kernel-resin

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "5.4.83"

SRCREV_machine = "76c49e60e742d0bebd798be972d67dd3fd007691"

# No 5.4.83 available, use 5.4.82
SRCREV_meta = "e872ef155c596e4cc2f68405d85ab6f2b0303c28"

SRC_URI_append_fincm3 = " \
	file://0004-mmc-pwrseq-Repurpose-for-Marvell-SD8777.patch \
	file://0005-balena-fin-wifi-sta-uap-mode.patch \
	file://0007-overlays-Add-spyfly.dts.patch \
"

SRC_URI_append = " \
	file://0002-wireless-wext-Bring-back-ndo_do_ioctl-fallback.patch \
	file://0001-Add-npe-x500-m3-overlay.patch \
	file://0006-overlays-Add-Hyperpixel4-overlays.patch \
	file://0001-waveshare-sim7600-Add-dtbo-for-this-modem.patch \
	file://0001-Add-tpm-slb9670-tis-spi-DT-overlay.patch \
"

SRC_URI_append_raspberrypi4-64 = " \
	file://0001-reset-Add-a-header-for-the-RPi-Firmware-reset-controller.patch \
	file://0002-reset-Add-Raspberry-Pi-4-firmware-reset-controller.patch \
	file://0003-ARM-dts-bcm2711-Add-firmware-usb-reset-node.patch \
	file://0004-ARM-dts-bcm2711-Add-reset-controller-to-xHCI-node.patch \
	file://0007-usb-host-pci-quirks-Bypass-xHCI-quirks-for-Raspberry-Pi-4.patch \
	file://0008-usb-xhci-pci-Raspberry-Pi-FW-loader-for-VIA-VL805.patch \
	file://rpi4-fix-usb-boot-8GB.patch \
"

SRC_URI_append_rt-rpi-300 = " \
	file://rt-rpi-300-Add-changes-for-this-dt.patch \
	file://rt-rpi-Add-ch-432t-driver-for-this-chip.patch \
"

# Set console accordingly to build type
DEBUG_CMDLINE = "dwc_otg.lpm_enable=0 console=tty1 console=serial0,115200 rootwait"
PRODUCTION_CMDLINE = "dwc_otg.lpm_enable=0 console=null rootwait vt.global_cursor_default=0"
CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES','development-image',"${DEBUG_CMDLINE}","${PRODUCTION_CMDLINE}",d)}"

# See https://github.com/raspberrypi/linux/commit/9b0efcc1ec497b2985c6aaa60cd97f0d2d96d203
CMDLINE_append = " cgroup_enable=memory"
CMDLINE_DEBUG = ""

RESIN_CONFIGS_append = " fbtft"
RESIN_CONFIGS[fbtft] = " \
    CONFIG_STAGING=y \
    CONFIG_FB_TFT=m \
    CONFIG_FB_TFT_AGM1264K_FL=m \
    CONFIG_FB_TFT_BD663474=m \
    CONFIG_FB_TFT_HX8340BN=m \
    CONFIG_FB_TFT_HX8347D=m \
    CONFIG_FB_TFT_HX8353D=m \
    CONFIG_FB_TFT_ILI9163=m \
    CONFIG_FB_TFT_ILI9320=m \
    CONFIG_FB_TFT_ILI9325=m \
    CONFIG_FB_TFT_ILI9340=m \
    CONFIG_FB_TFT_ILI9341=m \
    CONFIG_FB_TFT_ILI9481=m \
    CONFIG_FB_TFT_ILI9486=m \
    CONFIG_FB_TFT_PCD8544=m \
    CONFIG_FB_TFT_RA8875=m \
    CONFIG_FB_TFT_S6D02A1=m \
    CONFIG_FB_TFT_S6D1121=m \
    CONFIG_FB_TFT_SSD1289=m \
    CONFIG_FB_TFT_SSD1306=m \
    CONFIG_FB_TFT_SSD1331=m \
    CONFIG_FB_TFT_SSD1351=m \
    CONFIG_FB_TFT_ST7735R=m \
    CONFIG_FB_TFT_TINYLCD=m \
    CONFIG_FB_TFT_TLS8204=m \
    CONFIG_FB_TFT_UC1701=m \
    CONFIG_FB_TFT_UPD161704=m \
    CONFIG_FB_TFT_WATTEROTT=m \
    CONFIG_FB_FLEX=m \
    CONFIG_FB_TFT_FBTFT_DEVICE=m \
    "

RESIN_CONFIGS_append = " pca955_gpio_expander"
RESIN_CONFIGS[pca955_gpio_expander] = " \
    CONFIG_GPIO_PCA953X=y \
    CONFIG_GPIO_PCA953X_IRQ=y \
    "

KERNEL_MODULE_PROBECONF += "rtl8192cu"
module_conf_rtl8192cu = "blacklist rtl8192cu"

# requested by customer (support for Kontron PLD devices)
RESIN_CONFIGS_append = " gpio_i2c_kempld"
RESIN_CONFIGS_DEPS[gpio_i2c_kempld] = " \
    CONFIG_GPIOLIB=y \
    CONFIG_I2C=y \
    CONFIG_HAS_IOMEM=y \
    CONFIG_MFD_KEMPLD=m \
"
RESIN_CONFIGS[gpio_i2c_kempld] = " \
    CONFIG_GPIO_KEMPLD=m \
    CONFIG_I2C_KEMPLD=m \
"

# make sure watchdog gets enabled no matter of the BSP changes
RESIN_CONFIGS_append = " rpi_watchdog"
RESIN_CONFIGS_DEPS[rpi_watchdog] = " \
    CONFIG_WATCHDOG=y \
"
RESIN_CONFIGS[rpi_watchdog] = " \
    CONFIG_BCM2835_WDT=y \
"

RESIN_CONFIGS_append = " kvaser_usb_can_driver"

RESIN_CONFIGS[kvaser_usb_can_driver] = " \
    CONFIG_CAN_KVASER_USB=m \
"

RESIN_CONFIGS_append = " mcp251x_can_driver"

RESIN_CONFIGS[mcp251x_can_driver] = " \
    CONFIG_CAN_MCP251X=m \
"

RESIN_CONFIGS_DEPS[mcp251x_can_driver] = " \
    CONFIG_SPI=y \
    CONFIG_HAS_DMA=y \
"

RESIN_CONFIGS_append = " can_calc_bittiming"

RESIN_CONFIGS[can_calc_bittiming] = " \
		CONFIG_CAN_CALC_BITTIMING=y \
"

RESIN_CONFIGS_DEPS[can_calc_bittiming] = " \
		CONFIG_CAN_DEV=y \
"

RESIN_CONFIGS_append = " ds1307_rtc_driver"

RESIN_CONFIGS[ds1307_rtc_driver] = " \
    CONFIG_RTC_DRV_DS1307=m \
"

RESIN_CONFIGS_DEPS[ds1307_rtc_driver] = " \
    CONFIG_I2C=y \
"

RESIN_CONFIGS_append = " sc16is7xx_serial_driver"

RESIN_CONFIGS[sc16is7xx_serial_driver] = " \
    CONFIG_SERIAL_SC16IS7XX=m \
"

RESIN_CONFIGS_DEPS[sc16is7xx_serial_driver] = " \
    CONFIG_I2C=y \
"

RESIN_CONFIGS_append = " mcp3422_adc_driver"

RESIN_CONFIGS[mcp3422_adc_driver] = " \
    CONFIG_MCP3422=m \
"

RESIN_CONFIGS_DEPS[mcp3422_adc_driver] = " \
    CONFIG_I2C=y \
"

RESIN_CONFIGS_append = " sd8787_pwrseq_driver"

RESIN_CONFIGS[sd8787_pwrseq_driver] = " \
    CONFIG_PWRSEQ_SD8787=y \
"

RESIN_CONFIGS_DEPS[sd8787_pwrseq_driver] = " \
    CONFIG_OF=y \
"

RESIN_CONFIGS_append = " serial_8250"
RESIN_CONFIGS[serial_8250] = " \
    CONFIG_SERIAL_8250=y \
    CONFIG_SERIAL_8250_CONSOLE=y \
    CONFIG_SERIAL_8250_NR_UARTS=1 \
    CONFIG_SERIAL_8250_EXTENDED=y \
    CONFIG_SERIAL_8250_SHARE_IRQ=y \
    CONFIG_SERIAL_8250_BCM2835AUX=y \
"

RESIN_CONFIGS_append_rt-rpi-300 = " rtrpi300cfgs"
RESIN_CONFIGS[rtrpi300cfgs] = " \
    CONFIG_RTC_DRV_RX8010=m \
    CONFIG_SPI=y \
    CONFIG_SPI_BCM2835=m \
    CONFIG_CH432T_SPI=m \
"
