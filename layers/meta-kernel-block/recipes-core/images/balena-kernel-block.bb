DESCRIPTION = "Kernel block image containing a full kernel + matching modules"
LICENSE = "MIT"

inherit balena-hostapp-extension

IMAGE_INSTALL = "kernel-extension-modules kernel-extension-image-initramfs kernel-extension-devicetree bpftool libbpf"

HOSTAPP_EXTENSION_LABEL_OVERRIDE = "100"

# revisit once the poky submodule moves off kirkstone
# Fixed in upstream openembedded-core
# commit efa88e1c227d695319197f511701e0230d301f39 ("rootfs.py: Run depmod(wrapper) against each compiled kernel"
USE_DEPMOD = "0"

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"

remove_unnecessary_files() {
    rm -f ${IMAGE_ROOTFS}/bin ${IMAGE_ROOTFS}/sbin
    rm -rf ${IMAGE_ROOTFS}/etc
    rm -rf ${IMAGE_ROOTFS}/run
    rm -rf ${IMAGE_ROOTFS}/var
}
IMAGE_PREPROCESS_COMMAND += "remove_unnecessary_files;"
