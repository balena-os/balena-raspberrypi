# Built-in SPI drivers needed for API EEPROM update
# Otherwise on A/B rollback modules won't match running kernel
#
# Kept as a standalone include, rather than inlined into the bbappend, so that
# an out-of-tree layer building a derived raspberrypi4-64 kernel can require it
# and stay in sync with the base kernel. In this layer linux-raspberrypi-balena.inc
# requires it, so the hostapp kernel and the kernel extension both get it.
#
# Injected via BALENA_CONFIGS (do_kernel_resin_injectconfig) rather than shipped
# as a fragment because it must apply only under :append:raspberrypi4-64.
BALENA_CONFIGS:append:raspberrypi4-64 = " pieeprom"
BALENA_CONFIGS[pieeprom] = " \
    CONFIG_SPI=y \
    CONFIG_SPI_BCM2835=y \
    CONFIG_SPI_SPIDEV=y \
"
