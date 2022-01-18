# These device types have been using the aufs storage driver,
# and during a HUP the storage in the inactive sysroot will
# still be aufs, so we need to include the aufs driver further
# for them, as per the internal thread
# https://www.flowdock.com/app/rulemotion/resin-devices/threads/K2TQiSUfNDqBT5Ih6cciNI2d9QJ
BALENA_CONFIGS:append:fincm3 = " aufs"
BALENA_CONFIGS:append:npe-x500-m3 = " aufs"
BALENA_CONFIGS:append:raspberrypi = " aufs"
BALENA_CONFIGS:append:raspberrypi2 = " aufs"
BALENA_CONFIGS:append:raspberrypi3-64 = " aufs"
BALENA_CONFIGS:append:raspberrypi3 = " aufs"
BALENA_CONFIGS:append:revpi-core-3 = " aufs"
