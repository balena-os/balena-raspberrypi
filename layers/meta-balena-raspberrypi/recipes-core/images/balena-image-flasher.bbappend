include balena-image.inc

BALENA_BOOT_PARTITION_FILES:rpi:append = " \
    cmdline.txt.flasher:/cmdline.txt \
    "
