SUMMARY = "Raspberry Pi reset reason helper"
DESCRIPTION = "Defines the reset_reason_report hook that balena-reset-reason calls, \
reporting the firmware PM_RSTS and USB over-current properties."
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${BALENA_COREBASE}/COPYING.Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

SRC_URI = "file://os-helpers-reset-reason"

RDEPENDS:${PN} = "os-helpers-logging"

inherit allarch

do_install() {
    install -d ${D}${libexecdir}
    install -m 0644 ${UNPACKDIR}/os-helpers-reset-reason ${D}${libexecdir}/
}

FILES:${PN} = "${libexecdir}/os-helpers-reset-reason"
