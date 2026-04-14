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

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_assemble_build_context() {
    TARBALL=$(find ${IMGDEPLOYDIR} -name "${IMAGE_NAME}*.rootfs.tar.gz" \( -type l -o -type f \) | head -1)
    if [ -z "${TARBALL}" ]; then
        bbfatal "No rootfs tarball found in ${IMGDEPLOYDIR}"
    fi

    CONTEXT_DIR="${IMGDEPLOYDIR}/${BPN}"
    rm -rf "${CONTEXT_DIR}"
    mkdir -p "${CONTEXT_DIR}/contents"

    cp "${THISDIR}/files/Dockerfile" "${CONTEXT_DIR}/Dockerfile"
    tar xzf "${TARBALL}" -C "${CONTEXT_DIR}/contents"
}
addtask assemble_build_context after do_image_complete before do_build
