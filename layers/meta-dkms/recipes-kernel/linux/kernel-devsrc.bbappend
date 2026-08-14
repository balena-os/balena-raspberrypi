do_install:append() {
    (
        cd ${B}
        cp -a --parents arch/${ARCH}/include/generated $kerneldir/build/
    )
}

