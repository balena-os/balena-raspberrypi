
# To update the kernel:
#
# 1. Find latest upstream merge at https://github.com/raspberrypi/linux/commits/rpi-6.12.y
#    Update SRCREV_machine to the merge commit hash
#    - SRCREV_machine = "1c819af9ac9733716a9674f7962e2335af6a931c"
#
# 2. Find the version bump commit a few commits before the merge
#    Update LINUX_VERSION to match the SUBLEVEL in Makefile
#    - LINUX_VERSION = "6.12.113"
#
# 3. Find matching yocto-kernel-cache commit at https://git.yoctoproject.org/yocto-kernel-cache
#    Look for "bump to 6.12.xx" commit on yocto-6.12 branch
#    Update SRCREV_meta to that commit hash
#    - SRCREV_meta = "4b64f290ab9ca1947c3848e049768421f74bf263"
#
# Note: Not all kernel versions have corresponding yocto-kernel-cache commits immediately

LINUX_VERSION ?= "6.12.113"
LINUX_RPI_BRANCH ?= ""
LINUX_RPI_KMETA_BRANCH ?= "yocto-6.12"

SRCREV_machine = "1c819af9ac9733716a9674f7962e2335af6a931c"
SRCREV_meta = "4b64f290ab9ca1947c3848e049768421f74bf263"

# The kernel source, shared with linux-raspberrypi-extension_6.12.bb. A
# bbappend cannot carry it: BitBake matches a "%" bbappend by filename prefix,
# and "linux-raspberrypi_%" is not a prefix of
# "linux-raspberrypi-extension_6.12.bb".
#
# nobranch=1 pins the source by SRCREV_machine alone. A recipe that restates
# SRC_URI must restate KMETA with it.
KMETA = "kernel-meta"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;name=machine;nobranch=1;protocol=https \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
    file://powersave.cfg \
    file://android-drivers.cfg \
    "

# Shared by the hostapp kernel, the kernel extension and the bootloader
# kernel. kernel-devicetree.bbclass only weakly defaults the variable, so this
# append survives wherever it is parsed first.
KERNEL_DTC_FLAGS += "-@ -H epapr"
