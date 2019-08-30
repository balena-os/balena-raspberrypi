FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}-4.19:"

SRC_URI += " \
    file://d9aa3902c1fb7163edf1812dd0e03ed5a7e129ed.patch \
    file://117a698295eb616398109b244de67231dd233f02.patch \
    "
