CONNECTIVITY_FIRMWARES:append = " \
    linux-firmware-rpidistro-bcm43430 \
    linux-firmware-rpidistro-bcm43455 \
    linux-firmware-sd8887 \
    bluez-firmware-rpidistro-bcm43430a1-hcd \
    bluez-firmware-rpidistro-bcm4345c0-hcd \
"
CONNECTIVITY_FIRMWARES:append:raspberrypi = " linux-firmware-mt7601u"

CONNECTIVITY_FIRMWARES:append:raspberrypi400-64 = " \
    linux-firmware-rpidistro-bcm43456 \
    bluez-firmware-rpidistro-bcm4345c5-hcd \
"

CONNECTIVITY_FIRMWARES:remove:raspberrypi4-64 = " \
    linux-firmware-rpidistro-bcm43436 \
    linux-firmware-rpidistro-bcm43436s \
"

CONNECTIVITY_FIRMWARES:append:raspberrypi0-2w-64 = " \
    linux-firmware-rpidistro-bcm43436 \
    linux-firmware-rpidistro-bcm43436s \
    bluez-firmware-rpidistro-bcm43430b0-hcd \
"

CONNECTIVITY_FIRMWARES:remove:raspberrypi0-2w-64 = " \
    linux-firmware-rpidistro-bcm43430 \
    linux-firmware-rpidistro-bcm43455 \
    bluez-firmware-rpidistro-bcm43430a1-hcd \
    bluez-firmware-rpidistro-bcm4345c0-hcd \
"

REMOVED_FOR_HUP_SPACE = " \
    linux-firmware-bcm43455 \
    linux-firmware-ibt-11-5 \
    linux-firmware-ibt-12-16 \
    linux-firmware-ibt-18-16-1 \
    linux-firmware-ibt-hw-37-7 \
    linux-firmware-ibt-hw-37-8 \
    linux-firmware-iwlwifi-3168 \
    linux-firmware-iwlwifi-9000 \
    linux-firmware-iwlwifi-9260 \
    linux-firmware-iwlwifi-qu-b0-hr-b0 \
    linux-firmware-pcie8897 \
    linux-firmware-rtl8723 \
    linux-firmware-rtl8821 \
    linux-firmware-rtl8723b-bt \
    linux-firmware-ralink-nic \
    linux-firmware-ath9k \
    linux-firmware-rtl8192cu \
    linux-firmware-rtl8192su \
    linux-firmware-bcm43143 \
    linux-firmware-iwlwifi-135-6 \
    linux-firmware-iwlwifi-3160-7 \
    linux-firmware-iwlwifi-3160-8 \
    linux-firmware-iwlwifi-3160-9 \
    linux-firmware-iwlwifi-6000-4 \
    linux-firmware-iwlwifi-6000g2a-5 \
    linux-firmware-iwlwifi-6000g2a-6 \
    linux-firmware-iwlwifi-6000g2b-5 \
    linux-firmware-iwlwifi-6000g2b-6 \
    linux-firmware-iwlwifi-6050-4 \
    linux-firmware-iwlwifi-6050-5 \
    linux-firmware-iwlwifi-7260 \
    linux-firmware-iwlwifi-7265 \
    linux-firmware-iwlwifi-7265d \
    linux-firmware-iwlwifi-8000c \
    linux-firmware-iwlwifi-8265 \
    linux-firmware-wl18xx \
    linux-firmware-rpidistro-bcm43430 \
    linux-firmware-sd8887 \
    bluez-firmware-rpidistro-bcm43430a1-hcd \
    linux-firmware-mt7601u \
"

# Temporary make space for HUP, untill firmwares
# are provided by hostapp-extensions
CONNECTIVITY_FIRMWARES:remove:raspberrypi400-64 = "${REMOVED_FOR_HUP_SPACE}"
CONNECTIVITY_FIRMWARES:remove:raspberrypicm4-ioboard = "${REMOVED_FOR_HUP_SPACE}"
CONNECTIVITY_FIRMWARES:remove:raspberrypi0-2w-64 = "${REMOVED_FOR_HUP_SPACE}"
