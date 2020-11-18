LINUX_VERSION ?= "5.4.77"
LINUX_RPI_BRANCH ?= "rpi-5.4.y"

SRCREV = "b8681a08ba16b15cc9f010bef2a24ffac0b054d1"

require linux-raspberrypi_5.4.inc

SRC_URI += "file://0001-Revert-selftests-bpf-Skip-perf-hw-events-test-if-the.patch \
            file://0002-Revert-selftests-bpf-Fix-perf_buffer-test-on-systems.patch \
            file://powersave.cfg \
           "
