do_install_append_revpi-core-3() {
    if $(readlink autovt@.service) == "getty@*.service"; then
        rm ${D}/lib/systemd/system/autovt@.service
    fi
    find ${D} -name "getty@*.service" -delete
}
