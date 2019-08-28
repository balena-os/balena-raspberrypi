# Due to an issue on CM3 we use FAT32 for boot partition on RaspberryPi boards
# See:
# https://www.raspberrypi.org/documentation/hardware/computemodule/cm-emmc-flashing.md
BALENA_BOOT_FAT32 = "1"

IMAGE_FSTYPES_append_rpi = " resinos-img"

# Kernel image name is different on Raspberry Pi 1/2/3-64bit
SDIMG_KERNELIMAGE_raspberrypi  ?= "kernel.img"
SDIMG_KERNELIMAGE_raspberrypi2 ?= "kernel7.img"
SDIMG_KERNELIMAGE_raspberrypi3-64 ?= "kernel8.img"

# Customize resinos-img
RESIN_IMAGE_BOOTLOADER_rpi = "bcm2835-bootfiles"
RESIN_BOOT_PARTITION_FILES_rpi = " \
    u-boot.bin:/${SDIMG_KERNELIMAGE} \
    boot.scr:/boot.scr \
    bcm2835-bootfiles:/ \
    "

python overlay_dtbs_handler () {
    # Add all the dtb files programatically
    if d.getVar('SOC_FAMILY', True) == 'rpi':
        resin_boot_partition_files = d.getVar('RESIN_BOOT_PARTITION_FILES', True)

        overlay_dtbs = split_overlays(d, 0)
        root_dtbs = split_overlays(d, 1)

        for dtb in root_dtbs.split():
            dtb = os.path.basename(dtb)
            resin_boot_partition_files += "\t%s:/%s" % (dtb, dtb)

        for dtb in overlay_dtbs.split():
            dtb = os.path.basename(dtb)
            resin_boot_partition_files += "\t%s:/overlays/%s" % (dtb, dtb)

        d.setVar('RESIN_BOOT_PARTITION_FILES', resin_boot_partition_files)
}

addhandler overlay_dtbs_handler
overlay_dtbs_handler[eventmask] = "bb.event.RecipePreFinalise"

IMAGE_INSTALL_append_rpi = " enable-overcommit u-boot balena-rollback-drop-in"

IMAGE_INSTALL_append_revpi-core-3 = " picontrol"

RPI_KERNEL_DEVICETREE_remove_revpi-core-3 = "bcm2708-rpi-zero-w.dtb bcm2710-rpi-3-b-plus.dtb bcm2711-rpi-4-b.dtb"
