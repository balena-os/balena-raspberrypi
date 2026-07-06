# Built-in SPI drivers needed for API EEPROM update
# Otherwise on A/B rollback modules won't match running kernel
#
# Shared by the base kernel (linux-raspberrypi_%.bbappend) and the override
# extension kernel (linux-raspberrypi-extension) so both stay in sync on
# raspberrypi4-64. Injected via BALENA_CONFIGS (do_kernel_resin_injectconfig).
BALENA_CONFIGS:append:raspberrypi4-64 = " pieeprom"
BALENA_CONFIGS[pieeprom] = " \
    CONFIG_SPI=y \
    CONFIG_SPI_BCM2835=y \
    CONFIG_SPI_SPIDEV=y \
"
