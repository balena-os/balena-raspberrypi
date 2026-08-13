DESCRIPTION = "kernel-devsrc hostapp extension: matching kernel headers for out-of-tree module builds via DKMS"
LICENSE = "MIT"

inherit balena-hostapp-extension

# Deliberately not IMAGE_INSTALL-ing the kernel-devsrc package: its own
# do_install layout lands under /lib/modules/<kver>/{build,source}, and
# shipping any /lib/modules/<uname-r>/ directory without Module.symvers
# directly inside it reads to mobynit as a broken kernel-override extension
# (see layers/dkms-shaping.md, findings F1/F2). Its RDEPENDS (bc, flex,
# bison, gcc-plugins, openssl-dev, ...) also belong conceptually to the
# separate balena-dkms toolchain extension, not here.
#
# Instead, consume kernel-devsrc's own kernel_modules_headers.tar.gz deploy
# artifact directly (from meta-balena-common/recipes-kernel/linux/
# kernel-devsrc.bbappend) -- already flattened to <kver>/{build,source} with
# no lib/modules prefix at all -- and place it under /usr/src. Verified by
# hand against a local build: build/tmp/deploy/images/raspberrypi5/
# kernel_modules_headers.tar.gz extracts straight to
# usr/src/6.12.61-v8-16k/{build,source->build}, no relocation needed.
do_rootfs[depends] += "kernel-devsrc:do_deploy"

# Not a kernel-override extension (no /boot, no kernel image): the hard
# compatibility gate is io.balena.image.os-version alone, stamped
# automatically by balena-hostapp-extension.bbclass. Correct only while the
# device runs the stock kernel for this release -- see the open scope
# question in dkms-shaping.md about kernel-override compatibility.
HOSTAPP_EXTENSION_LABEL_OVERRIDE = "150"

# No custom hooks: kernel-override-hooks is unconditionally installed by
# balena-hostapp-extension.bbclass for every extension and no-ops for us
# (extension_kernel_override_prelude trips on the absence of a /boot volume
# and kernel image). See dkms-shaping.md, "Extension activation" section.

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"

install_kernel_devsrc() {
    install -d ${IMAGE_ROOTFS}/usr/src
    tar -xzf ${DEPLOY_DIR_IMAGE}/kernel_modules_headers.tar.gz -C ${IMAGE_ROOTFS}/usr/src
}
IMAGE_PREPROCESS_COMMAND += "install_kernel_devsrc;"
