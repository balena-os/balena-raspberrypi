inherit kernel-resin

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://0001-rtc-hctosys-Correctly-guard-hw-clock-polling-code.patch \
"

SRC_URI:append:revpi-connect = " \
    file://0001-Add-revpi-connect-can-overlay.patch \
"

# Set console accordingly to build type
CMDLINE = "dwc_otg.lpm_enable=0 rootwait"
CMDLINE += "${@bb.utils.contains('DISTRO_FEATURES','osdev-image',"console=tty1 console=serial0,115200"," vt.global_cursor_default=0 console=null",d)}"
CMDLINE_DEBUG = ""

# revpi-connect was previously added on overlay2,
# so only the core 3 needs to include this module
# further.
BALENA_CONFIGS:append:revpi-core-3 = " aufs"

BALENA_CONFIGS:append = " fbtft"
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

BALENA_CONFIGS:append = " pca955_gpio_expander"
BALENA_CONFIGS[pca955_gpio_expander] = " \
    CONFIG_GPIO_PCA953X=y \
    CONFIG_GPIO_PCA953X_IRQ=y \
    "

KERNEL_MODULE_PROBECONF += "rtl8192cu"
module_conf:rtl8192cu = "blacklist rtl8192cu"

BALENA_CONFIGS:append = " preempt_rt"
BALENA_CONFIGS[preempt_rt] = " \
    CONFIG_PREEMPT_RT_FULL=y \
"

BALENA_CONFIGS:append = " revpi_expansion_modules_support"
BALENA_CONFIGS[revpi_expansion_modules_support] = " \
    CONFIG_KS8851=m \
    CONFIG_GPIO_74X164=m \
    CONFIG_GPIO_MAX3191X=m \
    CONFIG_TI_DAC082S085=m \
    CONFIG_MULTIPLEXER=m \
    CONFIG_MUX_GPIO=m \
    CONFIG_IIO_MUX=m \
    CONFIG_CAN_HI311X=m \
"

python do_overlays() {
    import glob, re
    overlays = []
    source_path = d.getVar('S', True) + '/arch/' + d.getVar('ARCH',True) + '/boot/dts/overlays/*-overlay.dts'
    print(source_path)
    for overlay in glob.glob(source_path):
        overlays.append(re.sub(r'-overlay.dts','.dtbo',overlay).split('dts/')[-1])
    for dtbo in overlays:
        kernel_devicetree = d.getVar('KERNEL_DEVICETREE', True)
        d.setVar('KERNEL_DEVICETREE', kernel_devicetree + '   ' + dtbo)

    f = open(d.getVar('DEPLOY_DIR_IMAGE') + '/overlays.txt', "w")
    f.write(kernel_devicetree)
    f.close
}

# KERNEL_DEVICETREE has a local scope in each function, even in a :prepend,
# so the only way to alter it to include all overlays is by using the prefuncs
do_install[prefuncs] += "do_overlays"
do_compile[prefuncs] += "do_overlays"
do_deploy[prefuncs] += "do_overlays"

# we have to ensure the overlays list is populated so that
# the boot partition can be generated correctly
do_install[nostamp] = "1"
