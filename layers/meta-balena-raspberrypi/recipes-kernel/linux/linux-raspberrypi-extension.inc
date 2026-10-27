# Raspberry Pi kernel extension.
#
# The kernel source and the configuration shared with the hostapp kernel come
# from linux-raspberrypi_<ver>.inc, linux-raspberrypi-balena.inc and
# linux-raspberrypi-balena_<ver>.inc.

require linux-raspberrypi.inc

# Must stay below the require above. See kernel-extension.bbclass for why.
inherit kernel-extension kernel-balena-override

require recipes-kernel/linux/linux-raspberrypi-balena.inc
