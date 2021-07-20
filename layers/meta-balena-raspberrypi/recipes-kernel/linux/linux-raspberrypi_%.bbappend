# this deploy append should be removed once we update to a meta-raspberrypi version (gatesgarth, hardknott or newer) that moved cmdline.txt into a separate recipe: rpi-cmdline.bb

do_deploy_append() {
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

