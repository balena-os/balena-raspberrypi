do_get_public_keys:append() {
    fetch_key "rpi/key/${SIGN_RPI_KEY_ID}" ".key" "rpi.pem"
}

do_get_public_keys[vardeps] += " \
    SIGN_RPI_KEY_ID \
"
