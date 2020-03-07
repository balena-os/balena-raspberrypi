inherit kernel-resin

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_fincm3 = " \
	file://0004-mmc-pwrseq-Repurpose-for-Marvell-SD8777.patch \
	file://0005-balena-fin-wifi-sta-uap-mode.patch \
	file://0007-mmc-sdhci-add-tuning-error-codes.patch \
	file://0008-mmc-sdhci-Export-sdhci_request.patch \
	file://0009-mmc-sdhci-add-adma_table_cnt-member-to-struct-sdhci_.patch \
	file://0010-mmc-sdhci-introduce-adma_write_desc-hook-to-struct-s.patch \
	file://0011-mmc-sdhci-Add-version-V4-definition.patch \
	file://0012-mmc-sdhci-Add-sd-host-v4-mode.patch \
	file://0013-mmc-sdhci-Change-SDMA-address-register-for-v4-mode.patch \
	file://0014-mmc-sdhci-Add-ADMA2-64-bit-addressing-support-for-V4.patch \
	file://0015-mmc-sdhci-Add-32-bit-block-count-support-for-v4-mode.patch \
	file://0016-mmc-sdhci-Add-Auto-CMD-Auto-Select-support.patch \
	file://0017-mmc-sdhci-SDMA-may-use-Auto-CMD23-in-v4-mode.patch \
	file://0018-mmc-sdhci-fix-__sdhci_adma_write_desc.patch \
	file://0020-mmc-sdhci-Convert-sdhci_allocate_bounce_buffer-to-re.patch \
	file://0024-mmc-sdhci-Add-quirk-to-disable-LED-control.patch \
	file://0025-mmc-sdhci-Fix-sdhci_do_enable_v4_mode.patch \
	file://0027-mmc-sdhci-add-delay-after-the-last-tuning-command.patch \
	file://0028-mmc-sdhci-correct-the-maximum-timeout-when-enable-CM.patch \
	file://0029-mmc-sdhci-Add-ADMA3-DMA-support-for-V4-enabled-host.patch \
	file://0030-mmc-sdhci-use-WP-GPIO-in-sdhci_check_ro.patch \
	file://0032-mmc-sdhci-allow-host-to-specify-maximum-tuning-loops.patch \
	file://0033-mmc-sdhci-Reorganize-sdhci_finish_mrq-and-__sdhci_fi.patch \
	file://0034-mmc-sdhci-Move-timer-and-has_requests-functions.patch \
	file://0035-mmc-sdhci-Move-some-processing-to-__sdhci_finish_mrq.patch \
	file://0036-mmc-sdhci-Call-mmc_request_done-from-IRQ-handler-if-.patch \
	file://0037-mmc-sdhci-Remove-finish_tasklet.patch \
	file://0038-mmc-sdhci-Fix-SDIO-IRQ-thread-deadlock.patch \
"

SRC_URI_append = " \
	file://0002-wireless-wext-Bring-back-ndo_do_ioctl-fallback.patch \
	file://0003-leds-pca963x-Fix-MODE2-initialization.patch \
	file://0001-Add-npe-x500-m3-overlay.patch \
	file://0006-overlays-Add-Hyperpixel4-overlays.patch \
"

SRC_URI_append_raspberrypi4-64 = " \
        file://0001-Fbcon-ignore-events-for-rpi-sense-fb.patch \
"

# Set console accordingly to build type
DEBUG_CMDLINE = "dwc_otg.lpm_enable=0 console=tty1 console=serial0,115200 rootfstype=ext4 rootwait"
PRODUCTION_CMDLINE = "dwc_otg.lpm_enable=0 console=null rootfstype=ext4 rootwait vt.global_cursor_default=0"
CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES','development-image',"${DEBUG_CMDLINE}","${PRODUCTION_CMDLINE}",d)}"
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
