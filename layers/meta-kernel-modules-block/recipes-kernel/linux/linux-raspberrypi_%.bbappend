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

    # Copy version-related configs from the standard defconfig
    # This ensures module version matches the main kernel (e.g., 6.12.61-v8)
    defconfig_path="${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
    if [ -f "${defconfig_path}" ]; then
        # Extract CONFIG_LOCALVERSION (e.g., "-v8")
        localversion=$(grep "^CONFIG_LOCALVERSION=" "${defconfig_path}" | cut -d'"' -f2)
        if [ -n "${localversion}" ]; then
            # Remove any existing LOCALVERSION setting and add the one from defconfig
            sed -i '/^CONFIG_LOCALVERSION=/d' ${B}/.config
            echo "CONFIG_LOCALVERSION=\"${localversion}\"" >> ${B}/.config
            bbnote "Applied CONFIG_LOCALVERSION=${localversion} from ${KBUILD_DEFCONFIG}"
        fi

        # Ensure LOCALVERSION_AUTO matches defconfig (should be disabled)
        sed -i '/CONFIG_LOCALVERSION_AUTO/d' ${B}/.config
        if grep -q "CONFIG_LOCALVERSION_AUTO=y" "${defconfig_path}"; then
            echo "CONFIG_LOCALVERSION_AUTO=y" >> ${B}/.config
        else
            echo "# CONFIG_LOCALVERSION_AUTO is not set" >> ${B}/.config
        fi
    else
        # Fallback: ensure LOCALVERSION_AUTO is disabled
        sed -i 's/CONFIG_LOCALVERSION_AUTO=y/# CONFIG_LOCALVERSION_AUTO is not set/' ${B}/.config
        bbwarn "Defconfig not found at ${defconfig_path}, module version may not match kernel"
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
