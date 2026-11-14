DESCRIPTION = "UniPi Neuron Modbus utilities"
# Licence basis (upstream checked at this SRCREV): per-file headers are mixed.
# Most source files (armspi.c/.h, spicrc.c/.h, virtual_regs.c/.h, unipiutil.h,
# nb_modbus.h) say GPL "version 2 of the License" (no "or later"); nb_modbus.c
# is LGPL-2.1+; bandwidth-client.c and unipi_tcp_server.c say GPL version 3 or
# later. debian/copyright claims GPL-3.0+ for "Files: *" but is an unfilled
# template ("<years> <put author's name...>"). Upstream's current tip declares
# GPL-2.0 (README + COPYING); this pinned revision predates both.
# DOCUMENTED ASSUMPTION: GPL-2.0-only, the project's chosen fallback where the
# licence is in doubt and what most headers and upstream's own README say.
# KNOWN CONFLICT: the installed unipi_tcp_server is built from
# unipi_tcp_server.c (GPL-3.0-or-later header) together with the GPL-2.0-only
# objects, which upstream's own licensing does not reconcile - not resolvable
# in this recipe.
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = " \
    file://armspi.c;beginline=8;endline=10;md5=3eace9d0d9abe7a03cb2de68a14ee849 \
    file://../debian/copyright;md5=2ae0c739310d5de8f2d85519ac1f2a50 \
"

SRC_URI = "git://github.com/UniPiTechnology/unipi-tools.git;protocol=https;nobranch=1"

inherit systemd

DEPENDS += "libmodbus systemd"
RDEPENDS:${PN} += "libmodbus"

# Corresonds to v1.2.44
SRCREV = "8eadfe0dd3098e8973738c20d61b453b390d0f7d"

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
    ${systemd_unitdir}/system/unipi-ttymxc2-rs485.target \
    ${systemd_unitdir}/system/unipispi.target \
    ${systemd_unitdir}/unipi-ttys0-rs485.target \
    /opt/unipi/data \
    /opt/unipi/tools \
"
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = " \
    unipicheck.service \
    unipifirmware.service \
    unipitcp.service \
"
