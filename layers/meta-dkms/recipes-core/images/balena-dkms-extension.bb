DESCRIPTION = "dkms hostapp extension: builds and loads out-of-tree kernel modules via DKMS against the running kernel"
LICENSE = "MIT"

inherit balena-hostapp-extension

IMAGE_INSTALL = "dkms balena-dkms"

# kernel-devsrc.bb's own RDEPENDS (bc python3-core flex bison
# ${TCLIBC}-utils gawk openssl-dev util-linux gcc-plugins libmpc-dev) is
# what it declares as needed to consume/regenerate its own output --
# exactly the on-device `make modules_prepare`/syncconfig path this
# extension exercises (see kernel-devsrc.bbappend and balena-dkms's
# KERNEL_SRC_DIR comment). Added here rather than to dkms's own RDEPENDS:
# these are about preparing kernel config/generated headers, not about
# what dkms itself needs to compile C (binutils/libc-dev/libgcc-dev,
# already on dkms_3.4.2.bb). elfutils-dev is x86/powerpc-only in that
# recipe's own conditional, so it's skipped here for arm64.
IMAGE_INSTALL += "bc python3-core flex bison glibc-utils gawk openssl-dev util-linux gcc-plugins libmpc-dev"

# Kernel-agnostic: no headers or Module.symvers here -- those come from
# balena-kernel-devsrc-extension, combined at runtime per dkms-shaping.md's
# "DKMS tool + toolchain stays a separate, kernel-agnostic
# capability/extension" decision. Not a kernel-override extension either:
# os-version alone (stamped automatically by the inherited class) is the
# compatibility gate.
#
# Mounted right after kernel-devsrc (150) and before tracing (200), per the
# ordering already reserved for this extension in raspberrypi5.hostapp.yml.
HOSTAPP_EXTENSION_LABEL_OVERRIDE = "160"

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"
