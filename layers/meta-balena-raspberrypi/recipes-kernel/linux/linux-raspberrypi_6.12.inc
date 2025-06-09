
# To update the kernel:
#
# 1. Find latest upstream merge at https://github.com/raspberrypi/linux/commits/rpi-6.12.y
#    Update SRCREV_machine to the merge commit hash
#    - SRCREV_machine = "676b222160afa6c3f3fb60a292946096bd2fcdb6"
#
# 2. Find the version bump commit a few commits before the merge
#    Update LINUX_VERSION to match the SUBLEVEL in Makefile
#    - LINUX_VERSION = "6.12.32"
#
# 3. Find matching yocto-kernel-cache commit at https://git.yoctoproject.org/yocto-kernel-cache
#    Look for "bump to 6.12.xx" commit on yocto-6.12 branch
#    Update SRCREV_meta to that commit hash
#    - SRCREV_meta = "0d1b94bc6669a9573f15b9a83a288cc5a666c9ee"
#
# Note: Not all kernel versions have corresponding yocto-kernel-cache commits immediately

LINUX_VERSION ?= "6.12.32"
LINUX_RPI_BRANCH ?= ""
LINUX_RPI_KMETA_BRANCH ?= "yocto-6.12"

SRCREV_machine = "676b222160afa6c3f3fb60a292946096bd2fcdb6"
SRCREV_meta = "0d1b94bc6669a9573f15b9a83a288cc5a666c9ee"
