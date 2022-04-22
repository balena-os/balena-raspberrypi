SUMMARY = "Out of tree linux wifi and bluetooth driver modules for Marvell SD8887"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"

inherit module

SRC_URI = " \
    git://github.com/balena-io-hardware/balena-fin.git;protocol=https;tag=v0.9.2 \
    file://COPYING \
"

S = "${WORKDIR}/git/software/drivers/sd8887"

DEPENDS = "bc-native"

EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"

do_compile() {
    cd ${S}/src/wlan
    oe_runmake
    cd ${S}/src/bluetooth
    oe_runmake
}

module_do_install() {
    cd ${S}/src/wlan
    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/net/wireless
    install -m 0644 mlan.ko sd8xxx.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/net/wireless/
    cd ${S}/src/bluetooth
    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/bluetooth
    install -m 0644 bt8xxx.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/bluetooth/
    cd ${S}/firmware
    install -d ${D}/lib/firmware/nxp
    install -m 0644 sd8887_uapsta_a2.bin ${D}/lib/firmware/nxp/

    # blacklist mwifi* and btmrvl* kernel modules which conflict with ours
    install -d ${D}/etc/modprobe.d
    for mod in mwifiex mwifiex_sdio btmrvl btmrvl_sdio; do
        echo "blacklist ${mod}" >> ${D}/etc/modprobe.d/blacklist.conf
    done
}

FILES:${PN} += " \
    /etc/modprobe.d/blacklist.conf \
    /lib/firmware/nxp/sd8887_uapsta_a2.bin \
"

KERNEL_MODULE_AUTOLOAD += "sd8xxx"
KERNEL_MODULE_PROBECONF += "mlan sd8xxx"
module_conf_mlan = "install mlan /sbin/modprobe bt8xxx; sleep 5; /sbin/modprobe --ignore-install mlan $CMDLINE_OPTS"
module_conf_sd8xxx = "options sd8xxx ps_mode=2"
