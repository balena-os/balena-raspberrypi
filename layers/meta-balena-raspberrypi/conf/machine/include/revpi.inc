MACHINEOVERRIDES = "raspberrypi3:${MACHINE}"
include conf/machine/raspberrypi3.conf

SOC_FAMILY = "rpi:revpi"

PREFERRED_PROVIDER_virtual/kernel = "linux-kunbus"

KERNEL_MODULE_AUTOLOAD += "piControl"

# the following overlay is not present in the kernel we use for the Revolution Pis
KERNEL_DEVICETREE:remove = "overlays/uart0.dtbo"

IMAGE_INSTALL:append = " picontrol"
