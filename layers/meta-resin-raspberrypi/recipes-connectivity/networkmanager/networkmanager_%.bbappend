do_install_append_fincm3() {
    # disable wifi power saving mode on the Balena Fin board to workaround a bug where the WiFi firmware won't reconnect after entering power save mode
    cat >> ${D}${sysconfdir}/NetworkManager/NetworkManager.conf <<EOF

[connection]
# Values are 0 (use default), 1 (ignore/don't touch), 2 (disable) or 3 (enable).
wifi.powersave = 2

EOF
}
