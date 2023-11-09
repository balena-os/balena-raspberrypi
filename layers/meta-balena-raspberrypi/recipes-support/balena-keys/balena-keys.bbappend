do_get_public_keys:append() {
    fetch_key "rsa/key/${SIGN_RSA_KEY_ID}" ".key" "rsa.pem"
}

do_get_public_keys[vardeps] += " \
    SIGN_RSA_KEY_ID \
"
