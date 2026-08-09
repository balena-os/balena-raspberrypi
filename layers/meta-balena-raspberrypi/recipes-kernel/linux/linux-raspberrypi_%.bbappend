require recipes-kernel/linux/linux-raspberrypi-balena.inc

# Do not share do_overlays with the extension kernel. It writes
# ${DEPLOY_DIR_IMAGE}/overlays.txt, which drives the boot partition. Two
# recipes that write that path overwrite each other.
#
# Without this prefunc the extension kernel packages the base dtbs only, not
# the dtbo overlays. The hostapp overlays stay visible through the lower layer
# of the overlay mount. Both kernels build from one SRCREV.
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
