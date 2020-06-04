SUMMARY = "Binaries of the out of tree linux wifi and bluetooth driver modules for Marvell SD8887"
LICENSE = "CLOSED"

inherit module

FILESEXTRAPATHS_prepend := "${THISDIR}/prebuilts:"

SRC_URI = " \
    file://bt8xxx.ko \
    file://mlan.ko \
    file://sd8887_uapsta_a2.bin \
    file://sd8xxx.ko \
"

do_compile[noexec] = "1"

module_do_install() {
    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/net/wireless
    install -m 0644 ${WORKDIR}/mlan.ko ${WORKDIR}/sd8xxx.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/net/wireless/

    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/bluetooth
    install -m 0644 ${WORKDIR}/bt8xxx.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/bluetooth/

    install -d ${D}/lib/firmware/mrvl
    install -m 0644 ${WORKDIR}/sd8887_uapsta_a2.bin ${D}/lib/firmware/mrvl/

    # blacklist mwifi* and btmrvl* kernel modules which conflict with ours
    install -d ${D}/etc/modprobe.d
    for mod in mwifiex mwifiex_sdio btmrvl btmrvl_sdio; do
        echo "blacklist ${mod}" >> ${D}/etc/modprobe.d/blacklist.conf
    done
}

FILES_${PN} += " \
    /etc/modprobe.d/blacklist.conf \
    /lib/firmware/mrvl/sd8887_uapsta_a2.bin \
"

KERNEL_MODULE_AUTOLOAD += "sd8xxx"
KERNEL_MODULE_PROBECONF += "mlan sd8xxx"
module_conf_mlan = "install mlan /sbin/modprobe bt8xxx; sleep 5; /sbin/modprobe --ignore-install mlan $CMDLINE_OPTS"
module_conf_sd8xxx = "options sd8xxx ps_mode=2"
