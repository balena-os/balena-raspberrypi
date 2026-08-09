require recipes-kernel/linux/linux-raspberrypi_6.12.inc
require recipes-kernel/linux/linux-raspberrypi-extension.inc

LINUX_VERSION = "6.12.100"
SRCREV_machine = "2946b3f3b7ebd99ed502dc8da3c7a9b758bdaff2"
SRCREV_meta = "f0ffcbf5883fcbf0074ee698edef86210c1621a5"

inherit kernel-ebpf
