# this deploy append should be removed once we update to a meta-raspberrypi version (gatesgarth, hardknott or newer) that moved cmdline.txt into a separate recipe: rpi-cmdline.bb

do_deploy:append() {
    # Deploy cmdline.txt only for the main kernel package
    if [ ${KERNEL_PACKAGE_NAME} = "kernel" ]; then
        install -d ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}
        PITFT="${@bb.utils.contains("MACHINE_FEATURES", "pitft", "1", "0", d)}"
        if [ ${PITFT} = "1" ]; then
            PITFT_PARAMS="fbcon=map:10 fbcon=font:VGA8x8"
        fi
        echo "${CMDLINE}${PITFT_PARAMS}" > ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/cmdline.txt
    fi
}

# These device types have been using the aufs storage driver,
# and during a HUP the storage in the inactive sysroot will
# still be aufs, so we need to include the aufs driver further
# for them, as per the internal thread
# https://www.flowdock.com/app/rulemotion/resin-devices/threads/K2TQiSUfNDqBT5Ih6cciNI2d9QJ
BALENA_CONFIGS_append_fincm3 = " aufs"
BALENA_CONFIGS_append_npe-x500-m3 = " aufs"
BALENA_CONFIGS_append_raspberrypi = " aufs"
BALENA_CONFIGS_append_raspberrypi2 = " aufs"
BALENA_CONFIGS_append_raspberrypi3-64 = " aufs"
BALENA_CONFIGS_append_raspberrypi3 = " aufs"
BALENA_CONFIGS_append_revpi-core-3 = " aufs"
