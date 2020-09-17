KEXEC_KERNEL_DEVICETREE = "${@oe.utils.squashspaces(d.getVar('RPI_KERNEL_DEVICETREE')).split()[0].split('/')[1]}"
