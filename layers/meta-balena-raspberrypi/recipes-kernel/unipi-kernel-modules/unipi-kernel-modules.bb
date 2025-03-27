SUMMARY = "UniPi Neuron/Axon kernel modules"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://github.com/UniPiTechnology/unipi-kernel.git;protocol=https;nobranch=1 \
	file://0001-unipi_tty-Fix-compile-on-kernel-5.10.patch \
	file://0002-unipi_spi-use-new-structure-for-SPI-transfer-delays.patch \
	file://0003-unipi_tty-remove-TTY_LDISC_MAGIC.patch \
	file://0004-unipi_tty-remove-ldisc-number-in-tty_register_ldisc-.patch \
	file://0005-unipi_tty-adapt-to-fp-of-tty_ldisc_ops-made-const.patch \
	file://0006-unipi_spi-adapt-to-removal-of-spi_set_cs_timing.patch \
	file://0007-rtc-unipi-Adapt-to-removal-of-nvram-ABI.patch \
	file://0008-rtc-unipi-Add-devm-to-rtc_nvmem_register.patch \
	file://0009-rtc-unipi-Adapt-to-rename-of-rtc_register_device.patch \
	file://0010-unipispi-Add-deinit-chardev.patch \
	file://0011-Add-back-LED-driver-unregister-logs.patch \
"

# Corresponds to v1.80
SRCREV = "4f09337d748936388e49ee7715854bf8aa3ee937"

S = "${WORKDIR}/git"

MODULES_MODULE_SYMVERS_LOCATION = "modules/unipi"
EXTRA_OEMAKE:append = " LINUX_DIR_PATH=${STAGING_KERNEL_DIR}"
