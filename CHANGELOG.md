Change log
-----------

# v2.46.1+rev5
## (2020-01-24)

* Update the balenaFin coffee file instructions to match the hardware [James Harton]

# v2.46.1+rev4
## (2020-01-22)

* Remove the usb-modeswitch patch that fixes crashes on 64 bits architectures [Florin Sarbu]

# v2.46.1+rev3
## (2020-01-15)

* Change the state to 'released' in the coffee files [Vicentiu Galanopulo]

# v2.46.1+rev2
## (2020-01-07)

* Remove spi3 to spi6 overlays for revpi-core-3 because it runs an older kernel which does not have them [Florin Sarbu]

# v2.46.1+rev1
## (2020-01-03)


<details>
<summary> Update meta-balena from v2.44.0 to v2.46.1 [Florin Sarbu] </summary>

> ## meta-balena-2.46.1
> ### (2020-01-01)
> 
> * Disable by default the option to stop u-boot autoboot by pressing CTRL+C in all OS versions [Florin Sarbu]
> * Increase NTP polling time to around 4.5 hours. [Alex Gonzalez]
> * Disable the option to stop u-boot autoboot by pressing CTRL+C in production OS version [Florin Sarbu]

> ## meta-balena-2.46.0
> ### (2019-12-23)
> 
> * Update to ModemManager v1.12.2 [Zahari Petkov]
> * Update libmbim to version 1.20.2 [Zahari Petkov]
> * Update libqmi to version 1.24.2 [Zahari Petkov]
> * Update balena-supervisor to v10.6.27 [Cameron Diver]
> * Tweak how the flasher asserts that internal media is valid for being installed balena OS on [Florin Sarbu]
> * Remove networkmanager stale temporary files at startup [Alex Gonzalez]
> * networkmanager: Rework patches to remove fuzzing [Alex Gonzalez]
> * Update openvpn to v2.4.7 [Will Boyce]
> * Enable kernel configs for USB_SERIAL, USB_SERIAL_PL2303 and HFS for all devices [Zubair Lutfullah Kakakhel]
> * image-resin.bbclass: Mark do_populate_lic_deploy with nostamp [Zubair Lutfullah Kakakhel]
> * Namespace the hello-world healthcheck image [Zubair Lutfullah Kakakhel]
> * Update balena-supervisor to v10.6.17 [Cameron Diver]
> * Update balena-supervisor to v10.6.13 [Cameron Diver]
> * Update CODEOWNERS [Zubair Lutfullah Kakakhel]

> ## meta-balena-2.45.1
> ### (2019-11-21)
> 
> * Fix for a race condition where occasionally the supervisor might not be able to come up during boot. Also can be caused by using io.balena.features.balena-socket and app container restart always policy. Affects meta-balena 2.44.0 and 2.45.0. To be fixed in 2.44.1 and 2.46.0 [Zubair Lutfullah Kakakhel]
> * Rename resin to balena where possible [Pagan Gazzard]
> * Add leading new line for PACKAGE_INSTALL variable [Vicentiu Galanopulo]
> * Set `net.ipv4.ip_local_port_range` to recommended range (49152-65535) [Will Boyce]
> * No user impact, subtle fix in rollback version checks [Zubair Lutfullah Kakakhel]

> ## meta-balena-2.45.0
> ### (2019-10-30)
> 
> * Increase persistent journal size to 32M [Will Boyce]
> * Move persistent logs from state to data partition [Will Boyce]
> * Add wpa-supplicant recipe and update to v2.9 [Will Boyce]
> * Improve robustness by making variou services restart if they stop for some reason [Zubair Lutfullah Kakakhel]
> * Build net/dummy as module [Alexandru Costache]
</details>

# v2.44.0+rev11
## (2020-01-02)

* u-boot: Disable flasher check, add usb [Alexandru Costache]

# v2.44.0+rev10
## (2019-12-20)

* Update the BSP layer to latest warrior in order to have newer wifi firmware [Florin Sarbu]
* Update poky to warrior-21.0.2 [Florin Sarbu]

# v2.44.0+rev9
## (2019-12-06)

* Fix rpi4-64 kernel freeze by moving specific fincm3 patches [Vicentiu Galanopulo]

# v2.44.0+rev8
## (2019-12-06)

* Enable spi3 to spi6 device tree overlays [Vicentiu Galanopulo]

# v2.44.0+rev7
## (2019-11-19)

* Remove the 64 bits OS reference from the rpi4 device pretty name [Florin Sarbu]

# v2.44.0+rev6
## (2019-11-19)

* Update balena-yocto-scripts to v1.5.2 [Florin Sarbu]

# v2.44.0+rev5
## (2019-11-18)

* resin-image: Install vl805 binary and firmware [Alexandru Costache]

# v2.44.0+rev4
## (2019-10-29)

* Add warning advising of no WiFi on Pi 2 [Chris Crocker-White]

# v2.44.0+rev3
## (2019-10-25)

* hostapp-update-hooks: Disable eeprom update temporarily [Alexandru Costache]

# v2.44.0+rev2
## (2019-10-18)

* linux-raspberrypi: Avoid kernel panic if booting with Sensehat [Alexandru Costache]

# v2.44.0+rev1
## (2019-10-17)

