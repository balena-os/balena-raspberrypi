DESCRIPTION = "Debug tools hostapp extension (perf + light userspace tools), no kernel"
LICENSE = "MIT"

inherit balena-hostapp-extension

IMAGE_INSTALL = "perf strace tcpdump ltrace"


HOSTAPP_EXTENSION_LABEL_REQUIRES_REBOOT = "1"
HOSTAPP_EXTENSION_LABEL_OVERRIDE = "200"

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"

# Keep /usr (our tools live here); drop state dirs that must come from the
# hostapp so the additive overlay contributes only the tools and their libs.
remove_unnecessary_files() {
    rm -rf ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/run
}
IMAGE_PREPROCESS_COMMAND += "remove_unnecessary_files;"
