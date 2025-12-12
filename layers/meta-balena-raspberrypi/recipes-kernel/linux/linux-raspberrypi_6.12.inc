
# To update the kernel:
#
# 1. Find latest upstream merge at https://github.com/raspberrypi/linux/commits/rpi-6.12.y
#    Update SRCREV_machine to the merge commit hash
#    - SRCREV_machine = "21b410140c47ffab5668399f6f143c7d7b935c8b"
#
# 2. Find the version bump commit a few commits before the merge
#    Update LINUX_VERSION to match the SUBLEVEL in Makefile
#    - LINUX_VERSION = "6.12.61"
#
# 3. Find matching yocto-kernel-cache commit at https://git.yoctoproject.org/yocto-kernel-cache
#    Look for "bump to 6.12.xx" commit on yocto-6.12 branch
#    Update SRCREV_meta to that commit hash
#    - SRCREV_meta = "b79e50adbe76c872daa7748ac7ac9c80b253e2b9"
#
# Note: Not all kernel versions have corresponding yocto-kernel-cache commits immediately

LINUX_VERSION ?= "6.12.61"
LINUX_RPI_BRANCH ?= ""
LINUX_RPI_KMETA_BRANCH ?= "yocto-6.12"

SRCREV_machine = "21b410140c47ffab5668399f6f143c7d7b935c8b"
SRCREV_meta = "b79e50adbe76c872daa7748ac7ac9c80b253e2b9"
