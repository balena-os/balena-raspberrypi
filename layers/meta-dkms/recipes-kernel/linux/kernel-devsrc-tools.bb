DESCRIPTION = "Cross-built kbuild host tools (fixdep, modpost, kconfig's conf, \
genksyms, dtc) so that user can build modules directly"
LICENSE = "GPL-2.0-only"

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit kernel-arch

DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc bc-native bison-native flex-native"

FILES:${PN} += "${prefix}/src"

do_fetch[noexec] = "1"
do_unpack[noexec] = "1"
do_patch[noexec] = "1"
do_compile[depends] += "kernel-devsrc:do_deploy"

do_compile() {
    rm -rf ${WORKDIR}/prepared
    mkdir -p ${WORKDIR}/prepared
    tar -xzf ${DEPLOY_DIR_IMAGE}/kernel_modules_headers.tar.gz -C ${WORKDIR}/prepared

    kdir=$(find ${WORKDIR}/prepared -mindepth 2 -maxdepth 2 -type d -name build)
    if [ -z "$kdir" ]; then
        bbfatal "kernel-devsrc-tools: no <kver>/build under kernel_modules_headers.tar.gz"
    fi

    oe_runmake -C "$kdir" ARCH=${ARCH} CROSS_COMPILE=${TARGET_PREFIX} modules_prepare

    # cross-compile just the tools an out-of-tree module build actually uses on-device
    # fixdep, modpost and genksyms.

    ${CC} -I"$kdir/scripts/include" ${LDFLAGS} -o "$kdir/scripts/basic/fixdep" "$kdir/scripts/basic/fixdep.c"

    ${CC} -I"$kdir/scripts/include" ${LDFLAGS} -o "$kdir/scripts/mod/modpost" \
        "$kdir/scripts/mod/modpost.c" "$kdir/scripts/mod/file2alias.c" \
        "$kdir/scripts/mod/sumversion.c" "$kdir/scripts/mod/symsearch.c"

    ${CC} -I"$kdir/scripts/include" ${LDFLAGS} -o "$kdir/scripts/genksyms/genksyms" \
        "$kdir/scripts/genksyms/genksyms.c" "$kdir/scripts/genksyms/parse.tab.c" \
        "$kdir/scripts/genksyms/lex.lex.c"
}

do_install() {
    kdir=$(find ${WORKDIR}/prepared -mindepth 2 -maxdepth 2 -type d -name build)

    rm -f "$kdir/scripts/kconfig/conf" "$kdir/scripts/dtc/dtc" \
        "$kdir/scripts/dtc/fdtoverlay" "$kdir/scripts/kallsyms" \
        "$kdir/scripts/sorttable" "$kdir/scripts/asn1_compiler" \
        "$kdir/scripts/mod/mk_elfconfig"

    find "$kdir/scripts" -name '*.o' -delete

    install -d ${D}${prefix}/src
    cp -a "$(dirname "$kdir")" ${D}${prefix}/src/

    chown -R root:root ${D}
}

INSANE_SKIP:${PN} += "already-stripped"
INSANE_SKIP:${PN} += "file-rdeps"

do_deploy() {
    tar -czf ${DEPLOYDIR}/kernel_modules_headers_prepared.tar.gz -C ${D}${prefix}/src .
}
inherit deploy
addtask do_deploy before do_package after do_install
