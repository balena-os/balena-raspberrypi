SUMMARY = "UniPi OS Configurator - detects connected Neuron/Axon/Iris/Patron/G1 hardware and activates the matching device-tree overlay and udev rules"
DESCRIPTION = "Package containing binary tools which detect connected UniPi HW and alter the behaviour of the OS: changing device tree overlays, setting udev rules, enabling/disabling daemons. Needs a product-specific unipi-os-configurator-data-<product> package for the actual per-model overlays/rules - see unipi-os-configurator-data-neuron."
HOMEPAGE = "https://github.com/UniPiTechnology/os-configurator"
LICENSE = "GPL-3.0-or-later"
LIC_FILES_CHKSUM = "file://debian/copyright;md5=29243d19147dc9084f17c3e208fc70fb"

SRC_URI = "git://github.com/UniPiTechnology/os-configurator.git;protocol=https;branch=main"

# 1.6.0 - current tip as of writing.
SRCREV = "6a7af1ff34cee12173ddabd0931621ac700b838a"

S = "${WORKDIR}/git"

# libcrypto (unipiid.c) and libi2c (unipiid.c EEPROM read)
DEPENDS = "openssl i2c-tools"
# python3 - os-configurator (the shell wrapper) execs os-configurator.py for
# --update/--force; confirmed missing on real hardware ("python3: command not
# found"), which silently breaks per-model udev rule activation. 
RDEPENDS:${PN} += "bash python3"

# The vendor Makefile's link lines don't reference $(LDFLAGS), so OE's
# hardening/link flags never reach the linker (binaries come out missing
# GNU_HASH etc). TARGET_CC_ARCH folds into $(CC) itself, so the Makefile
# picks it up without needing to be patched. Same fix as unipi-tools.bb.
TARGET_CC_ARCH += "${LDFLAGS}"

inherit systemd

do_compile() {
    oe_runmake -C ${S}/src
}

do_install() {
    oe_runmake -C ${S}/src install DESTDIR=${D}

    # files/* mirrors debian/install's "files/* -> /" - udev rules, run.d
    # hook scripts, sysctl/default config, motd template. Deliberately
    # excludes files/usr/share/keyrings: those are apt/dpkg repo signing
    # keys for the vendor's own Debian-based image, meaningless (and
    # potentially confusing) on an opkg-based balenaOS image.
    cp -r ${S}/files/etc ${D}/
    install -d ${D}${nonarch_base_libdir}
    cp -r ${S}/files/usr/lib/udev ${D}${nonarch_base_libdir}/
    install -d ${D}${libdir}/unipi ${D}${libdir}/unipi/run.d
    install -m 0755 ${S}/files/usr/lib/unipi/run.d/*.sh ${D}${libdir}/unipi/run.d/
    install -d ${D}${datadir}/unipi-os-configurator
    cp -r ${S}/files/usr/share/unipi-os-configurator/motd ${D}${datadir}/unipi-os-configurator/

    install -d ${D}${systemd_unitdir}/system
    install -m 0644 \
        ${S}/debian/unipi-os-configurator.unipicheck.path \
        ${S}/debian/unipi-os-configurator.unipicheck.service \
        ${S}/debian/unipi-os-configurator.clear-bootcount.service \
        ${S}/debian/unipi-os-configurator.unipi-motd.service \
        ${D}${systemd_unitdir}/system/
}

FILES:${PN} += " \
    ${nonarch_base_libdir}/udev \
    ${libdir}/unipi \
    ${datadir}/unipi-os-configurator \
    ${sysconfdir}/default \
    ${sysconfdir}/sysctl.d \
    ${systemd_unitdir}/system/unipi-os-configurator.clear-bootcount.service \
"

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = " \
    unipi-os-configurator.unipicheck.path \
    unipi-os-configurator.unipicheck.service \
    unipi-os-configurator.unipi-motd.service \
"
# clear-bootcount.service is BindsTo=sys-devices-platform-bootcount.device
# and its own [Install] wants that device, not a target - it activates
# itself if/when that device appears, and never otherwise. Not included
# in SYSTEMD_AUTO_ENABLE's unit list since there's nothing to "enable" it
# against on this machine's known DT/kernel setup, but the unit file is
# still installed (above) in case that assumption is wrong - flagged for
# verification on real hardware via autokit rather than assumed either way.
SYSTEMD_AUTO_ENABLE:${PN} = "enable"
