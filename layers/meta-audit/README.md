# meta-audit

A balenaOS **hostapp extension** that adds the Linux Audit Framework to the host OS.

The extension ships `auditd` and its userspace tools (`auditctl`, `ausearch`, `aureport`,
`autrace`) plus the audisp plugin set, wires audit events into the host journal, and
installs a baseline ruleset that loads at boot.

It ships **no kernel**. The only hard requirement is that the running host kernel was
built with `CONFIG_AUDIT=y` — the extension cannot add audit support to a kernel that
lacks it.

The layer is not board-specific. It was developed and tested on a Raspberry Pi 5
(aarch64); the one architecture-dependent part is the syscall rules, which are written
for aarch64 native (`b64`) plus 32-bit compat (`b32`). Targeting another architecture
means revisiting those `-F arch=` filters.

---

## Layer contents

| Path | What it contributes |
|------|---------------------|
| `recipes-core/images/balena-audit-block.bb` | The extension image itself. Inherits `balena-hostapp-extension`, installs the `auditd` and `audispd-plugins` packages, and sets the hostapp-extension labels (additive, reboot required). |
| `recipes-security/audit/audit_%.bbappend` | Extends the meta-oe `audit` recipe: enables the audisp syslog dispatcher and installs the baseline ruleset. Version-agnostic (`audit_%`). |
| `recipes-security/audit/files/10-balena.rules` | The baseline ruleset, installed as `/etc/audit/audit.rules`. |
| `conf/layer.conf` | Standard layer metadata; compatible with kirkstone and scarthgap. |

---

## How it behaves on a device

`auditd` starts from the stock systemd unit shipped by the `audit` recipe — this layer
adds no unit and no drop-in.

**Events reach the host journal.** The bbappend flips `active = yes` in the stock
`plugins.d/syslog.conf`, so the dispatcher chain is:

```
auditd → audisp-syslog → syslog(3) → /dev/log → systemd-journald
```

That means audit records show up in `journalctl` alongside everything else on the host,
rather than only in a private `audit.log`. Each record carries its rule key, so records
can be filtered by the `-k` values listed below.

**The ruleset loads at boot** from `/etc/audit/audit.rules`, via the vendor unit's
`ExecStartPost=/sbin/auditctl -R /etc/audit/audit.rules`.

**The ruleset is mutable** — it does not end with `-e 2`, so a privileged application
container can layer additional rules at runtime with `auditctl`.

---

## Baseline ruleset

Control settings: rules are cleared at load (`-D`), the kernel backlog buffer is 8192,
and backlog overflow triggers a `printk` rather than a kernel panic (`-f 1`).

| What | Key | Why |
|------|-----|-----|
| `init_module`, `finit_module`, `delete_module` | `modules` | Kernel module load/unload is the classic root-level persistence and rootkit vector. |
| `settimeofday`, `clock_settime`, `adjtimex` (plus the `*_time64` variants on `b32`) | `time` | Clock manipulation invalidates the timeline of every other record. |
| `mount` | `mounts` | New mounts change what the rest of the filesystem rules actually see. |
| `/mnt/boot/config.json` | `balena_config` | Device identity and provisioning config. |
| `/mnt/boot/system-connections` | `system_connections` | NetworkManager connection profiles — WiFi credentials and connectivity config. A watch on a directory covers its subtree, so one rule catches any profile added, edited or removed. |

Syscall rules are duplicated per architecture, `b64` before `b32`, so that on a kernel
without `CONFIG_COMPAT` the rejected `b32` lines do not take the native rules down with
them. Syscalls sharing a filter, action, key and field set are combined into a single
rule, per the auditctl(8) performance guidance: every syscall rule is evaluated on every
syscall of every process, whereas `-w` watches are only evaluated on filesystem
operations.

Watches on `/etc/passwd`, `/etc/shadow`, `/etc/group`, `/etc/sudoers` and `/etc/sudoers.d`
are present but **commented out**. A watch on a path that does not exist at load time
errors, and that error can stop the remainder of the ruleset from loading. Confirm each
path exists on the target host before enabling it. The same caveat applies to the two
`/mnt/boot` watches above: they only resolve once the boot partition is mounted.

---

## Design constraints

**The rootfs is read-only at runtime.** A hostapp extension composes into the rootfs at
boot and never mutates it afterwards, so every file must be correct as a static build
artifact. This is why the ruleset is installed directly as `/etc/audit/audit.rules`
instead of using `rules.d` + `augenrules`: `augenrules` is a runtime generator that
*writes* the compiled ruleset back to `audit.rules`, which cannot work on a read-only
filesystem. Pre-placing the finished artifact needs no generator, no systemd drop-in, and
no edit to the vendor unit.

**Modifications go in a `.bbappend`, not a second recipe.** Everything this layer changes
lives under `${sysconfdir}/audit/`, which the `audit` recipe already owns. A separate
recipe writing those paths would collide at rootfs assembly.

**`syslog.conf` is edited in place, not shipped.** The stock file installed by
`audispd-plugins` is authoritative for the plugin's path, type and arguments in whatever
audit version gets built; `sed`-ing only the `active` line means this layer cannot drift
from it.

---

## Required temporary patch: additive extension labels

This extension is **additive** (extend-only): it adds files to the host rootfs and must
never shadow existing host files.

Additivity is decided by the **presence** of the `io.balena.image.override` label on the
extension image, not by its value. A high number does not mean "low priority" — any value
at all, including an empty one, makes the extension mount as an override that can shadow
host paths.

The pinned meta-balena in this tree defaults `HOSTAPP_EXTENSION_LABEL_OVERRIDE ?= "100"`
in `balena-hostapp-extension.bbclass` and always emits the label. Setting the variable to
`""` in the image recipe — as `balena-audit-block.bb` does — is therefore **not enough on
its own**.

The patch `0001-hostapp-extension-additive-default.patch` (kept with the extension
workspace, alongside this BSP checkout) backports the behaviour of meta-balena PR #3905:
it flips the class default to empty and emits the `--change` for the label only when a
priority is explicitly set.

Apply it to `layers/meta-balena/meta-balena-common/classes/balena-hostapp-extension.bbclass`
**after** submodule initialisation and **before** every build. A `git submodule update`
silently reverts it, so re-apply it on every fresh checkout — ideally wired into the build
script right after the submodule step.

**Acceptance check.** Inspect the labels on the built image before sideloading it. They
should contain `io.balena.image.class=overlay`, `io.balena.image.store=data`,
`io.balena.update.requires-reboot=1` and `io.balena.image.os-version=<version>` — and the
`io.balena.image.override` key must be **absent entirely**. If it appears, with any value,
the patch did not take; fix that before touching a device.

This section is temporary. Once the upstream change lands in the pinned meta-balena, drop
the patch and delete this section.

---

## Status and limitations

- Hostapp extensions are an **experimental, sideload-only** surface today. Label and
  removal semantics may change once the feature lands upstream; re-verify against
  upstream before relying on any of this.
- There is **no clean development-time unload**. Removing a sideloaded extension is not a
  single action — the container record, the on-disk overlay state, and boot-time
  composition all have to stay in sync.
- Layering additional rules at runtime from a privileged container is expected to work
  (the ruleset is deliberately left mutable) but has **not been verified**.
