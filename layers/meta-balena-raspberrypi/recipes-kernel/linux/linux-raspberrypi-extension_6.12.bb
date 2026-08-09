require recipes-kernel/linux/linux-raspberrypi_6.12.inc
require recipes-kernel/linux/linux-raspberrypi-extension.inc

# No bbappend matches this recipe name. Require the shared configuration
# directly.
require linux-raspberrypi-balena_6.12.inc

inherit kernel-ebpf
