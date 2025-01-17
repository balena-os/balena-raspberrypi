# Due to an issue on CM3 we use FAT32 for boot partition on RaspberryPi boards
# See:
# https://www.raspberrypi.org/documentation/hardware/computemodule/cm-emmc-flashing.md
BALENA_BOOT_FAT32 = "1"

IMAGE_FSTYPES:append:rpi = " balenaos-img"

# Kernel image name is different on Raspberry Pi 1/2/3-64bit
SDIMG_KERNELIMAGE:raspberrypi  ?= "kernel.img"
SDIMG_KERNELIMAGE:raspberrypi2 ?= "kernel7.img"
SDIMG_KERNELIMAGE:raspberrypi3-64 ?= "kernel8.img"
SDIMG_KERNELIMAGE:raspberrypi0-2w-64 ?= "kernel8.img"

# We want to stick with kernel8.img for the Pi5,
# even though upstream uses kernel_2712.img
SDIMG_KERNELIMAGE:raspberrypi5 ?= "kernel8.img"

# Double the root partition size from 320MiB to 640MiB and boot partition size from 40MiB to 80MiB for the Pi5
IMAGE_ROOTFS_SIZE:raspberrypi5="655360"
BALENA_BOOT_SIZE:raspberrypi5="81920"

# Increase boot partition size
BALENA_BOOT_SIZE:raspberrypicm4-ioboard-sb = "131072"

# Increase Root File system size
IMAGE_ROOTFS_SIZE:revpi-connect-s ?= "319488"
IMAGE_OVERHEAD_FACTOR:revpi-connect-s ?= "1.0"
IMAGE_ROOTFS_EXTRA_SPACE:revpi-connect-s ?= "53248"
IMAGE_ROOTFS_MAXSIZE:revpi-connect-s ?= "372736"

IMAGE_ROOTFS_SIZE:revpi-connect-4 ?= "319488"
IMAGE_OVERHEAD_FACTOR:revpi-connect-4 ?= "1.0"
IMAGE_ROOTFS_EXTRA_SPACE:revpi-connect-4 ?= "53248"
IMAGE_ROOTFS_MAXSIZE:revpi-connect-4 ?= "372736"

# Customize balenaos-img
BALENA_IMAGE_BOOTLOADER:rpi = "rpi-bootfiles"
BALENA_BOOT_PARTITION_FILES:rpi = " \
    u-boot.bin:/${SDIMG_KERNELIMAGE} \
    boot.scr:/boot.scr \
    bootfiles:/ \
    "

BALENA_BOOT_PARTITION_FILES:remove:raspberrypicm4-ioboard-sb = " \
    u-boot.bin:/${SDIMG_KERNELIMAGE} \
    boot.scr:/boot.scr \
    "

BALENA_BOOT_PARTITION_FILES:append:raspberrypicm4-ioboard-sb = " \
    balena-bootloader/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin:/${SDIMG_KERNELIMAGE} \
    balena-bootloader/bootenv:/bootenv \
    "

BALENA_ESSENTIAL_BOOT_FILES:append:raspberrypi4-64 = " \
    cmdline.txt  \
    config.txt  \
    fixup4cd.dat  \
    fixup4.dat  \
    fixup4x.dat  \
    start4cd.elf \
    start4.elf \
    start4x.elf \
    ${SDIMG_KERNELIMAGE} \
    ${KERNEL_IMAGETYPE} \
    "
do_rootfs[vardeps] += "${@oe.utils.conditional('SIGN_API','','','BALENA_ESSENTIAL_BOOT_FILES',d)}"

BALENA_BOOT_PARTITION_FILES:remove:raspberrypi5 = " \
    u-boot.bin:/${SDIMG_KERNELIMAGE} \
    boot.scr:/boot.scr \
    "

BALENA_BOOT_PARTITION_FILES:append:raspberrypi5 = " \
    balena-bootloader/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin:/${SDIMG_KERNELIMAGE} \
    balena-bootloader/bootenv:/bootenv \
    "

BALENA_BOOT_PARTITION_FILES:append:revpi-core-3 = " revpi-core-dt-blob-overlay.dtb:/dt-blob.bin"

