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
#   Everything touched here lives under ${sysconfdir}/audit/, which the `audit`
#   recipe already owns. Modifying those files from within the SAME recipe
#   avoids the file-ownership conflict a second recipe would hit at rootfs
#   assembly. `audit_%` is version-agnostic, so this survives upstream bumps.
#
# ---------------------------------------------------------------------------
# The balenaOS rootfs is read-only at runtime: an extension composes into it at
# boot, never afterwards, so every file must be correct as a static build
# artifact. That drives both choices below.
#
#   * syslog.conf — sed the stock file that audispd-plugins installs, flipping
#     only `active`, rather than shipping our own copy. The stock file is
#     authoritative for the plugin path/type/args of whatever audit version is
#     built, so this cannot drift.
#
#   * rules — installed directly as /etc/audit/audit.rules, the file the stock
#     auditd.service already loads:
#         ExecStartPost=/sbin/auditctl -R /etc/audit/audit.rules
#     rules.d + augenrules is deliberately not used: augenrules is a runtime
#     generator that *writes* the compiled set back to audit.rules, which is
#     read-only here. Pre-placing the final artifact needs no generator, no
#     systemd drop-in, and no edit to the vendor unit. The ruleset is mutable
#     (no `-e 2`) so a privileged container can still layer rules via auditctl.
#
# ---------------------------------------------------------------------------
# Files (via SRC_URI file:// -> ${WORKDIR})
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
