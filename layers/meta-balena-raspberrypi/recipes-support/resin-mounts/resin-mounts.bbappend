FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:revpi = "\
	file://resin-boot.conf \
"
SRC_URI:append:raspberrypicm4-ioboard-sb = "\
  file://balena-rpi.service \
"

do_install:append:raspberrypicm4-ioboard-sb() {
  if [ "x${SIGN_API}" != "x" ]; then
    sed -i -e "s/@@BALENA_NONENC_BOOT_LABEL@@/${BALENA_NONENC_BOOT_LABEL}/g" "${D}${systemd_unitdir}/system/balena-rpi.service"
  fi
}

do_install:append:revpi() {
	install -d ${D}${sysconfdir}/systemd/system/resin-boot.service.d
	install -m 0644 resin-boot.conf ${D}${sysconfdir}/systemd/system/resin-boot.service.d/
}
