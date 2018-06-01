FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://sd8887_uapsta.bin"

# Install a newer SD8887 firmware
do_install_append() {
    cp ${WORKDIR}/sd8887_uapsta.bin ${D}${nonarch_base_libdir}/firmware/mrvl/
}
