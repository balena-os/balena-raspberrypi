MACHINEOVERRIDES = "raspberrypi4-64:${MACHINE}"
include conf/machine/raspberrypi4-64.conf

SOC_FAMILY = "rpi:revpi"

# because we override the raspberrypi4-64 machine which in turn is an override of raspberrypi4, we need to do the following gimmick:
# courtesy of https://github.com/balena-os/balena-jetson/pull/112/commits/9d21df6899e595b4aeab4cc9a939ae6c564c669a
MACHINEOVERRIDES := "${@'${MACHINEOVERRIDES}'.replace(':${MACHINE}',':raspberrypi4-64:${MACHINE}')}"

PREFERRED_PROVIDER_virtual/kernel = "linux-kunbus"

KERNEL_MODULE_AUTOLOAD += "piControl"

IMAGE_INSTALL:append = " picontrol"
