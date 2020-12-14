inherit kernel-resin

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://0001-rtc-hctosys-Correctly-guard-hw-clock-polling-code.patch"

# Set console accordingly to build type
DEBUG_CMDLINE = "dwc_otg.lpm_enable=0 console=tty1 rootwait"
PRODUCTION_CMDLINE = "dwc_otg.lpm_enable=0 console=null rootwait vt.global_cursor_default=0"
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

RESIN_CONFIGS_append = " preempt_rt"
RESIN_CONFIGS[preempt_rt] = " \
    CONFIG_PREEMPT_RT_FULL=y \
"

RESIN_CONFIGS_append = " revpi_expansion_modules_support"
RESIN_CONFIGS[revpi_expansion_modules_support] = " \
    CONFIG_KS8851=m \
    CONFIG_GPIO_74X164=m \
    CONFIG_GPIO_MAX3191X=m \
    CONFIG_TI_DAC082S085=m \
    CONFIG_MULTIPLEXER=m \
    CONFIG_MUX_GPIO=m \
    CONFIG_IIO_MUX=m \
    CONFIG_CAN_HI311X=m \
"
