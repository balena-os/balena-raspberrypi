SUMMARY = "DKMS - Dynamic Kernel Module Support"
HOMEPAGE = "https://github.com/dkms-project/dkms"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"

# Adapted from ni/openembedded-core@5789a27b68d95f3840bb8c4cb0d7b28d538c9a50
# (dkms_2.4.0.bb, old dell/dkms). Two things changed since and are NOT
# reliably verified from this environment -- confirm both before building:
#
#   1. Upstream moved from github.com/dell/dkms to github.com/dkms-project/dkms.
#   2. LIC_FILES_CHKSUM's md5 is carried over from the 2.4.0-era COPYING;
#      not re-checked against v3.4.2's actual file.
SRC_URI = "https://github.com/dkms-project/${BPN}/archive/v${PV}.tar.gz"

SRC_URI[sha256sum] = "cee890e478e5e38228c83262509bf5931d894670a1832ffcf534268ccfc4f302"

INSANE_SKIP:${PN} += "dev-deps"

# kmod, gcc, binutils, libc-dev, libgcc-dev, make: needed at runtime by
# dkms itself to build/load modules. None of binutils/libc-dev/libgcc-dev
# are pulled in transitively by gcc's own recipe (confirmed against
# gcc-target.inc, which only RDEPENDS on cpp) -- each showed up as its own
# separate missing-tool error compiling a plain host-side C program
# (kbuild's own scripts/basic/fixdep, not a kernel module):
#   - binutils: "cannot execute 'as'" (assembler/linker)
#   - libc-dev: "sys/types.h: No such file or directory" (standard headers)
#   - libgcc-dev: "cannot find crtbeginS.o" / "-lgcc" (gcc's own runtime
#     startup objects and static support library, a separate package from
#     both gcc itself and the libgcc1 shared-lib runtime package)
# libc-dev is the generic virtual alias RPROVIDES'd by glibc-dev, same
# pattern kernel-devsrc.bb itself uses (${TCLIBC}-utils), so this doesn't
# hardcode a specific C library.
# Deliberately NOT including headers/kernel-devsrc here -- those are a
# separate, kernel-version-pinned extension (balena-kernel-devsrc-extension)
# per the two-extension split in layers/dkms-shaping.md; this package should
# stay kernel-agnostic.
RDEPENDS:${PN} += "bash kmod gcc binutils libc-dev libgcc-dev make patch"

# Upstream dropped autotools between the 2.4.0-era recipe this was adapted
# from and v3.4.2 -- v3.4.2 has a plain top-level Makefile (dkms.in,
# dkms.8.in, dkms.service.in templates; `make install` /
# `make install-debian` / `make install-redhat` targets; confirmed by
# listing the v3.4.2 tag tree). The exact install variables (PREFIX/DESTDIR
# equivalents) were NOT reliably confirmed -- a web-fetched read of the
# Makefile's content came back with a version-string mismatch (3.4.1 vs the
# v3.4.2 tag) and one sentence that looked like an injected instruction
# rather than genuine Makefile content, so it isn't trusted here. Treat
# do_install below as an unverified starting point, not a working recipe --
# confirm against the real Makefile (which install target actually accepts
# DESTDIR) before relying on it.
do_install() {
    oe_runmake install DESTDIR="${D}"
    rm -rf ${D}${datadir}/bash-completion ${D}${datadir}/zsh
}
