LINUX_VERSION ?= "5.15.34"
LINUX_RPI_BRANCH ?= "rpi-5.15.y"
LINUX_RPI_KMETA_BRANCH ?= "yocto-5.15"

SRCREV_machine = "0086da6acd41600d47b87b05874f99704216426f"
SRCREV_meta = "e1b976ee4fb5af517cf01a9f2dd4a32f560ca894"

KMETA = "kernel-meta"

SRC_URI = " \
          git://github.com/raspberrypi/linux.git;name=machine;branch=${LINUX_RPI_BRANCH};protocol=https \
          git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
"
SRC_URI:append = " file://rpi-kexec.cfg"
SRC_URI:remove:raspberrypi4-64 = "file://rpi4-64-kernel-misc.cfg"
SRC_URI:remove:raspberrypi4-64 = "file://vc4graphics.cfg"
SRC_URI:remove:raspberrypi4-64 = "file://initramfs-image-bundle.cfg"

require recipes-kernel/linux/linux-raspberrypi.inc
require linux-raspberrypi-balena.inc

KERNEL_DTC_FLAGS += "-@ -H epapr"

INITRAMFS_IMAGE = "balena-image-boot-initramfs"

KERNEL_PACKAGE_NAME = "balena-kboot"

KERNEL_DEVICETREE = "${RPI_KERNEL_DEVICETREE}"

PROVIDES = "virtual/balena-kboot"
