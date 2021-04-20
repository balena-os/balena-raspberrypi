DESCRIPTION = "UniPi Neuron Modbus utilities"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2ae0c739310d5de8f2d85519ac1f2a50"

SRC_URI = "git://git@git.unipi.technology/UniPi/unipi-tools.git;protocol=https"

inherit systemd

DEPENDS += "libmodbus systemd"

SRCREV = "1.2.44"

S = "${WORKDIR}/git/src"

TARGET_CC_ARCH += "${LDFLAGS}"
EXTRA_OEMAKE += "MODBUSDIR=${STAGING_INCDIR}/.. CC='${CC}'"

do_install() {
    # systemd unit configuration file
    install -d ${D}${systemd_unitdir}/system
    install -m 0644 \
    ${S}/../unipi-common/systemd/system/unipi-ttymxc2-rs485.* \
    ${S}/../unipi-common/systemd/system/unipi-ttys0-rs485.* \
    ${S}/../unipi-common/systemd/system/unipispi.target \
    ${S}/../unipi-firmware-tools/systemd/system/unipifirmware.service \
    ${S}/../unipi-modbus-tools/systemd/system/unipitcp.service \
    ${D}${systemd_unitdir}/system/

    install -d ${D}${sysconfdir}/default
    install -m 0644 \
    ${S}/../unipi-firmware-tools/etc/default/unipi-firmware-tools \
    ${S}/../unipi-modbus-tools/etc/default/unipitcp \
    ${D}${sysconfdir}/default

    # install the tools
    install -d ${D}/opt/unipi/tools
    install -m 0644 \
    ${S}/unipi_tcp_server \
    ${S}/fwspi \
    ${S}/fwserial \
    ${S}/unipihostname \
    ${S}/unipicheck \
    ${D}/opt/unipi/tools

    # udev rules
    install -d ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${S}/../unipi-common/udev/* ${D}${base_libdir}/udev/rules.d/
}

FILES_${PN} += " \
    /lib/systemd/system/unipi-ttymxc2-rs485.target \
    /lib/systemd/system/unipispi.target \
    /lib/systemd/system/unipi-ttys0-rs485.target \
    /opt/unipi/tools \
"
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} = " \
    unipifirmware.service \
    unipitcp.service \
    unipi-ttymxc2-rs485.service \
    unipi-ttys0-rs485.service \
"
