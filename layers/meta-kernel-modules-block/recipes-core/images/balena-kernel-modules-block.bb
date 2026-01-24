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

# Ensure the kernel's Module.symvers has been deployed before do_rootfs runs.
do_rootfs[depends] += "virtual/kernel:do_deploy"

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

# Install the kernel's Module.symvers alongside the modules. The running kernel
# needs it for symbol CRC resolution when loading extension modules, and it is
# the source of truth for the io.balena.image.kernel-abi-id label (computed by
# the deploy workflow from this same file).
install_module_symvers() {
    src="${DEPLOY_DIR_IMAGE}/Module.symvers"
    if [ ! -f "${src}" ]; then
        bbfatal "install_module_symvers: ${src} not found (expected from kernel-balena.bbclass do_deploy)"
    fi
    for kdir in ${IMAGE_ROOTFS}${nonarch_base_libdir}/modules/*/; do
        [ -d "${kdir}" ] || continue
        install -m 0644 "${src}" "${kdir}Module.symvers"
    done
}

IMAGE_PREPROCESS_COMMAND += "install_module_symvers;remove_unnecessary_files;"
