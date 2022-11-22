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

# Customize balenaos-img
BALENA_IMAGE_BOOTLOADER:rpi = "rpi-bootfiles"
BALENA_BOOT_PARTITION_FILES:rpi = " \
    u-boot.bin:/${SDIMG_KERNELIMAGE} \
    boot.scr:/boot.scr \
    bootfiles:/ \
    "

BALENA_BOOT_PARTITION_FILES:append:revpi-core-3 = " revpi-core-dt-blob-overlay.dtb:/dt-blob.bin"

BALENA_BOOT_PARTITION_FILES:append:revpi-connect = " revpi-connect-dt-blob-overlay.dtb:/dt-blob.bin"

python overlay_dtbs_handler () {
    # Add all the dtb files programatically
    for soc_fam in d.getVar('SOC_FAMILY', True).split(':'):
        if soc_fam == 'rpi':
            resin_boot_partition_files = d.getVar('BALENA_BOOT_PARTITION_FILES', True)
            # All changes to KERNEL_DEVICETREE are local and cannot be modified
            # globally, thus we save the list of existing overlays when they are built
            f = open(d.getVar('DEPLOY_DIR_IMAGE') + '/overlays.txt', "r")
            kernel_devicetree = f.read()
            f.close
            d.setVar('KERNEL_DEVICETREE', kernel_devicetree)
            overlay_dtbs = split_overlays(d, 0)
            root_dtbs = split_overlays(d, 1)

            for dtb in root_dtbs.split():
                dtb = os.path.basename(dtb)
                # newer kernels (5.4 onward) introduce overlay_map.dtb which needs to be deployed in the overlays directory
                if dtb == 'overlay_map.dtb':
                    resin_boot_partition_files += "\t%s:/overlays/%s" % (dtb, dtb)
                    continue
                resin_boot_partition_files += "\t%s:/%s" % (dtb, dtb)

            for dtb in overlay_dtbs.split():
                dtb = os.path.basename(dtb)
                resin_boot_partition_files += "\t%s:/overlays/%s" % (dtb, dtb)

            d.setVar('BALENA_BOOT_PARTITION_FILES', resin_boot_partition_files)

            break
}

do_resin_boot_dirgen_and_deploy[prefuncs] += "overlay_dtbs_handler"

IMAGE_INSTALL:append:rpi = " u-boot"

do_resin_boot_dirgen_and_deploy[depends] += "virtual/kernel:do_install"

RPI_KERNEL_DEVICETREE:remove:revpi = "bcm2708-rpi-zero-w.dtb bcm2710-rpi-3-b-plus.dtb bcm2711-rpi-4-b.dtb"