BALENA_BOOT_PARTITION_FILES:append:revpi-connect = " revpi-connect-dt-blob-overlay.dtb:/dt-blob.bin"

BALENA_BOOT_PARTITION_FILES:append:revpi-connect-s = " revpi-connect-dt-blob-overlay.dtb:/dt-blob.bin"

python overlay_dtbs_handler () {
    # Add all the dtb files programatically
    for soc_fam in d.getVar('SOC_FAMILY', True).split(':'):
        if soc_fam == 'rpi':
            f = open(d.getVar('DEPLOY_DIR_IMAGE') + '/overlays.txt', "r")
            kernel_devicetree = f.read()
            f.close
            # Sanity check. Should be removed once the issue is confirmed to be fixed
            debug_missing_dtbo = 'gpio-poweroff.dtbo'
            if not debug_missing_dtbo in kernel_devicetree:
                bb.fatal('Sanity check: ' + debug_missing_dtbo + ' not found in overlay list! Overlays list contents:' + kernel_devicetree)
            d.setVar('KERNEL_DEVICETREE', kernel_devicetree)
            resin_boot_partition_files=make_dtb_boot_files(d)
            for entry in resin_boot_partition_files.split(' '):
                if ';' in entry:
                    source = entry.split(';')[0]
                    dest = entry.split(';')[1]
                else:
                    source = entry
                    dest = entry
                d.appendVar('BALENA_BOOT_PARTITION_FILES', ' ' + source.strip() + ':/' + dest.strip())
            break
}

do_resin_boot_dirgen_and_deploy[prefuncs] += "overlay_dtbs_handler"

IMAGE_INSTALL:append:rpi = " u-boot"
IMAGE_INSTALL:remove:raspberrypicm4-ioboard-sb = " u-boot"
IMAGE_INSTALL:append:raspberrypicm4-ioboard-sb = " grub-editenv"
IMAGE_INSTALL:remove:raspberrypi5 = " u-boot"
IMAGE_INSTALL:append:raspberrypi5 = " grub-editenv"

do_rootfs[depends] += "${@oe.utils.conditional('MACHINE','raspberrypicm4-ioboard-sb',' virtual/balena-bootloader:do_deploy','',d)}"
do_image_balenaos_img[depends] += "${@oe.utils.conditional('MACHINE','raspberrypicm4-ioboard-sb',' virtual/balena-bootloader:do_deploy','',d)}"
do_rootfs[depends] += "${@oe.utils.conditional('MACHINE','raspberrypi5',' virtual/balena-bootloader:do_deploy','',d)}"
do_image_balenaos_img[depends] += "${@oe.utils.conditional('MACHINE','raspberrypi5',' virtual/balena-bootloader:do_deploy','',d)}"

do_resin_boot_dirgen_and_deploy[depends] += "virtual/kernel:do_install"

RPI_KERNEL_DEVICETREE:remove:revpi = "bcm2708-rpi-zero-w.dtb bcm2710-rpi-3-b-plus.dtb bcm2711-rpi-4-b.dtb"

# this being a pi4 based board, increase to 400 MiB (up from 320 MiB) to make sure we have enough space in the rootfs
IMAGE_ROOTFS_SIZE:raspberrypi4-superhub="409600"
IMAGE_ROOTFS_SIZE:raspberrypicm4-ioboard-sb="409600"

IMAGE_INSTALL:append:raspberrypi4-superhub = " \
    phoenix-peripheral \
    phoenix-peripheral-button-trig \
    phoenix-peripheral-lvd-hook \
    phoenix-peripheral-gpio-wdt \
    phoenix-peripheral-rtc-sync \
"

BALENA_BOOT_PARTITION_FILES:append:raspberrypi4-64 = " \
    rpi-eeprom/pieeprom-latest-stable.bin:/pieeprom-latest-stable.bin \
    rpi-eeprom/vl805-latest-stable.bin:/vl805-latest-stable.bin \
"

BALENA_BOOT_PARTITION_FILES:append:raspberrypi4-64 = "${@oe.utils.conditional('SIGN_API','','',' rpi-eeprom/pieeprom-latest-stable.sig:/pieeprom-latest-stable.sig',d)}"

inherit image-sign-rpi

