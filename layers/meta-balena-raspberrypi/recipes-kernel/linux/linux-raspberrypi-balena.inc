FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:raspberrypi4-64 = " \
        file://0001-arm-dts-Add-memory-node-for-the-raspberrypi.patch \
        file://0001-arm64-Add-spin-table-cpu_die.patch \
"
