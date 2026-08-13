DESCRIPTION = "On-device DKMS build/load machinery for the dkms hostapp extension"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${BALENA_COREBASE}/COPYING.Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

SRC_URI = " \
    file://balena-dkms \
    file://balena-dkms.service \
    file://balena-dkms.path \
    "

# bash, coreutils, kmod and findutils's equivalents (find/xargs) are all
# already covered by what the hostapp ships (checked
# balena-image-raspberrypi5.manifest directly, and busybox's defconfig for
# the find/xargs feature flags this script actually uses -- extensions have
# no build-time visibility into the hostapp's package set, so this isn't
# something bitbake verifies for you). kmod is also already pulled in
# transitively via dkms's own RDEPENDS.
RDEPENDS:${PN} += "dkms"

# insane.bbclass's shebang scanner wants a declared RDEPENDS provider for
# /bin/bash (the script's #!). Declaring bash here would satisfy the check
# but also make do_rootfs actually install a second copy of bash into this
# extension's own tarball -- the exact duplication the comment above just
# established isn't needed, since the paired hostapp already has it. Skip
# the check instead: same kind of verified false positive as dkms_3.4.2.bb's
# INSANE_SKIP for "dev-deps".
INSANE_SKIP:${PN} += "file-rdeps"

inherit allarch systemd

SYSTEMD_SERVICE:${PN} = " \
    balena-dkms.service \
    balena-dkms.path \
    "

# Not auto-included: the base packaging only knows about the units listed
# above via SYSTEMD_SERVICE, not the hand-made enable directory underneath
# systemd_system_unitdir (see the do_install comment for why it's there
# instead of the usual sysconfdir location).
FILES:${PN} += "${systemd_system_unitdir}/multi-user.target.wants"

do_patch[noexec] = "1"
do_compile[noexec] = "1"
do_build[noexec] = "1"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${UNPACKDIR}/balena-dkms ${D}${bindir}/

    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
        install -d ${D}${systemd_system_unitdir}/
        install -m 0644 ${UNPACKDIR}/balena-dkms.service ${D}${systemd_system_unitdir}/
        install -m 0644 ${UNPACKDIR}/balena-dkms.path ${D}${systemd_system_unitdir}/

        sed -i -e 's,@BINDIR@,${bindir},g' \
            ${D}${systemd_system_unitdir}/balena-dkms.service

        # Enable symlinks live under ${systemd_system_unitdir} rather than
        # ${sysconfdir}/systemd/system (the usual `systemctl enable` target):
        # balena-hostapp-extension.bbclass strips /etc from every extension
        # image, so a symlink placed there would never survive into the
        # built image. This is the standard vendor-preset convention systemd
        # itself supports for units that should just always be enabled.
        install -d ${D}${systemd_system_unitdir}/multi-user.target.wants/
        ln -sf ../balena-dkms.service ${D}${systemd_system_unitdir}/multi-user.target.wants/balena-dkms.service
        ln -sf ../balena-dkms.path ${D}${systemd_system_unitdir}/multi-user.target.wants/balena-dkms.path
    fi
}
