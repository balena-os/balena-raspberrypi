DESCRIPTION = "UniPi Neuron Modbus utilities"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2ae0c739310d5de8f2d85519ac1f2a50"

SRC_URI = "git://github.com/UniPiTechnology/unipi-tools.git;protocol=https"

inherit systemd

DEPENDS += "libmodbus systemd"
RDEPENDS:${PN} += "libmodbus"

SRCREV = "1.2.44"

S = "${WORKDIR}/git/src"

TARGET_CC_ARCH += "${LDFLAGS}"
EXTRA_OEMAKE += "MODBUSDIR=${STAGING_INCDIR}/.. CC='${CC}'"

do_install() {
    # systemd unit configuration file
    install -d ${D}${systemd_unitdir}/system
    install -m 0644 \
    ${S}/../unipi-common/systemd/system/unipicheck.service \
    ${S}/../unipi-common/systemd/system/unipispi.target \
    ${S}/../unipi-firmware-tools/systemd/system/unipifirmware.service \
    ${S}/../unipi-modbus-tools/systemd/system/unipitcp.service \
    ${D}${systemd_unitdir}/system/

    install -d ${D}${sysconfdir}/default
    install -m 0644 \
    ${S}/../unipi-firmware-tools/etc/default/unipi-firmware-tools \
    ${S}/../unipi-modbus-tools/etc/default/unipitcp \
    ${D}${sysconfdir}/default

    # install the map file needed to determine which systemd target needs to be started
    install -d ${D}/opt/unipi/data
    install -m 0644 ${S}/unipi-target.map ${D}/opt/unipi/data

    # install the tools
    install -d ${D}/opt/unipi/tools
    install -m 0755 \
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

FILES:${PN} += " \
    /lib/systemd/system/unipi-ttymxc2-rs485.target \
    /lib/systemd/system/unipispi.target \
    /lib/systemd/system/unipi-ttys0-rs485.target \
    /opt/unipi/data \
    /opt/unipi/tools \
"
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = " \
    unipicheck.service \
    unipifirmware.service \
    unipitcp.service \
"
