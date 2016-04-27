inherit linux-raspberrypi-base

IMAGE_FSTYPES_append_rpi = " resin-sdcard"

# Kernel image name is different on Raspberry Pi 1/2
SDIMG_KERNELIMAGE_raspberrypi  ?= "kernel.img"
SDIMG_KERNELIMAGE_raspberrypi2 ?= "kernel7.img"

# Customize resin-sdcard
RESIN_IMAGE_BOOTLOADER_rpi = "bcm2835-bootfiles"
RESIN_BOOT_PARTITION_FILES_rpi = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/${SDIMG_KERNELIMAGE} \
    bcm2835-bootfiles:/ \
    "

python () {
    # Add all the dtb files programatically
    if d.getVar('SOC_FAMILY', True) == 'rpi':
        kernel_imagetype = d.getVar('KERNEL_IMAGETYPE', True)
        kernel_initramfs = d.getVar('KERNEL_INITRAMFS', True)
        resin_boot_partition_files = d.getVar('RESIN_BOOT_PARTITION_FILES', True)

        overlay_dtbs = split_overlays(d, 0)
        root_dtbs = split_overlays(d, 1)

        for dtb in root_dtbs.split():
            dtb = os.path.basename(dtb)
            resin_boot_partition_files += "\t%s%s-%s:/%s" % (kernel_imagetype, kernel_initramfs, dtb, dtb)

        for dtb in overlay_dtbs.split():
            dtb = os.path.basename(dtb)
            resin_boot_partition_files += "\t%s%s-%s:/overlay/%s" % (kernel_imagetype, kernel_initramfs, dtb, dtb)

        d.setVar('RESIN_BOOT_PARTITION_FILES', resin_boot_partition_files)
}
