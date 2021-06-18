inherit kernel-resin

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

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

# We apply this fix for Pi3 and Pi3-64 (which overrides Pi3)
# only, because this is currently the only model reported
# with this issue.
SRC_URI_append_raspberrypi3 = " \
	file://0001-overlays-Make-the-i2c-gpio-overlay-safe-again.patch \
"

SRC_URI_append_raspberrypi4-64 = " \
        file://0001-Fbcon-ignore-events-for-rpi-sense-fb.patch \
"

LINUX_VERSION = "4.19.118"
SRCREV = "fe2c7bf4cad4641dfb6f12712755515ab15815ca"

# Set console accordingly to build type
CMDLINE = "dwc_otg.lpm_enable=0 rootwait"
CMDLINE += "${@bb.utils.contains('DISTRO_FEATURES','osdev-image',"console=tty1 console=serial0,115200"," vt.global_cursor_default=0 console=null",d)}"
CMDLINE_DEBUG = ""

BALENA_CONFIGS_append = " fbtft"
BALENA_CONFIGS[fbtft] = " \
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

BALENA_CONFIGS_append = " pca955_gpio_expander"
BALENA_CONFIGS[pca955_gpio_expander] = " \
    CONFIG_GPIO_PCA953X=y \
    CONFIG_GPIO_PCA953X_IRQ=y \
    "

KERNEL_MODULE_PROBECONF += "rtl8192cu"
module_conf_rtl8192cu = "blacklist rtl8192cu"

# requested by customer (support for Kontron PLD devices)
BALENA_CONFIGS_append = " gpio_i2c_kempld"
BALENA_CONFIGS_DEPS[gpio_i2c_kempld] = " \
    CONFIG_GPIOLIB=y \
    CONFIG_I2C=y \
    CONFIG_HAS_IOMEM=y \
    CONFIG_MFD_KEMPLD=m \
"
BALENA_CONFIGS[gpio_i2c_kempld] = " \
    CONFIG_GPIO_KEMPLD=m \
    CONFIG_I2C_KEMPLD=m \
"

# make sure watchdog gets enabled no matter of the BSP changes
BALENA_CONFIGS_append = " rpi_watchdog"
BALENA_CONFIGS_DEPS[rpi_watchdog] = " \
    CONFIG_WATCHDOG=y \
"
BALENA_CONFIGS[rpi_watchdog] = " \
    CONFIG_BCM2835_WDT=y \
"

BALENA_CONFIGS_append = " kvaser_usb_can_driver"

BALENA_CONFIGS[kvaser_usb_can_driver] = " \
    CONFIG_CAN_KVASER_USB=m \
"

BALENA_CONFIGS_append = " mcp251x_can_driver"

BALENA_CONFIGS[mcp251x_can_driver] = " \
    CONFIG_CAN_MCP251X=m \
"

BALENA_CONFIGS_DEPS[mcp251x_can_driver] = " \
    CONFIG_SPI=y \
    CONFIG_HAS_DMA=y \
"

BALENA_CONFIGS_append = " can_calc_bittiming"

BALENA_CONFIGS[can_calc_bittiming] = " \
		CONFIG_CAN_CALC_BITTIMING=y \
"

BALENA_CONFIGS_DEPS[can_calc_bittiming] = " \
		CONFIG_CAN_DEV=y \
"

BALENA_CONFIGS_append = " ds1307_rtc_driver"

BALENA_CONFIGS[ds1307_rtc_driver] = " \
    CONFIG_RTC_DRV_DS1307=m \
"

BALENA_CONFIGS_DEPS[ds1307_rtc_driver] = " \
    CONFIG_I2C=y \
"

BALENA_CONFIGS_append = " sc16is7xx_serial_driver"

BALENA_CONFIGS[sc16is7xx_serial_driver] = " \
    CONFIG_SERIAL_SC16IS7XX=m \
"

BALENA_CONFIGS_DEPS[sc16is7xx_serial_driver] = " \
    CONFIG_I2C=y \
"

BALENA_CONFIGS_append = " mcp3422_adc_driver"

BALENA_CONFIGS[mcp3422_adc_driver] = " \
    CONFIG_MCP3422=m \
"

BALENA_CONFIGS_DEPS[mcp3422_adc_driver] = " \
    CONFIG_I2C=y \
"

BALENA_CONFIGS_append = " sd8787_pwrseq_driver"

BALENA_CONFIGS[sd8787_pwrseq_driver] = " \
    CONFIG_PWRSEQ_SD8787=y \
"

BALENA_CONFIGS_DEPS[sd8787_pwrseq_driver] = " \
    CONFIG_OF=y \
"
