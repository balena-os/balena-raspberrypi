FROM scratch

ARG KERNEL_VERSION
ARG OS_VERSION
COPY contents/ /

LABEL io.balena.image.class=overlay
LABEL io.balena.image.requires-reboot=1
LABEL io.balena.image.store=data
LABEL io.balena.image.profiles=kernel-modules
LABEL io.balena.image.kernel=${KERNEL_VERSION}
LABEL io.balena.image.os-version=${OS_VERSION}
