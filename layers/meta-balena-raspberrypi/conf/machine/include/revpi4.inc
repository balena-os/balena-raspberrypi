MACHINEOVERRIDES =. "raspberrypi4-64:"
include conf/machine/raspberrypi4-64.conf

SOC_FAMILY = "rpi:revpi"

PREFERRED_PROVIDER_virtual/kernel = "linux-kunbus"

KERNEL_MODULE_AUTOLOAD += "piControl"

IMAGE_INSTALL:append = " picontrol"

# to have KBUILD_DEFCONFIG correctly overridden for all revpi4 based devices we need to define it for the machine type we base upon
KBUILD_DEFCONFIG:raspberrypi4-64 = "revpi-v8_defconfig"
