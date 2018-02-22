IMAGE_FSTYPES_append_rpi = " resinos-img"

# Kernel image name is different on Raspberry Pi 1/2/3-64bit
SDIMG_KERNELIMAGE_raspberrypi  ?= "kernel.img"
SDIMG_KERNELIMAGE_raspberrypi2 ?= "kernel7.img"
SDIMG_KERNELIMAGE_raspberrypi3-64 ?= "kernel8.img"

# Customize resinos-img
RESIN_IMAGE_BOOTLOADER_rpi = "bcm2835-bootfiles"
RESIN_BOOT_PARTITION_FILES_rpi = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/${SDIMG_KERNELIMAGE} \
    bcm2835-bootfiles:/ \
    "

python overlay_dtbs_handler () {
    # Add all the dtb files programatically
    if d.getVar('SOC_FAMILY', True) == 'rpi':
        kernel_imagetype = d.getVar('KERNEL_IMAGETYPE', True)
        resin_boot_partition_files = d.getVar('RESIN_BOOT_PARTITION_FILES', True)

        overlay_dtbs = split_overlays(d, 0)
        root_dtbs = split_overlays(d, 1)

        for dtb in root_dtbs.split():
            dtb = os.path.basename(dtb)
            resin_boot_partition_files += "\t%s-%s:/%s" % (kernel_imagetype, dtb, dtb)

        for dtb in overlay_dtbs.split():
            dtb = os.path.basename(dtb)
            resin_boot_partition_files += "\t%s-%s:/overlays/%s" % (kernel_imagetype, dtb, dtb)

        d.setVar('RESIN_BOOT_PARTITION_FILES', resin_boot_partition_files)
}

addhandler overlay_dtbs_handler
overlay_dtbs_handler[eventmask] = "bb.event.RecipePreFinalise"

IMAGE_INSTALL_append_rpi = " enable-overcommit"
