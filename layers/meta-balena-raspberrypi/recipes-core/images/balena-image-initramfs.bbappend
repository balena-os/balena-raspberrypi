PACKAGE_INSTALL:remove:revpi = "initramfs-module-migrate"

# increase initramfs maxsize to 50 MiB with the update to Scarthgap
IMAGE_ROOTFS_MAXSIZE:raspberrypi5 = "51200"
IMAGE_ROOTFS_MAXSIZE:raspberrypi4-64 = "51200"
IMAGE_ROOTFS_MAXSIZE:raspberrypi0-2w-64 = "51200"
IMAGE_ROOTFS_MAXSIZE:raspberrypicm4-ioboard = "51200"
