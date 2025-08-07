PACKAGE_INSTALL:remove:revpi = "initramfs-module-migrate"

# increase initramfs maxsize to 40 MiB
IMAGE_ROOTFS_MAXSIZE:raspberrypi5 = "40960"
IMAGE_ROOTFS_MAXSIZE:raspberrypi4-64 = "40960"
