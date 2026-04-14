DESCRIPTION = "Kernel modules block image containing all modules"
LICENSE = "MIT"

inherit image

IMAGE_INSTALL = "kernel-modules"

PACKAGE_EXCLUDE = "kernel-image kernel-image-*"

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"

remove_unnecessary_files() {
    rm -f ${IMAGE_ROOTFS}/bin ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/sbin
    rm -rf ${IMAGE_ROOTFS}/etc
    rm -rf ${IMAGE_ROOTFS}/run
    rm -rf ${IMAGE_ROOTFS}/usr/bin
}

IMAGE_PREPROCESS_COMMAND += "remove_unnecessary_files;"

do_create_docker_image() {
    TARBALL="${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.tar.gz"
    [ -e "${TARBALL}" ] || bbfatal "Rootfs tarball not found at ${TARBALL}"

    KERNEL_VER_FILE="${STAGING_KERNEL_BUILDDIR}/kernel-abiversion"
    [ -f "${KERNEL_VER_FILE}" ] || bbfatal "kernel-abiversion not found at ${KERNEL_VER_FILE}"
    KERNEL_VER=$(cat "${KERNEL_VER_FILE}")

    SYMVERS="${STAGING_KERNEL_BUILDDIR}/Module.symvers"
    [ -f "${SYMVERS}" ] || bbfatal "Module.symvers not found at ${SYMVERS}"
    KERNEL_ABI_ID=$(sha256sum "${SYMVERS}" | cut -c1-16)
    [ "${#KERNEL_ABI_ID}" -eq 16 ] || bbfatal "Invalid KERNEL_ABI_ID computed from ${SYMVERS}: '${KERNEL_ABI_ID}'"

    DOCKER_API_VERSION=${BALENA_API_VERSION} docker import \
        --change "LABEL io.balena.image.store=data" \
        --change "LABEL io.balena.image.class=overlay" \
        --change "LABEL io.balena.update.requires-reboot=1" \
        --change "LABEL io.balena.image.os-version=${HOSTOS_VERSION}" \
        --change "LABEL io.balena.image.kernel-version=${KERNEL_VER}" \
        --change "LABEL io.balena.image.kernel-abi-id=${KERNEL_ABI_ID}" \
        "${TARBALL}" "${IMAGE_NAME}:latest"

    DOCKER_API_VERSION=${BALENA_API_VERSION} docker save -o "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.docker" "${IMAGE_NAME}:latest"
    DOCKER_API_VERSION=${BALENA_API_VERSION} docker rmi "${IMAGE_NAME}:latest" || true
}
addtask create_docker_image after do_image_complete before do_build
# Module.symvers is written by do_shared_workdir; do_deploy would pull in
# unnecessary kernel image deployment work for this modules-only block.
do_create_docker_image[depends] += "virtual/kernel:do_shared_workdir"
