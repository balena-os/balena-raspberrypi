SUMMARY = "Generic firware USB loading tool for RaspberryPi"
SECTION = "console/utils"
HOMEPAGE = "https://github.com/raspberrypi/usbboot"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"

SRCREV = "dce7f60c78e16794c8a03ba1f0089fec1d23a873"
SRC_URI = "git://github.com/raspberrypi/usbboot.git;protocol=https;branch=master"

inherit sign-rsa pkgconfig deploy native

S = "${WORKDIR}/git"

DEPENDS:append = " libusb1-native"

do_install[network] = "1"
do_install(){
  install -m 755 ${S}/rpiboot ${D}
  install -m 644 ${S}/msd/bootcode.bin ${D}
  install -m 644 ${S}/msd/bootcode4.bin ${D}
  install -m 644 ${S}/msd/start.elf ${D}
  install -m 644 ${S}/msd/start4.elf ${D}
  if [ "x${SIGN_API}" != "x" ]; then
     install -d ${D}/secure-boot-msd/
     if ! do_sign_rsa "${S}/secure-boot-msd/boot.img" "${D}/secure-boot-msd/boot.sig"; then
        bbfatal "Failed to sign boot image"
     fi
     install -m 644 ${S}/secure-boot-msd/boot.img ${D}/secure-boot-msd/
     cp -av ${S}/secure-boot-msd/bootcode4.bin ${D}/secure-boot-msd/bootcode4.bin
  fi
}

do_deploy(){
    install -d ${DEPLOYDIR}/usbboot/
    cp -r ${D}/* ${DEPLOYDIR}/usbboot/
}
addtask do_deploy before do_package after do_install
