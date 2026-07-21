DESCRIPTION = "Linux Audit Framework tools for balenaOS that already have CONFIG_AUDIT=y, no kernel"
LICENSE = "MIT"

inherit balena-hostapp-extension

IMAGE_INSTALL = "auditd" # this takes package name and not binary name. we want binaries like auditd auditctl ausearch aureport autrace


HOSTAPP_EXTENSION_LABEL_REQUIRES_REBOOT = "1"
HOSTAPP_EXTENSION_LABEL_OVERRIDE = ""

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"


