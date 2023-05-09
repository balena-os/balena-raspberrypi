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

# Increase Root File system size
IMAGE_ROOTFS_SIZE:revpi-connect-s ?= "319488"
IMAGE_OVERHEAD_FACTOR:revpi-connect-s ?= "1.0"
IMAGE_ROOTFS_EXTRA_SPACE:revpi-connect-s ?= "53248"
IMAGE_ROOTFS_MAXSIZE:revpi-connect-s ?= "372736"

# Customize balenaos-img
BALENA_IMAGE_BOOTLOADER:rpi = "rpi-bootfiles"
BALENA_BOOT_PARTITION_FILES:rpi = " \
    u-boot.bin:/${SDIMG_KERNELIMAGE} \
    boot.scr:/boot.scr \
    bootfiles:/ \
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

do_resin_boot_dirgen_and_deploy[depends] += "virtual/kernel:do_install"

RPI_KERNEL_DEVICETREE:remove:revpi = "bcm2708-rpi-zero-w.dtb bcm2710-rpi-3-b-plus.dtb bcm2711-rpi-4-b.dtb"
