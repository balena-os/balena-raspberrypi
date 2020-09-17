LINUX_VERSION ?= "4.19.118"
LINUX_RPI_BRANCH ?= "rpi-4.19.y"

SRCREV = "fe2c7bf4cad4641dfb6f12712755515ab15815ca"

require recipes-kernel/linux/linux-raspberrypi_4.19.inc
require linux-raspberrypi-balena.inc

SRC_URI_remove = "file://rpi-kernel-misc.cfg"
SRC_URI_remove_raspberrypi4-64 = "file://rpi4-64-kernel-misc.cfg"

INITRAMFS_IMAGE = "balena-image-boot-initramfs"

KERNEL_PACKAGE_NAME = "balena-kboot"

KERNEL_DEVICETREE = "${RPI_KERNEL_DEVICETREE}"

PROVIDES = "virtual/balena-kboot"
