DESCRIPTION = "kernel-devsrc hostapp extension: matching kernel headers for out-of-tree module builds via DKMS"
LICENSE = "MIT"

inherit balena-hostapp-extension

do_rootfs[depends] += "kernel-devsrc-tools:do_deploy"

HOSTAPP_EXTENSION_LABEL_OVERRIDE = "150"

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"

install_kernel_devsrc() {
    install -d ${IMAGE_ROOTFS}/usr/src
    tar -xzf ${DEPLOY_DIR_IMAGE}/kernel_modules_headers_prepared.tar.gz -C ${IMAGE_ROOTFS}/usr/src
}
IMAGE_PREPROCESS_COMMAND += "install_kernel_devsrc;"
