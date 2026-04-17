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
    TARBALL=$(find ${DEPLOY_DIR_IMAGE} -name "${IMAGE_LINK_NAME}.rootfs.tar.gz" \( -type l -o -type f \) | head -1)
    [ -n "${TARBALL}" ] || bbfatal "No rootfs tarball found in ${DEPLOY_DIR_IMAGE}"

    KERNEL_VER=$(basename $(find ${IMAGE_ROOTFS}${nonarch_base_libdir}/modules -mindepth 1 -maxdepth 1 -type d | head -1))
    [ -n "${KERNEL_VER}" ] || bbfatal "Could not determine kernel version from rootfs modules dir"

    SYMVERS="${DEPLOY_DIR_IMAGE}/Module.symvers"
    [ -f "${SYMVERS}" ] || bbfatal "Module.symvers not found at ${SYMVERS}"
    KERNEL_ABI_ID=$(sha256sum "${SYMVERS}" | cut -c1-16)

    docker import \
        --change "LABEL io.balena.image.store=data" \
        --change "LABEL io.balena.image.class=overlay" \
        --change "LABEL io.balena.update.requires-reboot=1" \
        --change "LABEL io.balena.image.os-version=${HOSTOS_VERSION}" \
        --change "LABEL io.balena.image.kernel-version=${KERNEL_VER}" \
        --change "LABEL io.balena.image.kernel-abi-id=${KERNEL_ABI_ID}" \
        "${TARBALL}" "${IMAGE_NAME}:latest"

    docker save -o "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.docker" "${IMAGE_NAME}:latest"
    docker rmi "${IMAGE_NAME}:latest" || true
}
addtask create_docker_image after do_image_complete before do_build
