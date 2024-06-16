#
# Balena signed boot image support
#

inherit sign-rsa

do_balena_signed_bootgen_and_deploy() {
    if [ "x${SIGN_API}" = "x" ]; then
        bbnote "Signing API not defined"
        return 0
    fi
    if [ ! -d "${BALENA_BOOT_WORKDIR}" ]; then
        bbfatal "No defined balena boot directory - please use in the context of building a balenaos-img"
    fi
    if [ $(ls -A "${BALENA_BOOT_WORKDIR}" > /dev/null 2>&1) ]; then
        bberror "Empty balena boot directory"
    fi

    # Create a disk image from the contents of the boot directory
    block_size="${IMAGE_BLOCK_SIZE:-1024}"
    alignment="${BALENA_IMAGE_ALIGNMENT:-4096}"
    size=$(expr $(du -ks ${BALENA_BOOT_WORKDIR} | awk '{print $1}') \+ ${alignment})
    BOOTIMG_NAME="boot.img"
    BOOTIMG_LOCATION="${WORKDIR}/${BOOTIMG_NAME}"
    dd if=/dev/zero of="${BOOTIMG_LOCATION}" bs="${block_size}" count="${size}"
    mkfs.vfat --mbr=no "${BOOTIMG_LOCATION}" "${size}"
    # Add device trees to files to reside in the encrypted boot partition
    DTS="${@make_dtb_boot_files(d)}"
    DEVICE_TREE_FILES=""
    for entry in ${DTS} ; do
        # Split entry at optional ';'
        if [ $(echo "$entry" | grep -c \;) = "0" ] ; then
            DEPLOY_FILE="$entry"
            DEST_FILENAME="$entry"
        else
            DEPLOY_FILE="$(echo "$entry" | cut -f1 -d\;)"
            DEST_FILENAME="$(echo "$entry" | cut -f2- -d\;)"
        fi
        if ! echo "${DEVICE_TREE_FILES}" | grep -q "${DEST_FILENAME}"; then
            DEVICE_TREE_FILES="${DEVICE_TREE_FILES} ${DEST_FILENAME}"
        fi
    done
    # Make a copy and remove the files that need to reside in the encrypted boot partition
    tmpdir=$(mktemp -d)
    for f in ${BALENA_BOOT_WORKDIR}/*; do
        bbnote "Processing ${f}"
        fname=$(basename "${f}")
        dname=$(dirname "${f}")
        bbnote "fname: ${fname} dname: ${dname}"
        # Device tree files need to reside in both boot partitions
        if echo "${DEVICE_TREE_FILES}" | grep -q "${fname}"; then
            cp -rvf "${f}" "${tmpdir}/"
        fi
        if echo "${BALENA_ESSENTIAL_BOOT_FILES}" "${DEVICE_TREE_FILES}" | grep -q "${fname}"; then
              bbnote "Skipping ${f}"
              continue
        fi
        # keep a copy of the firmware in boot.img for EEPROM self-update
        if echo "${fname}" | grep -q -E "pieeprom.*\.bin$"; then
            cp -vf "${f}" "${dname}/pieeprom.upd"
        elif echo "${fname}" | grep -q -E "pieeprom.*\.sig$"; then
            cp -vf "${f}" "${dname}/pieeprom.sig"
        fi
        cp -rvf "${f}" "${tmpdir}/"
        rm -rf "${f:?}"
        # remove directory only once it is empty
        if [ -d "${f}" ]; then
            rmdir -p --ignore-fail-on-non-empty "${dname}"
        fi
    done
    # Copy the essential stage1 boot files into the disk image
    mcopy -i "${BOOTIMG_LOCATION}" -svm ${BALENA_BOOT_WORKDIR}/* ::

    # Remove essential boot files that are already part of the disk image
    for f in ${BALENA_ESSENTIAL_BOOT_FILES}; do
        if ! echo "config.txt ${KERNEL_IMAGETYPE}" | grep -q "${f}"; then
            bbnote "Removing ${f}"
            rm -rf "${BALENA_BOOT_WORKDIR}/${f}"
        fi
    done
    # remove the copy of the self-update firmware already in boot.img
    rm -vf "${BALENA_BOOT_WORKDIR}/pieeprom.sig" "${BALENA_BOOT_WORKDIR}/pieeprom.upd"

    # Configure the bootloader to use boot.img
    echo "boot_ramdisk=1" >> "${BALENA_BOOT_WORKDIR}/config.txt"

    # Populate with the new boot disk image
    mv "${BOOTIMG_LOCATION}" "${BALENA_BOOT_WORKDIR}/"
    # Re-populate with the files that need to reside in the encrypted boot partition
    cp -rf ${tmpdir}/* "${BALENA_BOOT_WORKDIR}/"
    rm -rf "${tmpdir}"

    # Sign the boot disk image
    if ! do_sign_rsa "${BALENA_BOOT_WORKDIR}/${BOOTIMG_NAME}" "${BALENA_BOOT_WORKDIR}/$(basename --suffix=.img ${BOOTIMG_NAME}).sig"; then
        bbfatal "Failed to sign boot image"
    fi

    # Regenerate fingerprint
    find ${BALENA_BOOT_WORKDIR} -xdev -type f \
        ! -name ${BALENA_FINGERPRINT_FILENAME}.${BALENA_FINGERPRINT_EXT} \
        ! -name config.json \
        -exec md5sum {} \; | sed "s#${BALENA_BOOT_WORKDIR}/##g" | \
        sort -k2 > ${BALENA_BOOT_WORKDIR}/${BALENA_FINGERPRINT_FILENAME}.${BALENA_FINGERPRINT_EXT}

    # Install in the rootfs
    rm -rf ${IMAGE_ROOTFS}/${BALENA_BOOT_FS_LABEL}
    cp -rvf ${BALENA_BOOT_WORKDIR} ${IMAGE_ROOTFS}/${BALENA_BOOT_FS_LABEL}

    hup_sanity_check
}

do_balena_signed_bootgen_and_deploy[network] = "1"
do_balena_signed_bootgen_and_deploy[depends] += " \
    dosfstools-native:do_populate_sysroot \
    mtools-native:do_populate_sysroot \
    curl-native:do_populate_sysroot \
    jq-native:do_populate_sysroot \
    ca-certificates-native:do_populate_sysroot \
    coreutils-native:do_populate_sysroot \
    "

do_balena_signed_bootgen_and_deploy[vardeps] += " \
    SIGN_API \
    SIGN_RSA_KEY_ID \
    "

addtask balena_signed_bootgen_and_deploy after do_resin_boot_dirgen_and_deploy  before do_image_balenaos_img
