PACKAGE_INSTALL:remove:revpi = "initramfs-module-migrate"

PACKAGE_INSTALL:append:raspberrypicm4-ioboard-sb = " initramfs-module-kexec-pi4-fwgpio"
IMAGE_ROOTFS_MAXSIZE:raspberrypicm4-ioboard-sb = "51200"
