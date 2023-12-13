PACKAGES:remove:revpi = "initramfs-module-migrate"
do_install:append:revpi() {
	rm -f ${D}/init.d/92-migrate
}
