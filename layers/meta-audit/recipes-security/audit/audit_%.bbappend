#   Extends the meta-oe `audit` recipe to (1) enable the audisp syslog
#   dispatcher and (2) ship a mutable baseline audit ruleset, so audit events
#   reach the host journal (audisp-syslog -> syslog(3) -> /dev/log -> journald).
#
# Why a .bbappend (not a new recipe)
#   Both files live under ${sysconfdir}/audit/, which the `audit` recipe already
#   owns. Overwriting syslog.conf from within the SAME recipe avoids the
#   file-ownership conflict a second recipe would trigger at rootfs assembly.
#   Version-agnostic (`audit_%`) so it survives upstream version bumps.
#
# Files shipped (via SRC_URI file:// -> do_install:append)
#   files/syslog.conf      -> ${sysconfdir}/audit/plugins.d/syslog.conf
#                             upstream ships `active = no`; we ship `active = yes`.
#                             Packaged into `audispd-plugins`.
#   files/10-balena.rules  -> ${sysconfdir}/audit/rules.d/10-balena.rules
#                             loaded by `augenrules --load` at auditd start.
#                             Mutable on purpose (no `-e 2`) so a privileged app
#                             container can layer rules at runtime via auditctl.
#                             Packaged into `auditd`.
#


FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://syslog.conf \
    file://10-balena.rules \
"

do_install:append() {
    # Enable the audisp syslog dispatcher (upstream ships active=no).
    install -d ${D}${sysconfdir}/audit/plugins.d
    install -m 0640 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/audit/plugins.d/syslog.conf

    # Ship a mutable baseline ruleset (augenrules --load runs at auditd start).
    install -d ${D}${sysconfdir}/audit/rules.d
    install -m 0640 ${WORKDIR}/10-balena.rules ${D}${sysconfdir}/audit/rules.d/10-balena.rules
}