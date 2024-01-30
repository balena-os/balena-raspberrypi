# We override the file provided by meta-raspberrypi
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_compile:append() {
    if [ "x${SIGN_API}" != "x" ]; then
        # For signed images that use u-boot, the kernel needs to live
        # in the non-encrypted boot partition
        sed -i -e 's/:${resin_root_part}/:${resin_boot_part}/g' "${WORKDIR}/boot.cmd"
        sed -i -e 's,/boot/,,g' "${WORKDIR}/boot.cmd"
        mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
    fi
}
