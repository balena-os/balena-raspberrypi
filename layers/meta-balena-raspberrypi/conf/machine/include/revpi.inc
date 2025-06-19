MACHINEOVERRIDES =. "raspberrypi3:"
include conf/machine/raspberrypi3.conf

SOC_FAMILY = "rpi:revpi"

PREFERRED_PROVIDER_virtual/kernel = "linux-kunbus"

KERNEL_MODULE_AUTOLOAD += "piControl"

IMAGE_INSTALL:append = " picontrol"

# to have KBUILD_DEFCONFIG correctly overridden for all revpi based devices we need to define it for the machine type we base upon
KBUILD_DEFCONFIG:raspberrypi3 = "revpi-v7_defconfig"

# we need to clean up all the following RPI_KERNEL_DEVICETREE changes when we switch to a newer kernel for revpi-connect and revpi-core-3
RPI_KERNEL_DEVICETREE = " \
    bcm2708-rpi-zero.dtb \
    bcm2708-rpi-zero-w.dtb \
    bcm2708-rpi-b.dtb \
    bcm2708-rpi-b-rev1.dtb \
    bcm2708-rpi-b-plus.dtb \
    bcm2709-rpi-2-b.dtb \
    bcm2710-rpi-2-b.dtb \
    bcm2710-rpi-3-b.dtb \
    bcm2710-rpi-3-b-plus.dtb \
    bcm2711-rpi-4-b.dtb \
    bcm2711-rpi-400.dtb \
    bcm2708-rpi-cm.dtb \
    bcm2710-rpi-cm3.dtb \
    bcm2711-rpi-cm4.dtb \
"
