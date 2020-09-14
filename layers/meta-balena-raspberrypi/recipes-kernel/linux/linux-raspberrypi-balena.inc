FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_raspberrypi4-64 = " \
        file://0001-arm-dts-Add-memory-node-for-the-raspberrypi4-64.patch \
        file://0001-arm64-Add-spin-table-cpu_die.patch \
"
