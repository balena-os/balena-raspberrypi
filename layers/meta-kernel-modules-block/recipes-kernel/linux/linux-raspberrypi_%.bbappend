# Override kernel configuration to use allmodconfig
# This enables ALL possible kernel modules for the extension block

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://allmodconfig-fixes.cfg"

# Replace do_kernel_configme to use allmodconfig instead of defconfig
# The BALENA_CONFIGS from kernel-balena.bbclass will still be applied
# in do_kernel_resin_injectconfig which runs after do_configure
do_kernel_configme() {
    cd ${S}

    # Generate allmodconfig - enables everything as modules where possible
    oe_runmake -C ${S} O=${B} allmodconfig

    # Apply fixes for allmodconfig build issues
    ${S}/scripts/kconfig/merge_config.sh -m -O ${B} ${B}/.config ${WORKDIR}/allmodconfig-fixes.cfg

    # Ensure LOCALVERSION_AUTO is disabled for consistent module versioning
    sed -i 's/CONFIG_LOCALVERSION_AUTO=y/# CONFIG_LOCALVERSION_AUTO is not set/' ${B}/.config

    # Apply LINUX_VERSION_EXTENSION if set
    if [ -n "${LINUX_VERSION_EXTENSION}" ]; then
        echo "CONFIG_LOCALVERSION=\"${LINUX_VERSION_EXTENSION}\"" >> ${B}/.config
    fi
}

# Skip kernel_configcheck since we bypass the standard kernel-meta system
do_kernel_configcheck() {
    :
}

# Remove modules.builtin.ranges - not needed for loadable modules block
do_install:append() {
    rm -f ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.ranges
}
