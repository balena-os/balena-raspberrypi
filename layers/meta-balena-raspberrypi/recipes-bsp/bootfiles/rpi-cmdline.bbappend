# Set console accordingly to build type
CMDLINE += " dwc_otg.lpm_enable=0 rootwait"
CMDLINE += "${OS_KERNEL_CMDLINE} ${@oe.utils.conditional('SIGN_API','','',"${OS_KERNEL_SECUREBOOT_CMDLINE}",d)}"

# Add earlycon with OS_DEVELOPMENT=1
CMDLINE:prepend:raspberrypi4-64 = " ${@bb.utils.contains('DISTRO_FEATURES','osdev-image',"earlycon=uart8250,mmio32,0xfe215040 console=tty1","",d)}"
CMDLINE:prepend:raspberrypi400-64 = " ${@bb.utils.contains('DISTRO_FEATURES','osdev-image',"earlycon=uart8250,mmio32,0xfe215040 console=tty1","",d)}"
CMDLINE:prepend:raspberrypicm4-ioboard = " ${@bb.utils.contains('DISTRO_FEATURES','osdev-image',"earlycon=uart8250,mmio32,0xfe215040 console=tty1","",d)}"
CMDLINE:prepend:raspberrypicm4-ioboard-sb = " ${@bb.utils.contains('DISTRO_FEATURES','osdev-image',"earlycon=uart8250,mmio32,0xfe215040 console=tty1","",d)}"

# See https://github.com/raspberrypi/linux/commit/9b0efcc1ec497b2985c6aaa60cd97f0d2d96d203
CMDLINE += " cgroup_enable=memory"
CMDLINE:remove = "root=/dev/mmcblk0p2"
CMDLINE_DEBUG = ""

# Necessary for balena bootloader to work
# These will not be passed to the actual kernel
CMDLINE:append:raspberrypicm4-ioboard-sb := " balena_stage2 nr_cpus=1"
CMDLINE:append:raspberrypi5 := " balena_stage2 maxcpus=0"
