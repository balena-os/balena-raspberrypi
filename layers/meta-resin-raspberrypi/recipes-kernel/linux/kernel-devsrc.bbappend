# create missing symlink for arm64 boards
do_install_prepend() {
    install -d ${D}${KERNEL_SRC_PATH}/arch/arm64/boot/dts/
    ln -sf ../../../arm/boot/dts/overlays ${D}${KERNEL_SRC_PATH}/arch/arm64/boot/dts/overlays
}
