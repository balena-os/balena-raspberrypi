DESCRIPTION = "Kernel modules block image containing all modules"
LICENSE = "MIT"

inherit image

IMAGE_INSTALL = "kernel-modules"

# Exclude kernel-image - we only need modules, not the kernel itself
PACKAGE_EXCLUDE = "kernel-image kernel-image-*"

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"

# Remove unnecessary files from the image - we only need modules
remove_unnecessary_files() {
    # Remove empty symlinks
    rm -f ${IMAGE_ROOTFS}/bin ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/sbin

    # Remove etc files (not needed for modules)
    rm -rf ${IMAGE_ROOTFS}/etc

    # Remove run directory
    rm -rf ${IMAGE_ROOTFS}/run

    # Remove empty usr/bin created by usrmerge symlinks preprocess
    rm -rf ${IMAGE_ROOTFS}/usr/bin
}

IMAGE_PREPROCESS_COMMAND += "remove_unnecessary_files;"

do_create_docker_image() {
    TARBALL=$(find ${IMGDEPLOYDIR} -name "${IMAGE_NAME}*.rootfs.tar.gz" \( -type l -o -type f \) | head -1)
    if [ -z "${TARBALL}" ]; then
        bbfatal "No rootfs tarball found in ${IMGDEPLOYDIR}"
    fi
    docker import "${TARBALL}" "${IMAGE_NAME}:latest"
    docker save -o "${IMGDEPLOYDIR}/${IMAGE_NAME}.docker" "${IMAGE_NAME}:latest"
    docker rmi "${IMAGE_NAME}:latest" || true
}
addtask create_docker_image after do_image_complete before do_build
