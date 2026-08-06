DESCRIPTION = "Linux Audit Framework tools for balenaOS that already have CONFIG_AUDIT=y, no kernel"
LICENSE = "MIT"

inherit balena-hostapp-extension

# Package names, not binary names: `auditd` provides auditctl/ausearch/aureport/
# autrace, `audispd-plugins` provides the audisp-syslog dispatcher.
IMAGE_INSTALL = "auditd audispd-plugins"


HOSTAPP_EXTENSION_LABEL_REQUIRES_REBOOT = "1"
# Empty means additive (io.balena.image.override omitted) ONLY with the class
# patch applied — see README.md. Unpatched, the class emits the label anyway and
# the extension mounts as an override that can shadow host files.
HOSTAPP_EXTENSION_LABEL_OVERRIDE = ""

IMAGE_LINGUAS = ""
VIRTUAL-RUNTIME_init_manager = ""
INITRAMFS_IMAGE = ""
IMAGE_FSTYPES = "tar.gz"


