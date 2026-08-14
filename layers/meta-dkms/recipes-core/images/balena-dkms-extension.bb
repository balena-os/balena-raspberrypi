DESCRIPTION = "dkms hostapp extension: builds and loads out-of-tree kernel modules via DKMS against the running kernel"
LICENSE = "MIT"

inherit balena-hostapp-extension

IMAGE_INSTALL = "dkms balena-dkms"

IMAGE_INSTALL += "bc python3-core flex bison glibc-utils gawk openssl-dev util-linux gcc-plugins libmpc-dev"

HOSTAPP_EXTENSION_LABEL_OVERRIDE = "160"

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"
