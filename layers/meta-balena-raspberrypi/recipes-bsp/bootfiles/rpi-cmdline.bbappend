# Set console accordingly to build type
CMDLINE += " dwc_otg.lpm_enable=0 rootwait"
CMDLINE += " ${@bb.utils.contains('DISTRO_FEATURES','osdev-image',"console=tty1 console=serial0,115200"," vt.global_cursor_default=0 console=null",d)}"

# See https://github.com/raspberrypi/linux/commit/9b0efcc1ec497b2985c6aaa60cd97f0d2d96d203
CMDLINE += " cgroup_enable=memory"
CMDLINE:remove = "root=/dev/mmcblk0p2"
CMDLINE_DEBUG = ""
