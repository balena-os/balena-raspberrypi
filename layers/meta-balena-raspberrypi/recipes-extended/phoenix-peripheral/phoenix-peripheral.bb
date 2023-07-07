SUMMARY = "recipe for script file"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
SRC_URI = "git://github.com/balena-os/phoenix-peripheral.git;branch=master;protocol=https"
SRCREV="29eb94ed3417f9207e37ce373a89a537c25f8a86"

S = "${WORKDIR}/git"

inherit systemd

PACKAGES =+ "${PN}-button-trig ${PN}-lvd-hook ${PN}-gpio-wdt ${PN}-rtc-sync"
RDEPENDS:${PN}-gpio-wdt += "watchdog"

FILES:${PN} = " \
    ${datadir}/phoenix/peripheral/* \
"

FILES:${PN}-button-trig = " \
    ${datadir}/phoenix/button-trig/* \
"

FILES:${PN}-lvd-hook = " \
    ${datadir}/phoenix/lvd-hook/* \
"

FILES:${PN}-gpio-wdt = " \
    ${systemd_system_unitdir}/gpio-wdt.service \
"

FILES:${PN}-rtc-sync = " \
    ${systemd_system_unitdir}/rtc-sync.service \
"

SYSTEMD_PACKAGES = "${PN}-gpio-wdt ${PN}-rtc-sync"
SYSTEMD_SERVICE:${PN}-gpio-wdt = "gpio-wdt.service"
SYSTEMD_AUTO_ENABLE:${PN}-gpio-wdt = "enable"
SYSTEMD_SERVICE:${PN}-rtc-sync = "rtc-sync.service"
SYSTEMD_AUTO_ENABLE:${PN}-rtc-sync = "enable"

DEPENDS += "libgpiod"

TARGET_CC_ARCH += "${LDFLAGS}"

do_compile() {
    cd ${S}/application/button
	oe_runmake 'CC=${CC}' all

    cd ${S}/application/lvd
	oe_runmake 'CC=${CC}' all
}

do_install() {
    install -d ${D}${datadir}/phoenix/peripheral
    cp -rf ${S}/scripts/* ${D}${datadir}/phoenix/peripheral

    install -d ${D}${datadir}/phoenix/button-trig
    install -m 0755 ${S}/application/button/button ${D}${datadir}/phoenix/button-trig

    install -d ${D}${datadir}/phoenix/lvd-hook
    install -m 0755 ${S}/application/lvd/lvd ${D}${datadir}/phoenix/lvd-hook

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${S}/systemd/gpio-wdt.service ${D}${systemd_system_unitdir}

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${S}/systemd/rtc-sync.service ${D}${systemd_system_unitdir}
}
