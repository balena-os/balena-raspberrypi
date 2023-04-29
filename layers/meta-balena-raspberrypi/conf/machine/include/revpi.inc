MACHINEOVERRIDES = "raspberrypi3:${MACHINE}"
include conf/machine/raspberrypi3.conf

SOC_FAMILY = "rpi:revpi"

PREFERRED_PROVIDER_virtual/kernel = "linux-kunbus"
# pin existing revpi machines to the 4.19.95 kernel (until we fix the HUP altboot rollback issue from 4.19.95 to 5.10.152 kernel)
PREFERRED_VERSION_linux-kunbus = "4.19.95%"

KERNEL_MODULE_AUTOLOAD += "piControl"

# the following overlay is not present in the kernel we use for the Revolution Pis
KERNEL_DEVICETREE:remove = "overlays/uart0.dtbo"

# pin existing revpi machines to older picontrol for kernel 4.19.95
PREFERRED_VERSION_picontrol = "2020.06.16"
IMAGE_INSTALL:append = " picontrol"
