# audit_%.bbappend  (meta-audit)
#
# Extends the meta-oe `audit` recipe so that, on a balenaOS hostapp-extension
# image, audit events flow to the host journal and a baseline ruleset is loaded
# at boot:
#
#   (1) enable the audisp syslog dispatcher
#         audisp-syslog -> syslog(3) -> /dev/log -> systemd-journald
#   (2) ship a static baseline ruleset that the stock auditd.service loads.
#
# ---------------------------------------------------------------------------
# Why a .bbappend (not a separate recipe)
#   Everything we touch lives under ${sysconfdir}/audit/, which the `audit`
#   recipe already owns. Modifying those files from within the SAME recipe
#   avoids the file-ownership conflict a second recipe would hit at rootfs
#   assembly. `audit_%` is version-agnostic so this survives upstream bumps
#   (currently kirkstone, audit 3.0.8-r0).
#
# ---------------------------------------------------------------------------
# Design note: balenaOS rootfs is READ-ONLY at runtime
#   A hostapp extension mutates the rootfs at boot-time composition, never at
#   runtime, so every file must be correct as a static build artifact. Two
#   consequences drive the choices below:
#
#   * syslog.conf — we do NOT ship our own copy. audit 3.x dropped the old
#     `type=builtin`/`builtin_syslog` form (a hand-written copy of that broke
#     with "Unknown builtin builtin_syslog"). Instead we `sed` the stock file
#     that audispd-plugins installs, flipping only `active`. This can never
#     drift from the audit version's own path/type/args.
#
#   * rules — we install the ruleset directly as /etc/audit/audit.rules, the
#     file the stock auditd.service already loads:
#         ExecStartPost=/sbin/auditctl -R /etc/audit/audit.rules
#     We deliberately DO NOT use rules.d + augenrules: augenrules is a runtime
#     generator that *writes* the compiled set back to audit.rules, which is
#     read-only here. Pre-placing the final artifact needs no generator, no
#     systemd drop-in, and no edit to the vendor unit. The ruleset is mutable
#     (no `-e 2`) so a privileged container can still layer rules via auditctl.
#
# ---------------------------------------------------------------------------
# Files (via SRC_URI file:// -> ${WORKDIR}; ${WORKDIR} is correct on kirkstone)
#   files/10-balena.rules  ->  ${sysconfdir}/audit/audit.rules   (owned by auditd)

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://10-balena.rules \
"

do_install:append() {
    # (1) Enable the audisp syslog dispatcher in the stock plugin config.
    #     Fails loudly if the file is absent (would mean audispd-plugins is not
    #     in IMAGE_INSTALL / the audit version changed the layout).
    sed -i 's/^active\s*=.*/active = yes/' \
        ${D}${sysconfdir}/audit/plugins.d/syslog.conf

    # (2) Install the static baseline ruleset as audit.rules so the stock
    #     auditd.service ExecStartPost loads it at boot (no augenrules).
    install -m 0640 ${WORKDIR}/10-balena.rules \
        ${D}${sysconfdir}/audit/audit.rules
}
