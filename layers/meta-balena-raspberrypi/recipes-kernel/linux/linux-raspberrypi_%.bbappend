inherit kernel-balena

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

python do_overlays() {
    import glob, re, os
    overlays = []
    source_path = d.getVar('S', True) + '/arch/' + d.getVar('ARCH',True) + '/boot/dts/overlays/*-overlay.dts'
    for overlay in glob.glob(source_path):
        overlays.append(re.sub(r'-overlay.dts','.dtbo',overlay).split('dts/')[-1])
    for dtbo in overlays:
        d.setVar('KERNEL_DEVICETREE', d.getVar('KERNEL_DEVICETREE', True) + ' ' + dtbo)

    if not os.path.exists(d.getVar('DEPLOY_DIR_IMAGE')):
        os.makedirs(d.getVar('DEPLOY_DIR_IMAGE'))
    f = open(d.getVar('DEPLOY_DIR_IMAGE') + '/overlays.txt', "w")
    f.write(d.getVar('KERNEL_DEVICETREE', True))
    f.close
}

# KERNEL_DEVICETREE has a local scope in each function, even in a :prepend,
# so the only way to alter it to include all overlays is by using the prefuncs
do_install[prefuncs] += "do_overlays"
do_compile[prefuncs] += "do_overlays"
do_deploy[prefuncs] += "do_overlays"

# we have to ensure the overlays list is populated so that
# the boot partition can be generated correctly
do_install[nostamp] = "1"

# Built-in SPI drivers needed for API EEPROM update
# Otherwise on A/B rollback modules won't match running kernel
BALENA_CONFIGS:append:raspberrypi4-64 = " pieeprom"
BALENA_CONFIGS[pieeprom] = " \
    CONFIG_SPI=y \
    CONFIG_SPI_BCM2835=y \
    CONFIG_SPI_SPIDEV=y \
"
