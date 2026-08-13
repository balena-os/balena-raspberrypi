# kernel-devsrc.bb already special-cases include/generated/autoconf.h as a
# deliberate exception to "we don't usually copy generated files, since they
# can be rebuilt on the target" -- copied straight from ${B}, the actual
# built kernel object tree, rather than regenerated on-device.
#
# arch/${ARCH}/include/generated/ needs the identical exception, for the
# identical reason: modern kernels resolve asm/*.h wrappers (there's no
# literal include/asm symlink any more) from generated headers in that
# directory, and this recipe doesn't ship them, betting on a subsequent
# `make modules_prepare` to regenerate them on the target. That bet holds
# for kernel-devsrc's usual writable /usr/src/<kver>; it doesn't hold for
# the dkms hostapp extension, which ships this same tree inside its own
# read-only rootfs -- modules_prepare has nowhere to write on-device (see
# dkms-shaping.md and balena-dkms's KERNEL_SRC_DIR comment for the full
# chain of reasoning). ${B} already has this content, complete and correct
# for the exact kernel this device runs, with zero on-device regeneration
# needed once it's shipped.
do_install:append() {
    (
        cd ${B}
        # Not "2>/dev/null || :" like this recipe's other, genuinely-optional
        # per-kernel-version copies: this one isn't optional, it's the whole
        # fix, so a failure here should fail the build loudly rather than
        # silently ship an incomplete extension.
        cp -a --parents arch/${ARCH}/include/generated $kerneldir/build/
    )
}

# Tried shipping scripts/basic/fixdep and scripts/mod/modpost prebuilt from
# ${B} the same way -- wrong call. Unlike arch/${ARCH}/include/generated
# (plain header text, architecture-independent), these are compiled ELF
# binaries, and ${B}'s copies are HOSTCC-compiled for the Yocto *build
# machine* (x86_64), not the aarch64 target -- confirmed by do_package's
# objcopy step refusing to recognise their format. They genuinely have to
# be compiled on-device instead, natively, which is what balena-dkms's
# HOSTCC=<device's own gcc> handling is for.
