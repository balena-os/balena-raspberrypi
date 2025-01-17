LINUX_VERSION ?= "6.12.1"
LINUX_RPI_BRANCH ?= ""
LINUX_RPI_KMETA_BRANCH ?= "yocto-6.12"

SRCREV_machine = "614fa9b0b1a21c0cc320b9915393bdaa31357de9"
SRCREV_meta = "96ce9b7ee67702aec75816c4d44a527061c418c5"

KMETA = "kernel-meta"

SRC_URI = " \
          git://github.com/raspberrypi/linux.git;name=machine;nobranch=1;protocol=https \
          git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
"
SRC_URI:remove = "file://initramfs-image-bundle.cfg"
SRC_URI:remove = "file://vc4graphics.cfg"
SRC_URI:remove = "file://default-cpu-governor.cfg"

require recipes-kernel/linux/linux-raspberrypi.inc

inherit balena-bootloader

BALENA_DEFCONFIG_NAME = "${KBUILD_DEFCONFIG}"

BALENA_CONFIGS:append = " \
    rpisense \
    "

BALENA_CONFIGS[rpisense] = " \
    CONFIG_MFD_RPISENSE_CORE=n \
    CONFIG_FB_RPISENSE=n \
    "

BALENA_CONFIGS_DEPS[secureboot] += " \
    CONFIG_MODULE_SIG_FORMAT=y \
    CONFIG_PKCS7_MESSAGE_PARSER=y \
    CONFIG_SYSTEM_DATA_VERIFICATION=y \
    CONFIG_SIGNED_PE_FILE_VERIFICATION=y \
    "

BALENA_CONFIGS[secureboot] += " \
    CONFIG_KEXEC_IMAGE_VERIFY_SIG=y \
    "

do_deploy:append () {
    BOOTENV_FILE="${DEPLOYDIR}/${KERNEL_PACKAGE_NAME}/bootenv"
    grub-editenv "${BOOTENV_FILE}" create
    grub-editenv "${BOOTENV_FILE}" set "resin_root_part=A"
    grub-editenv "${BOOTENV_FILE}" set "bootcount=0"
    grub-editenv "${BOOTENV_FILE}" set "upgrade_available=0"
}

do_deploy[depends] += " grub-native:do_populate_sysroot"

KERNEL_DTC_FLAGS += "-@ -H epapr"

INITRAMFS_IMAGE = "balena-image-bootloader-initramfs"

KERNEL_PACKAGE_NAME = "balena-bootloader"

KERNEL_DEVICETREE = "${RPI_KERNEL_DEVICETREE}"

PROVIDES = "virtual/balena-bootloader"