* Mention Pi Zero W in the raspberrypi.coffee board name [Florin Sarbu]
* Add to rootfs the overlays for Pimoroni Hyperpixel 4.0 display [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.43.0 to v2.44.0 [Florin Sarbu] </summary>

> ## meta-balena-2.44.0
> ### (2019-10-03)
> 
> * Make uboot dev images autoboot delay build time configurable. Default is no delay [Zubair Lutfullah Kakakhel]
> * Reduce systemd logging level from info to notice [Zubair Lutfullah Kakakhel]
> * resin-supervisor: Expose container ID via env variable [Roman Mazur]
> * kernel-devsrc: Copy vdso.lds.S file in source archive if available [Sebastian Panceac]
> * Disable PasswordAuthentication in sshd in production images as an extra precautionary measure. [Zubair Lutfullah Kakakhel]
> * Update balena-engine to 18.9.10 [Robert Günzler]
> * hostapp-update-hooks: Filter out automount for inactive sysroot [Alexandru Costache]
> * Add support for hooks 2.0 enabling finer granularity during HostOS updates. [Zubair Lutfullah Kakakhel]
> * Update balena-supervisor to v10.3.7 [Cameron Diver]
> * Add support for balena cloud SSH public keys [Andrei Gherzan]
> * Map any user to root using libnss-ato [Andrei Gherzan]
> * Add option to disable kernel headers from being built. [Zubair Lutfullah Kakakhel]
</details>

# v2.43.0+rev6
## (2019-10-14)

* Update balena-yocto-scripts to v1.4.0 [Florin Sarbu]

# v2.43.0+rev5
## (2019-10-11)

* Do not filter balenaFin uAP interface by address [Zahari Petkov]

# v2.43.0+rev4
## (2019-10-04)

* resin-image: Install spi eeprom fw binary and tools [Alexandru Costache]

# v2.43.0+rev3
## (2019-10-02)

* Cleanup redundant u-boot patches as functionality has moved into meta-balena [Zubair Lutfullah Kakakhel]

# v2.43.0+rev2
## (2019-09-30)

* Update balena-yocto-scripts to v1.3.8 [Zubair Lutfullah Kakakhel]

# v2.43.0+rev1
## (2019-09-16)

* Do not enable the vc4-kms-v3d overlay for non-64 bits machines devices [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.41.1 to v2.43.0 [Florin Sarbu] </summary>

> ## meta-balena-2.43.0
> ### (2019-09-13)
> 
> * Update NetworkManager to 1.20.2 [Andrei Gherzan]
> * Update ModemManager to 1.10.6 [Andrei Gherzan]

> ## meta-balena-2.42.0
> ### (2019-09-13)
> 
> * A small fix in initramfs when /dev/console is invalid due to whatever reason [Zubair Lutfullah Kakakhel]
> * Add automated testing for external kernel module header tarballs [Zubair Lutfullah Kakakhel]
> * Make sure correct utsrelease.h is packaged [Zubair Lutfullah Kakakhel]
> * Fix a bug where application containers with new systemd versions were failing to start in cases. Switch to systemd cgroup driver in balenaEngine [Zubair Lutfullah Kakakhel]
</details>

# v2.41.1+rev6
## (2019-09-16)

* Update balena-yocto-scripts to v1.3.7 [Zubair Lutfullah Kakakhel]

# v2.41.1+rev5
## (2019-09-12)

* Rework the simplefb removal patch from u-boot in order to fix a reboot loop issue on .dev images that did not use the vc4-kms-v3d overlay [Florin Sarbu]

# v2.41.1+rev4
## (2019-09-09)

* Update the BSP layer to latest warrior so we have kernel 4.19.71 [Florin Sarbu]

# v2.41.1+rev3
## (2019-09-09)

* Disable simplefb from u-boot and re-enable bcm2708_fb from the kernel [Florin Sarbu]

# v2.41.1+rev2
## (2019-09-08)

* Do not deploy bootcode.bin to boot partition for rpi4 as now the bootcode lives in an EEPROM [Florin Sarbu]

# v2.41.1+rev1
## (2019-09-05)

* Disable bcm2708_fb driver (kernel 4.19.66) so we have working graphics [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.41.0 to v2.41.1 [Florin Sarbu] </summary>

> ## meta-balena-2.41.1
> ### (2019-09-03)
> 
> * Update ModemManager to version 1.10.4 [Florin Sarbu]
> * Fix for some innocous systemd tmpfile warnings /var/run -> /run ones [Zubair Lutfullah Kakakhel]
> * Fix for rollbacks where the inactive partition mount was unavailable when altboot triggered [Zubair Lutfullah Kakakhel]
> * kernel-resin: Enable FTDI USB-serial convertors driver [Sebastian Panceac]
</details>

# v2.41.0+rev6
## (2019-09-02)

* Add an udev rule for unmanaging balenaFin uAP interface [Zahari Petkov]
* Switch balenaFin WiFi to STA+uAP mode and add DTS overrides [Zahari Petkov]
* Update sd8887-mrvl driver to fix uAP mode crash [Zahari Petkov]

# v2.41.0+rev5
## (2019-08-29)

* Use latest boot firmware from here: https://github.com/raspberrypi/firmware/commit/18bf532d97f73acd4b476429518e89f0e3d7007c [Florin Sarbu]

# v2.41.0+rev4
## (2019-08-28)

* Remove debug and extra boot firmware based on the actual balenaOS being built [Florin Sarbu]

# v2.41.0+rev3
## (2019-08-26)

* Add support for Raspberry Pi 4 (64bit) [Andrei Gherzan]

# v2.41.0+rev2
## (2019-08-26)

* Stop using older systemd version because the underlying issue has been addressed in meta-balena now and will be solved in poky hopefully [Florin Sarbu]

# v2.41.0+rev1
## (2019-08-23)


<details>
<summary> layers/meta-balena: Update to v2.41.0 [Sebastian Panceac] </summary>

> ## meta-balena-2.41.0
> ### (2019-08-22)
> 
> * Fix a hang in initramfs for warrior production images [Zubair Lutfullah Kakakhel]
> * Update balena-engine to 18.09.8 [Robert Günzler]
> * Avoid overlayfs mounts in poky's volatile-binds [Andrei Gherzan]
</details>

# v2.40.0+rev1
## (2019-08-15)

* Use older systemd version 239 to workaround board not booting when no console is used ("console=null" in kernel cmdline) [Florin Sarbu]
* Use sd8887 firmware from version 15.68.19.p22 [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.38.3 to v2.40.0 [Florin Sarbu] </summary>

> ## meta-balena-2.40.0
> ### (2019-08-14)
> 
> * Update balena-supervisor to v10.2.2 [Cameron Diver]
> * Workaround for a cornercase bug in PersistentLogging where journalctl filled the state partition. Vacuum the journal on boot. [Zubair Lutfullah Kakakhel]

> ## meta-balena-2.39.0
> ### (2019-07-31)
> 
> * usb-modeswitch-data: Switch Huawei E3372 12d1:1f01 to mbim mode [Alexandru Costache]
> * Fix rollback altboots to prevent good reboots by supervisor triggering rollback. [Zubair Lutfullah Kakakhel]
> * Devices using u-boot. Remove any BOOTDELAY for production images. Add a 2 seconds delay for development images [Zubair Lutfullah Kakakhel]
> * Devices using u-boot. Enable CONFIG_CMD_SETEXPR for all devices. Required for rollbacks to work [Zubair Lutfullah Kakakhel]
> * Devices using u-boot. Enable rollback-altboot by handling bootcount via meta-balena. [Zubair Lutfullah Kakakhel]
> * Production Devices using u-boot. Enable CONFIG_RESET_TO_RETRY to reset a device in case it drops into a u-boot shell [Zubair Lutfullah Kakakhel]
> * Remove confusing networkmanager https connectivity warning [Zubair Lutfullah Kakakhel]
> * Increase fs.inotify.max_user_instances to 512 [Zubair Lutfullah Kakakhel]
> * Update balena-supervisor to v10.0.3 [Cameron Diver]
> * Fix balena hello-world healthcheck [Zubair Lutfullah Kakakhel]
> * Add nf_table kernel modules [Zubair Lutfullah Kakakhel]
> * hostapp-update-hooks: Use correct source for inactive sysroot [Alexandru Costache]
> * Add extra healthcheck to balena service. It will spin up a hello-world container as well [Zubair Lutfullah Kakakhel]
> * Update balena-supervisor to v9.18.8 [Cameron Diver]
> * image-resin.bbclass: fixed a typo [Kyle Harding]
> * kernel-resin: Add support for CH340 family of usb-serial adapters [Sebastian Panceac]
> * resin-proxy-config: add missing reserved ip ranges to default noproxy [Will Boyce]
> * Reduce data partition size from 1G to 192M [Zubair Lutfullah Kakakhel]
</details>

# v2.38.3+rev9
## (2019-08-15)

* Repurpose Marvell pwrseq driver to support balenaFin [Zahari Petkov]

# v2.38.3+rev8
## (2019-08-14)

* Remove unused patch of the kernel [Gergely Imreh]

# v2.38.3+rev7
## (2019-08-12)

* Update sd8887-mrvl driver to 15.68.19.p22 for wlan and 15.26.19.p22 for bt [Florin Sarbu]

# v2.38.3+rev6
## (2019-08-11)

* revpi-core-3: Remove references to non-existent device tree files in linux-kunbus version 4.9.76 [Florin Sarbu]

# v2.38.3+rev5
## (2019-08-06)

* Use the bcm2835-bootfiles version from the BSP layer [Andrei Gherzan]
* meta-raspberrypi: Update to latest commit on warrior [Sebastian Panceac]
* linux-raspberrypi: Use version from BSP layer [Sebastian Panceac]
* u-boot: Use version dictated by meta-raspberrypi BSP layer [Sebastian Panceac]

# v2.38.3+rev4
## (2019-07-15)

* Update the balena-yocto-scripts submodule to v1.3.5 [Florin Sarbu]

# v2.38.3+rev3
## (2019-07-15)

* Update the balena-yocto-scripts submodule to v1.3.3 [Florin Sarbu]

# v2.38.3+rev2
## (2019-07-15)

* Update the balena-yocto-scripts submodule to v1.3.2 [Florin Sarbu]

# v2.38.3+rev1
## (2019-07-14)

* Update the balena-yocto-scripts submodule to v1.3.1 [Florin Sarbu]
* Update to Poky warrior-21.0.0 [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.38.2 to v2.38.3 [Florin Sarbu] </summary>

> ## meta-balena-2.38.3
> ### (2019-07-10)
> 
> * resin-proxy-config: fix up incorrect bash subshell command [Matthew McGinn]
</details>

# v2.38.2+rev1
## (2019-07-03)

* Update the balena-yocto-scripts submodule to v1.2.3 [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.38.1 to v2.38.2 [Florin Sarbu] </summary>

> ## meta-balena-2.38.2
> ### (2019-06-27)
> 
> * Update to kernel-modules-headers v0.0.20 to fix missing target modpost binary on kernel 5.0.3 [Florin Sarbu]
> * Update to kernel-modules-headers v0.0.19 to fix target objtool compile issue on kernel 5.0.3 [Florin Sarbu]
</details>

# v2.38.1+rev2
## (2019-07-03)

* Patches for TCP-based remote denial of service vulnerabilities [Vicentiu Galanopulo]

# v2.38.1+rev1
## (2019-06-27)

* Update meta-balena from v2.38.0 to v2.38.1 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-balena-2.38.1
### (2019-06-20)

* Add warrior to compatible layers for meta-balena-common [Florin Sarbu]
* Fix image-resin.bbclass to be able to use deprecated layers [Andrei Gherzan]
* Fix kernel-devsrc on thud when kernel version < 4.10 [Andrei Gherzan]
</details>

* Add bluetooth dependency for the raspberrypi machine [Vicentiu Galanopulo]

# v2.38.0+rev1
## (2019-06-17)

* Update meta-balena from v2.37.0 to v2.38.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-balena-2.38.0
### (2019-06-14)

* Fix VERSION_ID os-release to be semver complient [Andrei Gherzan]
* Introduce META_BALENA_VERSION in os-release [Andrei Gherzan]
* Fix a case where changes to u-boot were not regenerating the config file at build time and using stale values. [Zubair Lutfullah Kakakhel]
* Use all.rp_filter=2 as the default value in balenaOS [Andrei Gherzan]
* Persist bluetooth storage data over reboots [Andrei Gherzan]
* Drop support for morty and krogoth Yocto versions [Andrei Gherzan]
* Add Yocto Warrior support [Zubair Lutfullah Kakakhel]
* Set both VERSION_ID and VERSION in os-release to host OS version [Andrei Gherzan]
* Bump balena-engine to 18.9.6 [Zubair Lutfullah Kakakhel]
* Downgrade balena-supervisor to v9.15.7 [Andrei Gherzan]
* Switch from dropbear to openSSH [Andrei Gherzan]
* Rename meta-resin-common to meta-balena-common [Andrei Gherzan]
* Add wifi firmware for rtl8192su [Zubair Lutfullah Kakakhel]
</details>

# v2.37.0+rev1
## (2019-06-06)

* Update meta-balena from v2.36.0 to v2.37.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-balena-2.37.0
### (2019-05-29)

* Update balena-supervisor to v9.15.8 [Cameron Diver]
* kernel-modules-headers: Update to v0.0.18 [Andrei Gherzan]
* os-config: Update to v1.1.1 to fix mDNS [Andrei Gherzan]
* Fix busybox nslookup mdns lookups [Andrei Gherzan]
* Update balena-supervisor to v9.15.4 [Cameron Diver]
* Improve logging and version comparison in linux-firmware cleanup class [Andrei Gherzan]
* Sync ModemManager recipe with upstream [Andrei Gherzan]
* Update NetworkManager to 1.18.0 [Andrei Gherzan]
</details>

* Update the balena-yocto-scripts submodule to v1.2.0 [Florin Sarbu]

# v2.36.0+rev2
## (2019-05-21)

* Update the balena-yocto-scripts submodule to v1.1.1 [Florin Sarbu]

# v2.36.0+rev1
## (2019-05-21)

* Update meta-balena from v2.34.1 to v2.36.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-balena-2.36.0
### (2019-05-20)

* Cleanup old versions of iwlwifi firmware files in Yocto Thud [Florin Sarbu]

## meta-balena-2.35.0
### (2019-05-18)

* Update kernel-module-headers to version v0.0.16 [Florin Sarbu]
* Add uboot support for unified kernel cmdline arguments [Andrei Gherzan]
* Switch flasher detection in initramfs to flasher boot parameter [Andrei Gherzan]
* Update balena-supervisor to v9.15.0 [Cameron Diver]
* Improve boot speed by only mounting the inactive partition when needed [Zubair Lutfullah Kakakhel]
* Fix openssl dependency of balena-unique-key [Andrei Gherzan]
* Do not spawn getty in production images [Florin Sarbu]
</details>

* Update the balena-yocto-scripts submodule to v1.1.0 [Florin Sarbu]

# v2.34.1+rev2
## (2019-05-15)

* Set yocto version to thud for board NPE X500 M3 [Adolfo E. García]

# v2.34.1+rev1
## (2019-05-15)

* Update meta-balena from v2.33.0 to v2.34.1 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-balena-2.34.1
### (2019-05-14)

* Update balena-supervisor to v9.14.10 [Cameron Diver]

## meta-balena-2.34.0
### (2019-05-10)

* Add support to update a connectivity section in NetworkManager via config.json [Zubair Lutfullah Kakakhel]
* systemd: Fix journald configuration file [Andrei Gherzan]
* Add --max-download-attempts=10 to balenaEngine service to improve performance on shaky networks [Zubair Lutfullah Kakakhel]
* Update balena-engine to 18.09.5 [Zubair Lutfullah Kakakhel]
* Log initramfs messages to kernel dmesg to capture fsck, partition expand etc. command output [Zubair Lutfullah Kakakhel]
* kernel-resin: Add FAT fs specific configs to RESIN_CONFIGS [Sebastian Panceac]
* Update balena-supervisor to v9.14.9 [Cameron Diver]
* Introduce meta-balena yocto thud support [Andrei Gherzan]
* Update os-config to 1.1.0 [Andrei Gherzan]
</details>

# v2.33.0+rev2
## (2019-05-07)

* Update to yocto thud [Andrei Gherzan]

# v2.33.0+rev1
## (2019-05-02)

* Update rust to 1.33 [Andrei Gherzan]
* Update meta-balena from v2.32.0 to v2.33.0 [Andrei Gherzan]

<details>
<summary> View details </summary>

## meta-balena-2.33.0
### (2019-05-02)

* Fixes for sysroot symlinks creation [Andrei Gherzan]
* libmbim: Refresh patches after last update to avoid build warnings [Andrei Gherzan]
* modemmanager: Refresh patches after last update to avoid build warnings [Andrei Gherzan]
* Make security flags inclusion yocto version specific [Andrei Gherzan]
* systemd: Make directory warning patch yocto version specific [Andrei Gherzan]
* Replace wireless tools by iw [Andrei Gherzan]
* systemd: Use a conf.d file for journald configuration [Andrei Gherzan]
* Set go verison to 1.10.8 to match balena-engine requirements [Andrei Gherzan]
* Update balena-engine to 18.09.3 [Andrei Gherzan]
* Update balena-supervisor to v9.14.6 [Cameron Diver]
* resin-u-boot: make devtool-compatible [Sven Schwermer]
* docker-disk: Disable unnecessary docker pid check [Armin Schlegel]
* Update libmbim to version 1.18.0 [Zahari Petkov]
* Update libqmi to version 1.22.2 [Zahari Petkov]
* Update to ModemManager v1.10.0 [Zahari Petkov]
* Add a OS_KERNEL_CMDLINE parameter that allows BSPs to easily add extra kernel cmdline args to production images [Zubair Lutfullah Kakakhel]
</details>

# v2.32.0+rev1
## (2019-04-30)

* Update meta-balena from v2.31.5 to v2.32.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-balena-2.32.0
### (2019-04-08)

* balena-supervisor: Update to v9.14.0 [Cameron Diver]
* readme: Replace resin with balena where appropriate [Roman Mazur]
* Add systemd-analyze to production images as well [Zubair Lutfullah Kakakhel]
* Enable dbus interface for dnsmasq [Zubair Lutfullah Kakakhel]
* Disable docker bridge while pulling the supervisor container to remove runtime balena-engine warnings [Zubair Lutfullah Kakakhel]
* Fix typo in os-networkmanager that prevented it from working [Zubair Lutfullah Kakakhel]
* Fix bug where fsck was run on the data partition on every boot even if it wasn't needed due to old system time. [Zubair Lutfullah Kakakhel]
* Fix the balena version string reported by balena-engine info [Zubair Lutfullah Kakakhel]
* Only check mmc devices for flasher image presence by default. [Zubair Lutfullah Kakakhel]
* Remove an extra redundant copy of udev rules database [Zubair Lutfullah Kakakhel]
* Un-upx mobynit and os-config to speed them up a bit. Approx 1 second boost to boot time. [Zubair Lutfullah Kakakhel]
</details>

* Workaround for usb_modeswitch crash on rpi3 64 bits [Florin Sarbu]
* Do not try to package the missing uart0 overlay in the revpi-core-3 rootfs [Florin Sarbu]
* Add the uart0 overlay to rootfs [Florin Sarbu]
* Update the balena-yocto-scripts submodule to v1.0.6 [Florin Sarbu]
* Update repo.yml to be able to trigger VersionBot with `meta-balena` [Florin Sarbu]
* Rename meta-resin to meta-balena in repository [Florin Sarbu]

# v2.31.5+rev5
## (2019-04-01)

* Change the pretty name for Raspberry Pi 3 on 64 bits [Florin Sarbu]

# v2.31.5+rev4
## (2019-04-01)

* Change the poky submodule to our github mirror [Florin Sarbu]
* Remove brcm43438 service from the Balena Fin rootfs [Florin Sarbu]

# v2.31.5+rev3
## (2019-03-29)

* Add mt7601u firmware to rootfs for rpi0 [Florin Sarbu]

# v2.31.5+rev2
## (2019-03-29)

* Add config.txt entry removal quirk for revpi-core-3 [Florin Sarbu]

# v2.31.5+rev1
## (2019-03-21)

* Update meta-resin from v2.31.3 to v2.31.5 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.31.5
### (2019-03-21)

* Update resin-supervisor to v9.11.3 [Andrei Gherzan]

## meta-resin-2.31.4
### (2019-03-20)

* resin-supervisor: Recreate on start if config has changed [Rich Bayliss]
</details>

* Remove non-existent pi3 B plus dtb (using 4.9 revpi kernel) from resin-image recipe [Florin Sarbu]
* Remove non-existent pi3 B plus dtb from revpi kernel recipe version 4.9 [Florin Sarbu]
* Rework patch revert for cgroup memory disabling in revpi kernel 4.9 [Florin Sarbu]

# v2.31.3+rev2
## (2019-03-21)

* Add the NPE X500 M3 board in local.conf template file [Adolfo E. García Castro]
* Add .svg file for the NPE X500 M3 board [Adolfo E. García Castro]
* Add .coffe file for the NPE X500 M3 board [Adolfo E. García Castro]
* Enable NPE X500 M3's overaly in RPI's config.txt [Adolfo E. García Castro]
* Add directive in layer.conf to include npe-x500-m3.dtbo [Adolfo E. García Castro]
* Add machine configuration file for the NPE X500 M3 board [Adolfo E. García Castro]
* Modify kernel recipe to support the NPE X500 M3 board [Adolfo E. García Castro]
* Add device tree overlay for the NPE X500 M3 board [Adolfo E. García Castro]

# v2.31.3+rev1
## (2019-03-21)

* Update meta-resin from v2.31.2 to v2.31.3 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.31.3
### (2019-03-20)

* Update resin-supervisor to v9.11.2 [Pablo Carranza Velez]
</details>

* Change picontrol git tag to match kernel 4.9 revision [Florin Sarbu]
* Switch revolution pi kernel to version 4.9 [Florin Sarbu]

# v2.31.2+rev1
## (2019-03-19)

* Update meta-resin from v2.31.1 to v2.31.2 [Pablo Carranza Velez]

# v2.31.1+rev1
## (2019-03-18)

* Update meta-resin from v2.31.0 to v2.31.1 [Pablo Carranza Velez]

# v2.31.0+rev3
## (2019-03-14)

* Prevent u-boot from scanning for usb devices on boot [Zubair Lutfullah Kakakhel]

# v2.31.0+rev2
## (2019-03-11)

* Add info for PR contributions to README.md [Florin Sarbu]

# v2.31.0+rev1
## (2019-03-11)

* Update meta-resin from v2.30.0 to v2.31.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.31.0
### (2019-03-08)

* README:md: Document dnsServers behaviour [Alexis Svinartchouk]
* Update resin-supervisor to v9.9.0 [Cameron Diver]
* Cleanup old versions of iwlwifi firmware files in Yocto sumo [Andrei Gherzan]
* Remove polkit dependency in balenaOS [Andrei Gherzan]
* Remove support for XFS file system [Andrei Gherzan]
* resin-init: update resin.io reference to balenaOS [Matthew McGinn]
</details>

* Update the balena-yocto-scripts submodule to v1.0.3 [Florin Sarbu]
* Add revolution pi kernel configs for various expansion modules [Florin Sarbu]
* Add PREEMPT RT kernel configs for revolution pi [Florin Sarbu]

# v2.30.0+rev1
## (2019-02-28)

* Update meta-resin from v2.29.2 to v2.30.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.30.0
### (2019-02-28)

* resin-supervisor: Recreate on start if config has changed [Rich Bayliss]
* Generate the temporary kernel-devsrc compressed archive in WORKDIR instead of B [Florin Sarbu]
* balena-engine: Update to include fix for signal SIGRTMIN+3 [Andrei Gherzan]
* Reduce sleeps while trying to mount partition to speed up boot [Zubair Lutfullah Kakakhel]
* resin-expand: Reduce sleep duration to speed up boot [Zubair Lutfullah Kakakhel]
* initrdscripts: Reduce sleep to speed up boot [Zubair Lutfullah Kakakhel]
* Make balena-host daemon socket activated to reduce baseline cpu/memory usage [Zubair Lutfullah Kakakhel]
* Update resin-supervisor to v9.8.6 [Cameron Diver]
* Add support for aufs 4.18.11+, 4.19, 4.20 variants and update 4.14, 4.14.56+, 4.15, 4.16, 4.17, 4.18 [Florin Sarbu]
* balena-engine: Bump to include runc patch [Andrei Gherzan]
* Improve kernel-module-headers for v4.18+ kernels [Zubair Lutfullah Kakakhel]
* Update balena-supervisor to v9.8.3 [Cameron Diver]
* Ask chrony to quickly take measurements from custom NTP servers when they are added [Zubair Lutfullah Kakakhel]
* Disable in-tree rtl8192cu driver [Florin Sarbu]
* Prevent rollbacks from running if the previous OS is before v2.30.0 [Zubair Lutfullah Kakakhel]
* Change rollbacks to accept hex partition numbers for jetsons [Zubair Lutfullah Kakakhel]
* Convert partition numbers to hex in u-boot hook. Shouldn't affect any device. [Zubair Lutfullah Kakakhel]
* Reduce default reboot/poweroff timeouts from 30 minutes to 10 minutes [Zubair Lutfullah Kakakhel]
* Configure systemd tmpfiles to ignore supervisor tmp directories [Andrei Gherzan]
* Fixed "Can't have overlapping partitions." error in flasher [Alexandru Costache]
* Define default DNS servers behaviour with and without google DNS [Andrei Gherzan]
* Update balena-supervisor to v9.4.2 [Cameron Diver]
* Fix for some warnings [Zubair Lutfullah Kakakhel]
* Fix tini filename after balena-engine rename [Andrei Gherzan]
* Fix nm dispatcher hook when there are no custom ntp servers in config.json [Zubair Lutfullah Kakakhel]
* Improve persistent logging systemd service dependencies [Zubair Lutfullah Kakakhel]
* Update balena-supervisor to v9.3.0 [Cameron Diver]
* Use the new revision for balena source code [Florin Sarbu]
* Add a workaround for a bug where the chronyc online command in network manager hook would get stuck and eat cpu cycles [Zubair Lutfullah Kakakhel]
* Fix img to rootfs dependency when img is invalidated [Andrei Gherzan]
* Have boot partition type configurable as FAT32 [Andrei Gherzan]
* Deprecate morty and krogoth [Zubair Lutfullah Kakakhel]
* Deploy kernel source as a build artifact as well for external module compilation [Zubair Lutfullah Kakakhel]
* kernel-devsrc: Tarball up the kernel source and deploy it. [Zubair Lutfullah Kakakhel]
* kernel-modules-headers: Use the build directory for artifacts [Zubair Lutfullah Kakakhel]
* docs: Add documentation on nested changelogs [Giovanni Garufi]
* VersionBot: update upstream name and url [Giovanni Garufi]
</details>

# v2.29.2+rev9
## (2019-02-28)

* Fix kernel-devsrc compilation on raspberrypi 3 arm64 [Florin Sarbu]

# v2.29.2+rev8
## (2019-02-26)

* Set kernel image type for rpi3 64 bits to Image instead of zImage [Florin Sarbu]
* Update the balena-yocto-scripts submodule to v1.0.2 [Florin Sarbu]

# v2.29.2+rev7
## (2019-02-18)

* rpi-config: Prevent u-boot UART logging on RevPi Core3 [Sebastian Panceac]

# v2.29.2+rev6
## (2019-02-18)

* linux-kunbus: Enable video console in debug builds [Sebastian Panceac]

# v2.29.2+rev5
## (2019-02-15)

* balenaFin v1.1.0 compatibility

# v2.29.2+rev4
## (2019-02-13)

* systemd: Remove serial consoles on RevPi Core3 regardless of image type [Sebastian Panceac]
* linux-kunbus: Disable serial console in development image [Sebastian Panceac]
* Fix config.txt options for RevPi Core3 [Sebastian Panceac]

# v2.29.2+rev3
## (2019-02-06)

* resin-mounts: Mount boot partition before loading kernel modules [Sebastian Panceac]
* rpi-config: Add in config.txt specific overlays for RevPi Core3 [Sebastian Panceac]
* linux-kunbus: Add Revolution Pi Core3 kernel [Sebastian Panceac]

# v2.29.2+rev2
## (2019-02-04)

* Update bcm2835-bootfiles for CM3+ support [Andrei Gherzan]

# v2.29.2+rev1
## (2019-01-17)

* Update meta-resin from v2.29.1 to v2.29.2 [Florin Sarbu]

# v2.29.1+rev2
## (2019-01-15)

* u-boot: Increase to 16 the USB interfaces number [Sebastian Panceac]

# v2.29.1+rev1
## (2019-01-13)

* Switch to FAT32 boot partition [Andrei Gherzan]
* Update meta-resin from v2.29.0 to v2.29.1 [Andrei Gherzan]

# v2.29.0+rev2
## (2019-01-11)

* Enable the PCA963X LED driver module so we also support boards incorporating this family of integrated circuits [curcuz]

# v2.29.0+rev1
## (2018-12-19)

* Update meta-resin from v2.28.0 to v2.29.0 [Sebastian Panceac]
* Update balena-yocto-scripts submodule to v1.0.1 [Sebastian Panceac]

# v2.28.0+rev1
## (2018-12-06)

* Update meta-resin from v2.27.0 to v2.28.0 [Alexandru Costache]

<details>
<summary> View details </summary>

## meta-resin-2.28.0
### (2018-12-05)

* Update os-config to 1.0.0 [Zahari Petkov]
* Update libqmi to version 1.20.2 [Florin Sarbu]
* Update libmbim to version 1.16.2 [Florin Sarbu]
* kernel-modules-headers: Add basic sanity test [Zubair Lutfullah Kakakhel]
* Fix kernel module header generation [Zubair Lutfullah Kakakhel]
* image-resin.bbclass: Fix config.json pretty format [Andrei Gherzan]
* Allow supervisor update on unmanaged devices [Andrei Gherzan]
* Update resin-supervisor to v8.6.3 [Cameron Diver]
</details>

* Switch from resin-yocto-scripts to balena-yocto-scripts [Alexandru Costache]

# v2.27.0+rev2
## (2018-12-05)

* Updated firmware to v20180924 [Alexandru Costache]

# v2.27.0+rev1
## (2018-11-26)

* Update meta-resin from v2.26.0 to v2.27.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.27.0
### (2018-11-23)

* Expose randomMacAddressScan config.json knob [Andrei Gherzan]
* Move modemmanager udev rules in /lib/udev/rules.d [Andrei Gherzan]
* Fix modemmanager bbappend files [Andrei Gherzan]
* dnsmasq: Define 8.8.8.8 as a fallback nameserver [Andrei Gherzan]
* Increase timeout for filesystem label [Vicentiu Galanopulo]
* Add support for Huawei ME936 modem in MBIM mode [Florin Sarbu]
* Backport systemd sd-shutdown improvements for sumo versions [Florin Sarbu]
* Include avahi d-bus introspection files in rootfs [Andrei Gherzan]
* Fix custom udev rules when rule is removed from config.json [Zubair Lutfullah Kakakhel]
* resin-mounts: Add NetworkManager conf.d bind mounts [Zubair Lutfullah Kakakhel]
* Add support to pass custom configuration to NetworkManager [Zubair Lutfullah Kakakhel]
* README.md: Add info about SSH and Avahi services [Andrei Gherzan]
* Avoid xtables lock in resin-proxy-config [Andrei Gherzan]
* Migrate the supervisor to balena repositories [Florin Sarbu]
* Update balena-supervisor to v8.3.5 [Cameron Diver]
* Update supported modems list [Florin Sarbu]

## meta-resin-2.26.0
### (2018-11-05)

* Rename resin-unique-key to balena-unique-key [Andrei Gherzan]
* Don't let resin-unique-key rewrite config.json [Andrei Gherzan]
</details>

# v2.26.0+rev4
## (2018-11-19)

* Set autoboot with no delay, with no check for abort [Florin Sarbu]

# v2.26.0+rev3
## (2018-11-15)

* Clean-up old bcm2708_wdog watchdog module [Florin Sarbu]

# v2.26.0+rev2
## (2018-11-07)

* Use new balena source repo for SRC_URI [Florin Sarbu]

# v2.26.0+rev1
## (2018-11-06)

* Update meta-resin from v2.25.0 to v2.26.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.26.0
### (2018-11-05)

* Rename resin-unique-key to balena-unique-key [Andrei Gherzan]
* Don't let resin-unique-key rewrite config.json [Andrei Gherzan]

## meta-resin-2.25.0
### (2018-11-02)

* Generate ssh host key at first boot (not at first connection) [Andrei Gherzan]
* Fix extraneous space in kernel-resin.bbclass config [Florin Sarbu]
* Drop obsolete eval from kernel-resin's do_kernel_resin_reconfigure [Florin Sarbu]
* Add SyslogIdentifier for balena and resin-supervisor healthdog services [Matthew McGinn]
</details>

* Update the resin-yocto-scripts submodule to master HEAD [Florin Sarbu]

# v2.25.0+rev1
## (2018-11-05)

* Update meta-resin from v2.24.0 to v2.25.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.25.0
### (2018-11-02)

* Generate ssh host key at first boot (not at first connection) [Andrei Gherzan]
* Fix extraneous space in kernel-resin.bbclass config [Florin Sarbu]
* Drop obsolete eval from kernel-resin's do_kernel_resin_reconfigure [Florin Sarbu]
* Add SyslogIdentifier for balena and resin-supervisor healthdog services [Matthew McGinn]

## meta-resin-2.24.1
### (2018-11-01)

* Update resin-supervisor to v8.0.0 [Pablo Carranza Velez]

## meta-resin-2.24.0
### (2018-10-24)

* resin-info: Small tweak for balenaCloud product [Andrei Gherzan]
* Update resin-supervisor to v7.25.8 [Pablo Carranza Velez]
* Rename resinOS to balenaOS [Andrei Gherzan]
</details>

# v2.24.0+rev1
## (2018-10-24)

* Update meta-resin submodule from v2.22.1 to v2.24.0 [Sebastian Panceac]

# v2.22.1+rev1
## (2018-10-20)

* Update meta-resin from v2.22.0 to v2.22.1 [Andrei Gherzan]

<details>
<summary> View details </summary>

## meta-resin-2.22.1
### (2018-10-20)

* Update resin-supervisor to v7.25.3

## meta-resin-2.22.0
### (2018-10-19)

* Update resin-supervisor to v7.25.2
* Include a CONTRIBUTING.md file
* Update to ModemManager v1.8.2
* Updates on contributing-device-support.md
</details>

* Disable rollbacks [Andrei Gherzan]

# v2.22.0+rev1
## (2018-10-19)

* Update meta-resin from v2.21.0 to v2.22.0 [Andrei Gherzan]

<details>
<summary> View details </summary>

## meta-resin-2.22.0
### (2018-10-19)

* Update resin-supervisor to v7.25.2
* Include a CONTRIBUTING.md file
* Update to ModemManager v1.8.2
* Updates on contributing-device-support.md

## meta-resin-2.21.0
### (2018-10-18)

* Improve systemd service ordering in rollbacks
* Update resin-supervisor to v7.24.1
</details>

# v2.21.0+rev1
## (2018-10-19)

* Update meta-resin from v2.19.0 to v2.21.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.21.0
### (2018-10-18)

* Improve systemd service ordering in rollbacks
* Update resin-supervisor to v7.24.1

## meta-resin-2.20.0
### (2018-10-18)

* Avoid expander on flasher based on root kernel argument
* Resin-vars: Implement custom ssh keys service
* Fix redsocks interface creation when no proxy configured
* Replace NM's DHCP request option "Client indentifier" with udhcpc style option
* Fix for rollbacks in case of old balenaOS version
* Update resin-supervisor to v7.21.4
* Warn if rules are found in /etc/udev/rules.d
* Add support to load custom udev rules from config.json
* Aufs-util: Package auplink separately
* Enable kernel config dependencies for MBIM and QMI
* Set UPX to use LZMA compression by default
* Downgrade UPX to 3.94 for ARM
* Balena update for rollbacks. mobynit can now mount rootfs from sysroot.
* Fix proxy when using containers over bridge network
* Add support for aufs 4.9.9+, 4.9.94+, 4.18
* Add rollback-altboot service before balena service
* Add Automated Rollback recipe
* Add Automated Rollback support in u-boot env_resin.h
* Add a hook to support Automated Rollbacks
* Update HUP grub hook to support Automated Rollbacks
* Update HUP u-boot hook to support Automated Rollbacks
* Move kernel-image-initramfs from resin-image recipe to packagegroup-resin.inc
* Have 99-resin-grub hostapp-update-hook decide which grub to use

## meta-resin-2.19.0
### (2018-09-23)

* Update Balena to fix tty console hanging in some cases
* Pin down cargo deps (using Cargo.lock) to versions known working with rust 1.24.1 (for sumo)
* Remove duplicate packaging of bcm43143
* Set ModemManager to ignore Inca Roads Serial Device
* Add support for aufs 4.14.56+
* Update resin-supervisor to v7.19.7
</details>

* Disable u-boot autoboot delay option and enable CTRL^C autoboot stop feature [Florin Sarbu]

# v2.19.0+rev3
## (2018-10-19)

* Add hook to remove kernel from boot parition after a HUP [Zubair Lutfullah Kakakhel]
* Add Automated Rollback support [Zubair Lutfullah Kakakhel]
* Remove the kernel from the boot partition [Zubair Lutfullah Kakakhel]
* Load the kernel from the rootfs [Zubair Lutfullah Kakakhel]

# v2.19.0+rev2
## (2018-10-11)

* Move udev rules from /etc to /lib [Zubair Lutfullah Kakakhel]

# v2.19.0+rev1
## (2018-10-01)

* Update meta-resin from v2.15.1 to v2.19.0 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.19.0
### (2018-09-23)

* Update Balena to fix tty console hanging in some cases
* Pin down cargo deps (using Cargo.lock) to versions known working with rust 1.24.1 (for sumo)
* Remove duplicate packaging of bcm43143
* Set ModemManager to ignore Inca Roads Serial Device
* Add support for aufs 4.14.56+
* Update resin-supervisor to v7.19.7

## meta-resin-2.18.1
### (2018-09-14)

* Add a parsable representation of the changelog

## meta-resin-v2.18.0
### (2018-09-12)

* Update grub hooks to prepare to load kernel from root [Zubair Lutfullah Kakakhel]
* Update resin-supervisor to v7.19.4 [Cameron Diver]
* Kernel-resin.bbclass: Enable CONFIG_IP_NF_TARGET_LOG as a module [John (Jack) Brown]
* Balena: Update to current HEAD of 17.12-resin [Andrei Gherzan]
* Compress os-config with UPX on arm64 too [Andrei Gherzan]
* Update upx to 3.95 [Andrei Gherzan]
* Add support to skip flasher detection in env_resin.h [Zubair Lutfullah Kakakhel]
* Add the kernel to the rootfs [Zubair Lutfullah Kakakhel]
* Rework resin-supervisor systemd dependency on balena [Florin Sarbu]
* Enhanced security options for dropbear - sumo [Andrei Gherzan]
* Enhanced security options for dropbear - rocko [Andrei Gherzan]
* Enhanced security options for dropbear - pyro [Andrei Gherzan]
* Enhanced security options for dropbear - morty [Andrei Gherzan]
* Enhanced security options for dropbear - krogoth [Andrei Gherzan]

## meta-resin-2.17.0
### (2018-09-03)

* Resin-proxy-config: The no_proxy file fails to parse when missing EOL [Rich Bayliss]

## meta-resin-2.16.0
### (2018-08-31)

* Os-config: UPX is broken on aarch64 [Theodor Gherzan]
* Allow flasher types to pin preloaded devices [Theodor Gherzan]
* Disable PIE for go [Zubair Lutfullah Kakakhel]
* Disable PIE for balena [Zubair Lutfullah Kakakhel]
</details>

* Change u-boot's CONFIG_AUTOBOOT_DELAY_STR to 'pause' [Florin Sarbu]

# v2.15.1+rev3
## (2018-09-14)

* Add repo and changelog yml files [Giovanni Garufi]

# v2.15.1+rev2
## (2018-09-08)

* Set Huawei 12d1:1506 modems back to NCM mode [Florin Sarbu]

# v2.15.1+rev1
## (2018-08-30)

* Update the meta-resin submodule to version v2.15.1 [Florin Sarbu]

# v2.14.3+rev5
## (2018-08-28)

* Backport "media: uvcvideo: Fix driver reference counting" patch [Florin Sarbu]

# v2.14.3+rev4
## (2018-08-27)

* Switch the Balena Fin wifi and bluetooth driver to the proprietary one [Florin Sarbu]

# v2.14.3+rev3
## (2018-08-27)

* Enable kernel I2C and GPIO support for Kontron PLD devices [Florin Sarbu]

# v2.14.3+rev2
## (2018-08-26)

* Add versionist support [Florin Sarbu]

* Use the DTB loaded by the pi firmware in u-boot [ZubairLK]

# v2.14.3+rev1
## (2018-08-14)

* Update the meta-resin submodule to version v2.14.3 [Florin]
* Add u-boot v2018.07 recipe and use that [ZubairLK]

# v2.14.1+rev1
## (2018-08-03)

* Update the meta-resin submodule to version v2.14.1 [Florin]
* Fix qmi_wwan patch name in linux-raspberrypi [Andrei]
* Add u-boot in the bootchain [ZubairLK]
* Update the resin-yocto-scripts submodule to 8312741e13604a9d166370349061876afb22c0fa (on master branch) [Florin]
* Backport kernel qmi fix for supporting SIMCOM SIM7600E-H modem [Florin]

# v2.14.0+rev1
## (2018-07-18)

* Update the meta-resin submodule to version v2.14.0 [Florin]

# v2.13.6+rev1
## (2018-07-13)

* Update the meta-resin submodule to version v2.13.6 [Florin]

# v2.13.5+rev1
## (2018-07-09)

* Update the meta-resin submodule to version v2.13.5 [Florin]
* Update the resin-yocto-scripts submodule to 59ccd8558435ff6424827fb36ccb43b14650f4d4 (on master branch) [Florin]

# v2.13.3+rev1
## (2018-07-05)

* Update the meta-resin submodule to version v2.13.3 [Florin]

# v2.13.2+rev1
## (2018-06-28)

* Update the meta-resin submodule to version v2.13.2 [Florin]
* Update the resin-yocto-scripts submodule to 6eddcc9a637e00dbca94815f9af0f2b7bf61eb88 (on master branch) [Florin]
* Disable WiFi power saving mode on the Balena Fin board [Florin]
* Fix bluetooth on rpi zero wireless [Florin]
* modemmanager: fix support for Huawei MS2372 modem [Sebastian]

# v2.13.1+rev1
## (2018-06-18)

* Update the meta-resin submodule to version v2.13.1 [Florin]
* Update to yocto sumo and matching dependencies [Andrei]

# v2.13.0+rev1
## (2018-06-11)

* Update the meta-resin submodule to version v2.13.0 [Florin]
* Remove subtype_of from fincm3.coffee [Florin]
* Cleanup bcm2835-bootfiles and fix fincm3 build [Andrei]
* Update fincm3 icon [Andrei]
* Update the BSP to include the latest changes in rocko branch (fixes MAC address for ethernet on RaspberryPi 3B+ [Andrei]
* Remove superfluous wait instruction from the fincm3.coffee file [Florin]

# v2.12.7+rev1
## (2018-05-04)

* Update the meta-resin submodule to version v2.12.7 [Andrei]
* Add Balena Fin device type and support [Andrei]
* Backport Balena Fin overlay patch which adds the correct overlay source [Florin]

# v2.12.6+rev1
## (2018-04-30)

* Update the meta-resin submodule to version v2.12.6 [Florin]
* Update the resin-yocto-scripts submodule to f7718efbbf53369aaacb7eb54e707ee8a5d4fc4b (on master branch) [Florin]
* Modify the 99-rpi-bootloader hostapp hook use filesystem label instead of physical partition number [TheOnlyZby]
* Use filesystem label instead of physical partition number for the kernel cmdline root parameter [TheOnlyZby]
* Include balena fin dtbo in OS [Andrei]
* Update warning in the dashboard regarding the RPi3 wifi connectivity [Gergely]

# v2.12.5+rev2
## (2018-04-03)

* Add udev rule and systemd service to switch U-Blox modem from RNDIS to ECM mode [Sebastian]

# v2.12.5+rev1
## (2018-03-27)

* Update the meta-resin submodule to version v2.12.5 [Florin]
* Add boot firmware and WiFi firmware for Raspberry Pi 3 B+ [Florin]
* Update the resin-yocto-scripts submodule to 9cecb1ca4d9d4713dd337148b7d04a17afdba772 (on master branch) [Florin]

# v2.12.3+rev1
## (2018-03-15)

* Update the meta-resin submodule to version v2.12.3 [Florin]

# v2.12.2+rev1
## (2018-03-14)

* Update the meta-resin submodule to version v2.12.2 [Florin]

# v2.12.1+rev1
## (2018-03-12)

* Update the meta-resin submodule to version v2.12.1 [Andrei]

# v2.12.0+rev1
## (2018-03-09)

* Update the meta-resin submodule to version v2.12.0 [Theodor]

# v2.11.2+rev1
## (2018-03-08)

* Update the meta-resin submodule to version v2.11.2 [Andrei]

# v2.11.1+rev1
## (2018-03-08)

* Update the meta-resin submodule to version v2.11.1 [Andrei]

# v2.11.0+rev1
## (2018-03-08)

* Update the meta-resin submodule to version v2.11.0 [Theodor]

# v2.10.1+rev1
## (2018-02-28)

* Update the meta-resin submodule to version v2.10.1 [Florin]
* Update the resin-yocto-scripts submodule to dc9dfe466e48d934e55fb20a05156886873b1ab1 (on master branch) [Florin]

# v2.10.0+rev1
## (2018-02-27)

* Update the meta-resin submodule to version v2.10.0 [Andrei]
* Update to rocko [Andrei]

# v2.9.7+rev1
## (2018-02-07)

* Update the meta-resin submodule to version v2.9.7 [Florin]
* Update the resin-yocto-scripts submodule to d209b8c9c797ebd52a0f5ce404ea2420c248724c (on master branch) [Florin]
* Revert patch which disables memory cgroup controller by default [Andrei]

# v2.9.6+rev1
## (2018-01-13)

* Update the meta-resin submodule to version v2.9.6 [Florin]

# v2.9.5+rev1
## (2018-01-11)

* Update the meta-resin submodule to version v2.9.5 [Florin]
* Blacklist the upstream rtl8192cu wifi driver in favour of the out of tree 8192cu wifi driver [Florin]

# v2.9.4+rev1
## (2018-01-10)

* Update the meta-resin submodule to version v2.9.4 [Florin]

# v2.9.3+rev1
## (2018-01-10)

* Update the meta-resin submodule to version v2.9.3 [Florin]
* Update the resin-yocto-scripts submodule to 6f7a9ab326bb822196e3e48b08ef1d73d08caec6 (on master branch) [Florin]
* Make bluetooth be enabled by default in the host OS [Florin]
* Add the latest SD8887 Marvel Wi-Fi firmware from linux-firmware git into image [Sebastian]

# v2.9.1+rev1
## (2017-12-12)

* Update the meta-resin submodule to version v2.9.1 [Florin]
* Make the 99-rpi-bootloader hostapp hook detect where it is run from [Florin]
* Bump kernel to version 4.9.59 [Florin]

# v2.7.8+rev1
## (2017-11-17)

* Update the meta-resin submodule to version v2.7.8 [Florin]
* Increase initramfs maximum size to 12 MB (12288 KB) [Florin]

# v2.7.5+rev2
## (2017-11-04)

* Update the resin-yocto-scripts submodule to c4db082fd2d5a3b4857035264c1e726962d7b826 (on master branch) [Florin]
* Default to compressed kernel image [Andrei]

# v2.7.5+rev1
## (2017-11-01)

* Update the meta-resin submodule to version v2.7.5 [Florin]
* Exclude from resinOS the debug versions of boot firmware [Florin]
* Fix obsolete reference to older debug-image [Florin]
* Fix typo in enabling support for PCA955 GPIO expander [Florin]

# v2.7.4+rev1
## (2017-10-25)

* Update the meta-resin submodule to version v2.7.4 [Florin]
* Update the meta-raspberrypi BSP layer to revision 40447de4782d76f1e23e67ba05e272c27f6ec250 (pyro branch) [Florin]
* Enable PCA955x IO expander in kernel config [Florin]
* Update the resin-yocto-scripts submodule to e3a06d48a2f8b7e32d3047c33066a5b896e6ae93 [Florin]
* Update layers to Yocto Pyro [Will]
* Update meta-openembedded to latest morty branch [Will]
* Update poky to latest morty branch [Will]

# v2.7.2+rev1
## (2017-10-08)

* Update the meta-resin submodule to version v2.7.2 [Florin]
* Update the resin-yocto-scripts submodule to HEAD of master [Florin]
* Enabled always overcommit VM mode [Yossi]
* Add meta-rust submodule [Will]
* Update resin-yocto-scripts to include deployment of docker images [Andrei]

# v2.6.0+rev1
## (2017-09-20)

* Update the meta-resin submodule to version v2.6.0 [Andrei]
* Integrate with hostapps [Andrei]
* Update the resin-yocto-scripts again to fix Pyro build [Will]
* Update the resin-yocto-scripts to fix Pyro build [Will]
* Update the resin-yocto-scripts submodule to HEAD of master [Will]

# v2.3.0+rev1
## (2017-08-17)

* Update the meta-resin submodule to version v2.3.0 [Florin]

# v2.2.0+rev1
## (2017-07-30)

* Update the meta-resin submodule to version v2.2.0 [Florin]
* Update the resin-yocto-scripts submodule to HEAD of master [Florin]

# v2.1.0+rev1
## (2017-07-20)

* Update the meta-resin submodule to version v2.1.0 [Michal]
* Update the resin-yocto-scripts submodule to HEAD of master [Michal]
* Add WiFi 5GHz connectivity warning for RPi 3 & Zero W [Thodoris]

# v2.0.8+rev1
## (2017-07-04)

* Update the meta-resin submodule to version v2.0.8 [Florin]
* Update the resin-yocto-scripts submodule to HEAD of master [Florin]

# v2.0.7+rev1
## (2017-06-29)

* Update the meta-resin submodule to version v2.0.7 [Florin]
* Update the getting started links in the .coffee files [Florin]
* Update the resin-yocto-scripts submodule to HEAD of master [Florin]
* Add support for bluetooth on the Raspberry Pi Zero WiFi [Michal]

# v2.0.6+rev1
## (2017-06-06)

* Update the meta-resin submodule to version v2.0.6 [Andrei]

# v2.0.5+rev1
## (2017-06-05)

* Update the meta-resin submodule to version v2.0.5 [Florin]
* Update the resin-yocto-scripts submodule to HEAD of master [Florin]
* Update the resin-yocto-scripts submodule [Florin]
* Update resin-yocto-scripts to master [Will]

# v2.0.3+rev1
## (2017-05-12)

* Update the meta-resin submodule to version v2.0.3 [Florin]

# v2.0.2+rev2
## (2017-05-01)

* Bump resin-yocto-scripts to fix Jenkins deployment [Andrei]

# v2.0.2+rev1
## (2017-04-24)

* Use aliases for serial devices [Andrei]
* Add support for Raspberry Pi Zero WiFi [Andrei]
* Add support for 64bit Raspberry Pi 3 [Andrei]
* Update the meta-resin submodule to version v2.0.2 [Andrei]

# v2.0.0+rev3
## (2017-04-13)

* Bump resin-yocto-scripts to include deployment routine [Andrei]

# v2.0.0+rev2
## (2017-04-04)

* Bump resin-yocto-scripts to fix resinOS docker registry push [Andrei]

# v2.0.0+rev1
## (2017-04-03)

* Fix OS version to be semver compliant [Andrei]

# v2.0.0.rev1
## (2017-04-01)

* Update the meta-resin submodule to version v2.0.0 [Andrei]

# v2.0.0-rc6.rev1
## (2017-03-31)

* Update the meta-resin submodule to version v2.0.0-rc6 [Andrei]
* Enable audio by default [Andrei]

# v2.0.0-rc5.rev1
## (2017-03-26)

* Re-add console=null for production builds [Florin]
* Update meta-resin to v2.0.0-rc5 [Florin]
* Avoid cursor on virtual terminal in production [Andrei]
* Enable AutoHAT tests through Jenkins [Praneeth]

# v2.0.0-rc4.rev1
## (2017-03-20)

* Update meta-resin to v2.0.0-rc4 [Andrei]

# v2.0.0-rc3.rev1
## (2017-03-14)

* Update meta-resin submodule to version v2.0.0-rc3 [Florin]

# v2.0.0-rc1.rev2
## (2017-03-10)

* Temporary fix for boot fail on production images [Andrei]

# v2.0.0-rc1.rev1
## (2017-03-10)

* Fix dtb deployment when using initramfs [Andrei]
* Load the i2c-dev kernel module at startup [Michal]

# v2.0.0-beta13.rev3
## (2017-03-03)

* Deploy all available overlay dt files for Raspberry Pi [Michal]

# v2.0.0-beta13.rev2
## (2017-03-01)

* Include linux-firmware-bcm43430 for all RaspberryPi boards [Andrei]

# v2.0.0-beta13.rev1
## (2017-02-28)

* Update to Morty [Michal]

# v2.0.0-beta12.rev1
## (2017-02-27)

* Bump resin-yocto-scripts to current HEAD [Andrei]
* Update meta-resin to v2.0.0-beta.12 [Andrei]
* Don't load audio module (snd_bcm2835) automatically [Andrei]

# v2.0.0-beta11.rev1
## (2017-02-15)

* Update meta-resin to v2.0.0-beta.11 [Andrei]

# v2.0.0-beta10.rev1
## (2017-02-14)

* Update meta-resin to v2.0.0-beta.10 [Andrei]

# v2.0.0-beta.9
## (2017-02-08)

* Update meta-resin to v2.0-beta.9 [Andrei]

# v2.0.0-beta.8
## (2017-01-29)

* Update meta-resin to v2.0-beta.8 [Andrei]
* Update resin-yocto-scripts to HEAD of the master branch [Florin]
* Update the bootloader to the latest version, this adds support for rpi2 rev1.2 [Michal]

# v2.0.0-beta.7
## (2016-12-05)

* Update meta-resin to v2.0-beta.7 [Florin]

# v2.0.0-beta.6
## (2016-12-05)

* Update meta-resin to v2.0-beta.6 [Andrei]

# v2.0.0-beta.5
## (2016-11-30)

* Update meta-resin to v2.0-beta.5 [Andrei]
* Autoload the rpi watchdog kernel module (bcm2708_wdog) [Florin]

# v2.0.0-beta.3
## (2016-11-07)

* Update meta-resin to v2.0-beta.3 [Andrei]
* Cleanup docker-resin-supervisor-disk of unneeded variables [Andrei]
* Update resin-yocto-scripts to fix logging in container builds

# v2.0.0-beta.2
## (2016-11-01)

* Update meta-resin to v2.0-beta.2 [Florin]
* Don't compress kernel modules [Michal]

# v2.0.0-beta.1
## (2016-10-11)

* Update meta-resin to v2.0-beta.1 [Andrei]
* Add meta-filesystem as we need aufs-utils [Andrei]
* Add build support for resinos [Andrei]
* Update resin-yocto-script to include changes in our image types [Theodor]
* Replace the concept of a debug image with a development image [Theodor]
* Update meta-resin to include avahi [Florin]
* Update resin-yocto-scripts to include kernel headers handling as gzip [Florin]

# v1.16.1
## (2016-10-01)

* Update meta-resin to include supervisor v2.5.0 [Pablo]

# v1.16.0
## (2016-09-27)

* Update meta-resin to v1.16 [Florin]

# v1.15.0
## (2016-09-24)

* Update meta-resin to v1.15 [Florin]

# v1.14.0
## (2016-09-23)

* Update meta-resin to v1.14 [Florin]

# v1.13.0
## (2016-09-23)

* Update meta-resin to v1.13 [Florin]

# v1.12.0
## (2016-09-21)

* Update meta-resin to v1.12 [Florin]
* Update resin-yocto-scripts to include resinhup upload to dockerhub [Florin]
* Update meta-resin [Florin]
* Change .coffee to announce partition 1 now holds config.json and also introduce versioning (v1) [Florin]

# v1.11.0
## (2016-08-31)

* Update meta-resin to v1.11 [Florin]

# v1.10.0
## (2016-08-24)

* Update meta-resin to v1.10 [Florin]

# v1.9.0
## (2016-08-24)

* Update meta-resin to v1.9 [Florin]
* Update resin-yocto-scripts for including kernel modules headers deploy [Florin]
* Update yocto-resin-scripts for host nodejs detection improvements [Florin]

# v1.8.0
## (2016-08-02)

* Bump meta-resin to v1.8 [Andrei]
* Disable firmware splash and firmware related warnings [Theodor]
* Fix kernel log messages over HDMI (i.e. device connected to tty1) [Theodor]
* Bump resin-device-types to include partial manifest support [Andrei]
* No more debug images in staging

# v1.7.0
## (2016-07-14)

* Update meta-resin to v1.7

# v1.6.0
## (2016-07-06)

* Update meta-resin to v1.6 [Florin]

# v1.5.0
## (2016-07-04)

* Update meta-resin to v1.5 [Florin]

# v1.5.0rc4
## (2016-06-29)

* Update meta-resin to include supervisor update to v1.11.6 [Florin]

# v1.5.0rc3
## (2016-06-29)

* Update meta-resin to include openvpn-resin.service refactoring [Florin]

# v1.5.0rc2
## (2016-06-28)

* Update meta-resin to include docker key.json fix [Florin]
* Update meta-resin to include flasher fixes [Florin]

# v1.4.0
## (2016-06-27)

* Update meta-resin to v1.4 [Florin]
* Update meta-resin to allow let error out [Florin]
* Update meta-resin to allow patching of kernel-modules-headers [Florin]
* Bump meta-resin to fix various issues [Andrei]
* Fix a small syntax error in meta-resin [Andrei]
* Fix automation fix for debug image [Andrei]
* Replace RESIN_STAGING_BUILD by DEBUG_IMAGE [Andrei]

# v1.3.0
## (2016-06-24)

* Update meta-resin to v1.3 [Florin]
* Update meta-resin to include kernel modules compress support [Andrei]
* Compress kernel modules [Andrei]
* Replace SUPERVISOR_TAG by TARGET_TAG [Andrei]
* Custom docker images in connectable builds [Andrei]
* Bump meta-resin to include connectable builds [Andrei]
* Remove RPI_FIX_VCHIQ workaround as fix is included in our base images [Andrei]
* Add support for optional supervisor image [Andrei]

# v1.2.1
## (2016-06-18)

# v1.2.0
## (2016-06-10)

* Mask brcm43438.service [Florin]
* Update meta-resin to v1.2 [Andrei]
* Bump meta-resin to HEAD [Andrei]
* Bump yocto-resin-scripts to bring in improvements for in-docker builds [Andrei]
* Configure builds with RM_OLD_IMAGE [Theodor]
* Bump meta-raspberypi to include bluetooth support for raspberypi3 [Andrei]
* Bump meta-resin to include switch from rce to docker [Andrei]
* Update meta-raspberrypi BSP layer to pick up changes and set console=tty1 in production [Andrei]

# v1.1.4
## (2016-04-16)

* Be able to workaround the issues with egl apps in containers using RPI_FIX_VCHIQ [Andrei]

# v1.1.1
## (2016-03-16)

* Add support for Raspberrypi 3 [Theodor]
* Change revision of meta-raspberrypi to the current HEAD of the jethro branch [Theodor]
* Transition from fido -> jethro [Theodor]
