FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_append = " \
    file://remove-huawei-modem-rule.patch \
"
