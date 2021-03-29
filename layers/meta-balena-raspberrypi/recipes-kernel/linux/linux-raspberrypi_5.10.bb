# copied from meta-raspberrypi@ef04a3a523e6cd935968f34f338501fd915c506c
# and renamed linux-raspberrypi.inc to linux-raspberrypi_5.10.inc

LINUX_VERSION ?= "5.10.17"
LINUX_RPI_BRANCH ?= "rpi-5.10.y"

SRCREV_machine = "ec967eb45f8d4ed59bebafb5748da38118383be7"
SRCREV_meta = "5833ca701711d487c9094bd1efc671e8ef7d001e"

KMETA = "kernel-meta"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;name=machine;branch=${LINUX_RPI_BRANCH} \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA} \
    file://powersave.cfg \
    file://android-drivers.cfg \
    "

require linux-raspberrypi_5.10.inc

KERNEL_DTC_FLAGS += "-@ -H epapr"
