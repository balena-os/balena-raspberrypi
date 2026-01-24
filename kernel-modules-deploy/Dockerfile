FROM scratch

ARG KERNEL_VERSION
ARG KERNEL_ABI_ID
ARG OS_VERSION
COPY contents/ /

LABEL io.balena.image.class=overlay
LABEL io.balena.update.requires-reboot=1
LABEL io.balena.image.store=data
LABEL io.balena.image.kernel-version=${KERNEL_VERSION}
LABEL io.balena.image.kernel-abi-id=${KERNEL_ABI_ID}
LABEL io.balena.image.os-version=${OS_VERSION}
