Change log
-----------

# v2.87.7+rev1
## (2021-11-18)


<details>
<summary> Update meta-balena from v2.86.0 to v2.87.7 [Alexandru Costache] </summary>

> ## meta-balena-2.87.7
> ### (2021-11-16)
> 
> * initrdscripts: add a script for unlocking LUKS volumes [Michal Toman]
> 
> ## meta-balena-2.87.6
> ### (2021-11-15)
> 
> * connectivity: proxy: move nadoo/glider to container [Joseph Kogut]
> 
> ## meta-balena-2.87.5
> ### (2021-11-11)
> 
> * tests: os: Add exposed engine socket test [Alex Gonzalez]
> 
> ## meta-balena-2.87.4
> ### (2021-11-11)
> 
> * resindataexpander: also resize LUKS volume if necessary [Michal Toman]
> 
> ## meta-balena-2.87.3
> ### (2021-11-11)
> 
> * Add out-of-tree peak CAN driver [Michal Toman]
> 
> ## meta-balena-2.87.2
> ### (2021-11-11)
> 
> * Add recipes for TPM2 tools [Michal Toman]
> 
> ## meta-balena-2.87.1
> ### (2021-11-10)
> 
> * recipes-devtools/dosfstools: Fix build with Poky Honister [Alexandru Costache]
> 
> ## meta-balena-2.87.0
> ### (2021-11-09)
> 
> * meta-balena-common/conf: Switch layer to Honister compatibility [Alexandru Costache]
> 
> ## meta-balena-2.86.3
> ### (2021-11-09)
> 
> * patch: Fix URL to yocto project dependencies [Kyle Harding]
> 
> ## meta-balena-2.86.2
> ### (2021-11-08)
> 
> * dosfstools: selectively apply upstreamed patch [Joseph Kogut]
> * tests: wait for the chronyd service become active [Mark Corbin]
> 
> ## meta-balena-2.86.1
> ### (2021-11-02)
> 
> * tests/issue: Add test to check issues files [Alex Gonzalez]
> * base files: Use HOSTOS_VERSION in issue and issue.net [Alex Gonzalez]
> 
</details>

# v2.86.0+rev1
## (2021-11-04)


<details>
<summary> Update meta-balena from v2.85.2 to v2.86.0 [Alexandru Costache] </summary>

> ## meta-balena-2.86.0
> ### (2021-10-29)
> 
> * Create new data partition reset service [Kyle Harding]
> 
> ## meta-balena-2.85.17
> ### (2021-10-28)
> 
> * restrict dtoverlay test to rpi devices [rcooke-warwick]
> 
> ## meta-balena-2.85.16
> ### (2021-10-27)
> 
> 
> <details>
> <summary> Update balena-engine to v19.03.30 [Robert Günzler] </summary>
> 
>> ### balena-engine-19.03.30
>> #### (2021-10-26)
>> 
>> * storagemigration: keep going if migration fails [Robert Günzler]
>> * graphdriver/copy: fix handling of sockets [Robert Günzler]
>> 
> </details>
> 
> 
> ## meta-balena-2.85.15
> ### (2021-10-26)
> 
> * linux-firmware: Include RTL8723BU firmware files [Zahari Petkov]
> 
> ## meta-balena-2.85.14
> ### (2021-10-25)
> 
> * balena-supervisor: Update balena-supervisor to v12.11.0 [Felipe Lalanne]
> 
> ## meta-balena-2.85.13
> ### (2021-10-21)
> 
> * balena-engine: Remove deprecated development drop-in service file [Kyle Harding]
> 
> ## meta-balena-2.85.12
> ### (2021-10-21)
> 
> * make led test work with beaglebone [rcooke-warwick]
> 
> ## meta-balena-2.85.11
> ### (2021-10-06)
> 
> * patch: Add dtoverlay practical test [Vipul Gupta (@vipulgupta2048)]
> 
> ## meta-balena-2.85.10
> ### (2021-10-04)
> 
> * image-balena: Decouple boot directory generation from rootfs task [Alex Gonzalez]
> 
> ## meta-balena-2.85.9
> ### (2021-10-01)
> 
> * classes/resin-u-boot: Increase OS_BOOTCOUNT_LIMIT to 3 [Alexandru Costache]
> 
> ## meta-balena-2.85.8
> ### (2021-09-29)
> 
> * hostapp-update-hooks: Blacklist Rock Pi configuration file [Alexandru Costache]
> 
> ## meta-balena-2.85.7
> ### (2021-09-28)
> 
> * balena-healthcheck: Remove redundant steps and rely on hello-world [Kyle Harding]
> 
> ## meta-balena-2.85.6
> ### (2021-09-27)
> 
> * kernel-balena: Fix kernel config warning for UPROBE_EVENTS [Alex Gonzalez]
> * kernel-balena: Configure DEBUG_FS [Alex Gonzalez]
> 
> ## meta-balena-2.85.5
> ### (2021-09-23)
> 
> * Run iwlwifi firmware cleanup in fakeroot [Kyle Harding]
> 
> ## meta-balena-2.85.4
> ### (2021-09-21)
> 
> * common: conf: create disable-user-ns distro feature [Joseph Kogut]
> 
> ## meta-balena-2.85.3
> ### (2021-09-21)
> 
> * balena-os-sysctl: Reduce the console default loglevel [Alex Gonzalez]
> * balena-config-vars: Re-run os-sshkeys if config.json is modified [Alex Gonzalez]
> * systemd: Use drop-in to modify unit files instead of sed [Alex Gonzalez]
> 
</details>


<details>
<summary> Update balena-yocto-scripts from v1.14.9 to 1.15.8 [Alexandru Costache] </summary>

> ## balena-yocto-scripts-1.15.8
> ### (2021-11-03)
> 
> * Dockerfile_yocto-build-env: Install Honister host deps [Alexandru Costache]
> 
> ## balena-yocto-scripts-1.15.7
> ### (2021-10-25)
> 
> * jenkins_build.sh: Fix deployment for discontinued device types [Alex Gonzalez]
> * jenkins_build.sh: Remove PRIVATE_DT as it is unused [Alex Gonzalez]
> * jenkins_build.sh: Fix lint warnings [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.15.6
> ### (2021-10-21)
> 
> * balena-generate-ami.sh: wait for boot partition when preloading AMI [Michal Toman]
> 
> ## balena-yocto-scripts-1.15.5
> ### (2021-10-21)
> 
> * jenkins_generate_ami.sh: Use a shared directory for preloaded image [Michal Toman]
> 
> ## balena-yocto-scripts-1.15.4
> ### (2021-10-20)
> 
> * barys: update development image variables [Mark Corbin]
> 
> ## balena-yocto-scripts-1.15.3
> ### (2021-10-20)
> 
> * jenkins_generate_ami.sh: Preload outside of yocto cache [Michal Toman]
> 
> ## balena-yocto-scripts-1.15.2
> ### (2021-10-01)
> 
> * balena-generate-ami.sh: correctly mount boot partition when injecting SSH key [Michal Toman]
> 
> ## balena-yocto-scripts-1.15.1
> ### (2021-10-01)
> 
> * Update balena-cli to 12.50.1 [Michal Toman]
> 
> ## balena-yocto-scripts-1.15.0
> ### (2021-10-01)
> 
> * jenkins_generate_ami.sh: Use lib function to get arch from config.json [Michal Toman]
> * balena-generate-ami.sh: Look for boot partition by label rather than hardcoding p1 [Michal Toman]
> * balena-generate-ami.sh: Fail if AMI already exists [Michal Toman]
> * balena-generate-ami.sh: sync after writing config.json [Michal Toman]
> * balena-generate-ami.sh: Stick to POSIX-compliant [ instead of [[ [Michal Toman]
> * balena-generate-ami.sh: Remove useless statements [Michal Toman]
> * jenkins_generate_ami.sh: Use architecture as suffix instead of machine name [Michal Toman]
> * jenkins_build.sh: pass MACHINE to jenkins_generate_ami.sh [Michal Toman]
> * AMI automation: Adjust AMI names to be compatible with AWS API [ab77]
> * AMI automation: Correct S3 bucket name and key [ab77]
> * AMI automation: Add a separate container for generaing AMI [Michal Toman]
> * AMI automation: shellcheck and resolve violations [ab77]
> * AMI automation: Use staging env by default [Tomás Tormo]
> * AMI automation: Simplify public ssh addition. Do not use sudo [Tomás Tormo]
> * automation: Generate and publish AMI from the raw balenaOS image [Tomás Tormo]
> 
</details>

# v2.85.2+rev5
## (2021-10-25)

* Correct wording in README.md about commit subject length [Florin Sarbu]

# v2.85.2+rev4
## (2021-10-18)

* meta-balena-raspberrypi: update local.conf.sample [Mark Corbin]

# v2.85.2+rev3
## (2021-09-23)

* Restore rtl8188eufw firmware (requested for cm4-ioboard and pi400) [Kyle Harding]
* Enable linux-firmware compression for all Raspberry Pi 4 based boards [Florin Sarbu]

# v2.85.2+rev2
## (2021-09-22)

* Fix USB 2.0 on Raspberry Pi 4 v1.4 by removing obsolete xhci pci patch for VL805 [Florin Sarbu]

# v2.85.2+rev1
## (2021-09-20)


<details>
<summary> Update meta-balena from v2.83.21 to v2.85.2 [Alex Gonzalez] </summary>

> ## meta-balena-2.85.2
> ### (2021-09-17)
> 
> 
> <details>
> <summary> Update balena-engine to v19.03.29 [Robert Günzler] </summary>
> 
>> ### balena-engine-19.03.29
>> #### (2021-09-14)
>> 
>> * pkg/storagemigration: use graphdriver/copy.DirCopy [Robert Günzler]
>> 
>> ### balena-engine-19.03.28
>> #### (2021-09-14)
>> 
>> * Prune Jenkinsfile [Robert Günzler]
>> 
>> ### balena-engine-19.03.27
>> #### (2021-09-01)
>> 
>> * Backport platform-detection fixes from containerd [Robert Günzler]
>> 
> </details>
> 
> 
> ## meta-balena-2.85.1
> ### (2021-09-17)
> 
> * Fix typo in OS_DEVELOPMENT distro feature [Kyle Harding]
> * tests: Remove OS variants [Alex Gonzalez]
> 
> ## meta-balena-2.85.0
> ### (2021-09-15)
> 
> * Replace image variants with development mode [Alex Gonzalez]
> 
> <details>
> <summary> balena-supervisor: Update balena-supervisor to v12.10.10 [Alex Gonzalez] </summary>
> 
>> ### balena-supervisor-12.10.10
>> #### (2021-09-07)
>> 
>> * api-keys: Remove os variant parameter for authentication check [Alex Gonzalez]
>> * os-release: Use developmentMode to ascertain OS variant in new releases [Alex Gonzalez]
>> * config: Add developmentMode to schema [Alex Gonzalez]
>> 
>> ### balena-supervisor-12.10.9
>> #### (2021-09-02)
>> 
>> * Update URL to balena-proxy-config source code [Kyle Harding]
>> 
>> ### balena-supervisor-12.10.8
>> #### (2021-09-01)
>> 
>> * Bump path-parse from 1.0.6 to 1.0.7 [dependabot[bot]]
>> 
>> ### balena-supervisor-12.10.7
>> #### (2021-09-01)
>> 
>> * Bump tar from 4.4.13 to 4.4.19 [dependabot[bot]]
>> 
>> ### balena-supervisor-12.10.6
>> #### (2021-09-01)
>> 
>> * Remove "variable list" heading in configuration doc [Miguel Casqueira]
>> 
>> ### balena-supervisor-12.10.5
>> #### (2021-08-31)
>> 
>> * Clean up configurations.md [Miguel Casqueira]
>> 
>> ### balena-supervisor-12.10.4
>> #### (2021-08-31)
>> 
>> * Include issues with downgrading versions in README [Miguel Casqueira]
>> 
> </details>
> 
> * u-boot: Introduce a compile time osdev-image feature [Alex Gonzalez]
> * os-release: Remove image variants information [Alex Gonzalez]
> * Replace DEVELOPMENT_IMAGE and image variants with OS_DEVELOPMENT [Alex Gonzalez]
> * images: Remove debug-tweaks settings. [Alex Gonzalez]
> * openssh: Enable runtime development configuration [Alex Gonzalez]
> * balena-info: Rename from resin-info [Alex Gonzalez]
> * balena: Expose engine socket on development mode [Alex Gonzalez]
> * image-balena: Allow passwordless root logins [Alex Gonzalez]
> * image_balena: Remove "balena" hostname from development images [Alex Gonzalez]
> * systemd: Runtime enablement of serial console [Alex Gonzalez]
> * development-features: Add service for development features runtime management [Alex Gonzalez]
> 
> ## meta-balena-2.84.7
> ### (2021-09-13)
> 
> * hostapp-update-hooks: Fix blacklisted extlinux.conf file path [Alexandru Costache]
> 
> ## meta-balena-2.84.6
> ### (2021-09-11)
> 
> * balena-persistent-logs: add comment and update logging [Mark Corbin]
> * meta-balena: rename resin-persistent-logs [Mark Corbin]
> 
> ## meta-balena-2.84.5
> ### (2021-09-10)
> 
> * tests: led: require led property from device type [Joseph Kogut]
> 
> ## meta-balena-2.84.4
> ### (2021-09-09)
> 
> * tests: Remove reboots from redsocks test cases [Kyle Harding]
> 
> ## meta-balena-2.84.3
> ### (2021-09-09)
> 
> * tests: Prevent failure when journalctl has no logs for some boots [Kyle Harding]
> 
> ## meta-balena-2.84.2
> ### (2021-09-08)
> 
> * contributing-device-support.md: Updates to board support instructions [Florin Sarbu]
> 
> ## meta-balena-2.84.1
> ### (2021-09-05)
> 
> * tests: s/BALENA_MACHINE_NAME/BALENA_ARCH [Joseph Kogut]
> 
> ## meta-balena-2.84.0
> ### (2021-09-03)
> 
> * balena-engine: Enable storage migration [Robert Günzler]
> 
> <details>
> <summary> Update balena-engine to v19.03.26 [Robert Günzler] </summary>
> 
>> ### balena-engine-19.03.26
>> #### (2021-08-31)
>> 
>> * storagemigration: capture failcleanup logs in logfile [Robert Günzler]
>> 
>> ### balena-engine-19.03.25
>> #### (2021-08-20)
>> 
>> * storagemigration: move logic to package [Robert Günzler]
>> 
> </details>
> 
> 
> ## meta-balena-2.83.22
> ### (2021-09-02)
> 
> * tests: remove healthcheck test race condition [rcooke-warwick]
> 
</details>

# v2.83.21+rev1
## (2021-09-03)


<details>
<summary> Update meta-balena from v2.83.10 to v2.83.21 [Florin Sarbu] </summary>

> ## meta-balena-2.83.21
> ### (2021-09-01)
> 
> * tests: Register teardown only when DUT is reachable [rcooke-warwick]
> 
> ## meta-balena-2.83.20
> ### (2021-09-01)
> 
> * tests: Use new Archiver implementation & helpers [Vipul Gupta (@vipulgupta2048)]
> 
> ## meta-balena-2.83.19
> ### (2021-09-01)
> 
> * tests: List boots when collecting journal logs in hup suite [Kyle Harding]
> 
> ## meta-balena-2.83.18
> ### (2021-08-31)
> 
> 
> <details>
> <summary> balena-supervisor: Update balena-supervisor to v12.10.3 [Kyle Harding] </summary>
> 
>> ### balena-supervisor-12.10.3
>> #### (2021-08-24)
>> 
>> * Skip restarting services if they are part of conf targets [Kyle Harding]
>> 
>> ### balena-supervisor-12.10.2
>> #### (2021-08-02)
>> 
>> * Removed fire emoji prefix for firewall logs. [peakyDicers]
>> 
>> ### balena-supervisor-12.10.1
>> #### (2021-08-02)
>> 
>> * Fix regression with local mode push [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.10.0
>> #### (2021-07-28)
>> 
>> * Remove comparison based on image, release, and service ids [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.9.6
>> #### (2021-07-26)
>> 
>> * Use tags to track supervised images in docker [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.9.5
>> #### (2021-07-22)
>> 
>> * Log the delta URL that will be downloaded on update [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.9.4
>> #### (2021-07-08)
>> 
>> * Fix db-helper module for tests [Felipe Lalanne]
>> 
> </details>
> 
> 
> ## meta-balena-2.83.17
> ### (2021-08-31)
> 
> * Assign a fixed name to the balena-healthcheck container [Kyle Harding]
> 
> ## meta-balena-2.83.16
> ### (2021-08-31)
> 
> * kernel-modules-headers: Copy module.lds [Alex Gonzalez]
> 
> ## meta-balena-2.83.15
> ### (2021-08-30)
> 
> * kernel-balena: remove global blacklist of btrfs [Joseph Kogut]
> 
> ## meta-balena-2.83.14
> ### (2021-08-26)
> 
> * tests: remove reboot requirement from NTP server test [Mark Corbin]
> * recipes-connectivity: fix auto-update when config.json changes [Mark Corbin]
> 
> ## meta-balena-2.83.13
> ### (2021-08-26)
> 
> * networkmanager: fix hostname race condition [Mark Corbin]
> 
> ## meta-balena-2.83.12
> ### (2021-08-25)
> 
> * tests: remove reboot requirement from hostname test [Mark Corbin]
> * hostname: update system hostname when config.json changes [Mark Corbin]
> 
> ## meta-balena-2.83.11
> ### (2021-08-24)
> 
> * linux-firmware: Use wildcards when selecting files to package [Alex Gonzalez]
> * linux-firmware: Add firmware compression support [Alex Gonzalez]
> * kernel-balena: Support firmware compression from kernel version 5.3 [Alex Gonzalez]
> 
</details>

# v2.83.10+rev1
## (2021-08-26)


<details>
<summary> Update meta-balena from v2.82.10 to v2.83.10 [Florin Sarbu] </summary>

> ## meta-balena-2.83.10
> ### (2021-08-18)
> 
> * kernel-balena: Add function to conditionally configure based on version [Alex Gonzalez]
> * kernel-balena: Split function to get kernel version from source [Alex Gonzalez]
> * kernel-resin: Add as symlink to kernel-balena [Alex Gonzalez]
> * kernel-balena: Replace and deprecate kernel-resin [Alex Gonzalez]
> 
> ## meta-balena-2.83.9
> ### (2021-08-17)
> 
> * recipes-connectivity: improve NTP dispatcher script [Mark Corbin]
> 
> ## meta-balena-2.83.8
> ### (2021-08-17)
> 
> 
> <details>
> <summary> Update balena-engine to v19.03.24 [Alex Gonzalez] </summary>
> 
>> ### balena-engine-19.03.24
>> #### (2021-08-12)
>> 
>> * prevent slice oob access in concatReadSeekCloser [Martin Rauscher]
>> 
> </details>
> 
> 
> ## meta-balena-2.83.7
> ### (2021-08-14)
> 
> * grub: don't package or install bindir utils [Joseph Kogut]
> 
> ## meta-balena-2.83.6
> ### (2021-08-13)
> 
> * balena-os-sysctl: disable user namespacing by default [Joseph Kogut]
> * common: kernel-resin: enable user namespacing [Joseph Kogut]
> 
> ## meta-balena-2.83.5
> ### (2021-08-13)
> 
> * resin-u-boot.bbclass: Make console silencing change more resilient [Florin Sarbu]
> 
> ## meta-balena-2.83.4
> ### (2021-08-11)
> 
> * balena-os: pin linux-firmware to 20210511 from hardknott [Joseph Kogut]
> * linux-firmware: upgrade 20190815 -> 20210511 [Joseph Kogut]
> 
> ## meta-balena-2.83.3
> ### (2021-08-05)
> 
> * supervisor: Consolidate supervisor container removal [Kyle Harding]
> 
> ## meta-balena-2.83.2
> ### (2021-08-05)
> 
> * tests: Fix insecure registry error [Robert Günzler]
> 
> ## meta-balena-2.83.1
> ### (2021-07-31)
> 
> * linux-firmware: package i915 generations separately [Joseph Kogut]
> 
> ## meta-balena-2.83.0
> ### (2021-07-29)
> 
> * Add support for rootfs on MD RAID1 [Michal Toman]
> 
> ## meta-balena-2.82.13
> ### (2021-07-29)
> 
> * tests: Symlink /dev/null instead of copying bash to break services [Michal Toman]
> 
> ## meta-balena-2.82.12
> ### (2021-07-24)
> 
> * common: grub: don't install sbin utils [Joseph Kogut]
> 
> ## meta-balena-2.82.11
> ### (2021-07-21)
> 
> * tests: Remove journalctl line limit from hup suite [Kyle Harding]
> * tests: Enable rollback tests in hup suite [Kyle Harding]
> * tests: Update smoke test conditions [Kyle Harding]
> * tests: Add rollback tests to HUP suite [Kyle Harding]
> * rollback-altboot: Fix minor typo in log message [Kyle Harding]
> 
</details>

* Fix device tree overlay loading on 64 bits architectures [Florin Sarbu]

# v2.82.10+rev3
## (2021-08-24)


<details>
<summary> Update balena-yocto-scripts from v1.14.8 to v1.14.9 [Alex Gonzalez] </summary>

> ## balena-yocto-scripts-1.14.9
> ### (2021-08-20)
> 
> * balena-deploy: When deploying hostapp default to using slug as name [Alex Gonzalez]
> * balena-api: Do not use balena_lib_resolve_aliases [Alex Gonzalez]
> * balena_lib: Make resolve_aliases local so it is not globally used [Alex Gonzalez]
> 
</details>

# v2.82.10+rev2
## (2021-07-22)


<details>
<summary> Update balena-yocto-scripts from v1.14.7 to v1.14.8 [Kyle Harding] </summary>

> ## balena-yocto-scripts-1.14.8
> ### (2021-07-22)
> 
> * Use slug when setting deviceType for leviathan [Kyle Harding]
> 
</details>

# v2.82.10+rev1
## (2021-07-21)


<details>
<summary> Update meta-balena from v2.81.1 to v2.82.10 [Florin Sarbu] </summary>

> ## meta-balena-2.82.10
> ### (2021-07-20)
> 
> * tests: Remove reboot requirement from dnsmasq tests [Kyle Harding]
> 
> ## meta-balena-2.82.9
> ### (2021-07-16)
> 
> * patch: Make OS test suite compatible with current helpers [Vipul Gupta (@vipulgupta2048)]
> 
> ## meta-balena-2.82.8
> ### (2021-07-16)
> 
> * kernel-devsrc: Add upstream recipe from hardknott-3.3.1 for dunfell [Florin Sarbu]
> 
> ## meta-balena-2.82.7
> ### (2021-07-15)
> 
> 
> <details>
> <summary> Update balena-engine to v19.03.23 [Leandro Motta Barros] </summary>
> 
>> ### balena-engine-19.03.23
>> #### (2021-07-12)
>> 
>> * Make layer download resuming more resilient [Leandro Motta Barros]
>> 
>> ### balena-engine-19.03.22
>> #### (2021-06-30)
>> 
>> * Drop CODEOWNERS [Robert Günzler]
>> 
>> ### balena-engine-19.03.21
>> #### (2021-06-25)
>> 
>> * Lock destination layers while delta is being processed [Robert Günzler]
>> 
>> ### balena-engine-19.03.20
>> #### (2021-06-17)
>> 
>> * pkg/storagemigration: poperly handle errors during state creation [Robert Günzler]
>> 
>> ### balena-engine-19.03.19
>> #### (2021-06-10)
>> 
>> * pkg/storagemigration: allow writing logs to separate file [Robert Günzler]
>> * storagemigration: defer commit to next start [Robert Günzler]
>> 
> </details>
> 
> 
> ## meta-balena-2.82.6
> ### (2021-07-15)
> 
> * dnsmasq: Restart when config.json changes [Kyle Harding]
> * balena-config-vars: Restart target when config.json changes [Kyle Harding]
> * balena-config-vars: Add config-json.target service [Kyle Harding]
> * balena-config-vars: Restore null as valid for dnsServers [Kyle Harding]
> 
> ## meta-balena-2.82.5
> ### (2021-07-15)
> 
> * kernel-headers-test: Update base image to buster [Florin Sarbu]
> 
> ## meta-balena-2.82.4
> ### (2021-07-14)
> 
> * tests: Add hup test suite [Robert Günzler]
> 
> ## meta-balena-2.82.3
> ### (2021-07-13)
> 
> * Check that the hostapp image fits the inactive partion on HUP [Alex Gonzalez]
> * image-balena: Add check for docker image size [Alex Gonzalez]
> * balena-image: Break down the rootfs image size calculation [Alex Gonzalez]
> * image_types_balena: Add rootfs size calculation function [Alex Gonzalez]
> 
> ## meta-balena-2.82.2
> ### (2021-07-13)
> 
> * Update balena-supervisor from v12.8.8 to v12.9.3 [Miguel Casqueira]
> 
> ## meta-balena-2.82.1
> ### (2021-07-12)
> 
> * balena-hostname: add comments and improve logging [Mark Corbin]
> * meta-balena: rename resin-hostname to balena-hostname [Mark Corbin]
> 
> ## meta-balena-2.82.0
> ### (2021-07-10)
> 
> * networkmanager: Rename references to resin [Kyle Harding]
> * resin-proxy-config: Rename to balena-proxy-config [Kyle Harding]
> * resin-ntp-config: Rename to balena-ntp-config [Kyle Harding]
> * resin-net-config: Rename to balena-net-config [Kyle Harding]
> 
</details>

* Update unipi-kernel-modules to version 1.68 [Florin Sarbu]
* Update rpi firmware to version 20210421 [Florin Sarbu]
* Update kernel to version 5.10.31 [Florin Sarbu]

# v2.81.1+rev2
## (2021-07-20)

* Remove obsolete bluez5 patches and settings that are now included in bluez v5.58 from meta-balena [Zahari Petkov]

# v2.81.1+rev1
## (2021-07-19)


<details>
<summary> Update meta-balena from v2.80.8 to v2.81.1 [Alex Gonzalez] </summary>

> ## meta-balena-2.81.1
> ### (2021-07-09)
> 
> * balena-engine: Restore previous systemd service settings [Kyle Harding]
> 
> ## meta-balena-2.81.0
> ### (2021-07-06)
> 
> * recipes-core: add a 'network connectivity wait' service [Mark Corbin]
> 
> ## meta-balena-2.80.12
> ### (2021-07-05)
> 
> * Remove CODEOWNERS [Michal Toman]
> 
> ## meta-balena-2.80.11
> ### (2021-07-01)
> 
> * get journal logs at the end of the suite [rcooke-warwick]
> 
> ## meta-balena-2.80.10
> ### (2021-06-24)
> 
> * hostapp-update-hooks: Migrate supervisor database [Kyle Harding]
> * hostapp-update-hooks: Revert sv database path used by previous hooks [Kyle Harding]
> 
> ## meta-balena-2.80.9
> ### (2021-06-21)
> 
> * balena-engine: refactor systemd service [Robert Günzler]
> 
</details>

# v2.80.8+rev4
## (2021-07-08)

* Update poky to dunfell-23.0.6 [Florin Sarbu]

# v2.80.8+rev3
## (2021-07-06)

* Remove the 4.19 kernel recipe and delete unused patches [Florin Sarbu]

# v2.80.8+rev2
## (2021-06-29)


<details>
<summary> Update balena-yocto-scripts from v1.14.6 to v1.14.7 [Kyle Harding] </summary>

> ## balena-yocto-scripts-1.14.7
> ### (2021-06-29)
> 
> * balena-lib: Fix print statements helper functions [Kyle Harding]
> * balena-lib: Fix device dir when running in Jenkins containers [Kyle Harding]
> 
</details>

# v2.80.8+rev1
## (2021-06-21)


<details>
<summary> Update meta-balena from v2.80.5 to v2.80.8 [Florin Sarbu] </summary>

> ## meta-balena-2.80.8
> ### (2021-06-21)
> 
> * Update balena-supervisor from v12.8.7 to v12.8.8 [Florin Sarbu]
> 
> ## meta-balena-2.80.7
> ### (2021-06-18)
> 
> * prevent failed teardown from making test hang [rcooke-warwick]
> 
> ## meta-balena-2.80.6
> ### (2021-06-17)
> 
> * catch error if image path is corrupted [rcooke-warwick]
> 
</details>


<details>
<summary> Update balena-yocto-scripts from v1.11.0 to v1.14.6 [Florin Sarbu] </summary>

> ## balena-yocto-scripts-1.14.6
> ### (2021-06-18)
> 
> * balena-deploy: Flag hostapps as bootable apps [Alex Gonzalez]
> * balena-deploy: Provide working directory when deploying hostapp [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.14.5
> ### (2021-06-18)
> 
> * balena-deploy-block: Do not add variant suffix to release tag [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.14.4
> ### (2021-06-16)
> 
> * Dockerfile_balena-push-env: Add balena-lib to image [Alex Gonzalez]
> * balena-deploy-block: source balena-lib script library [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.14.3
> ### (2021-06-01)
> 
> * balena-api: Filter out debug output [Alex Gonzalez]
> * balena-api: Specify API environment and token when setting app roles [Alex Gonzalez]
> * jenkins_build-blocks: Separate recipes and packages [Alex Gonzalez]
> * balena-lib: Generalize contract fetcher [Alex Gonzalez]
> * balena-deploy: Shorten installation directory '/yocto/resin-board' to '/work' [Alex Gonzalez]
> * Conditional verbosity mode [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.14.2
> ### (2021-05-26)
> 
> * balena-lib: Add function to fetch labels from image [Alex Gonzalez]
> * balena-lib: contracts: Add package list fetcher [Alex Gonzalez]
> * semver: Add bash utility for semantic version comparison [Alex Gonzalez]
> * balena-docker: Add image retrieval function [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.14.1
> ### (2021-05-24)
> 
> * Add a parsable representation of the changelog [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.14.0
> ### (2021-05-21)
> 
> * Dockerfile_yocto-block-build-env: Add container to build Yocto based hostOS blocks [Alex Gonzalez]
> * balena-build-block: Balena build and deploy a hostOS block image [Alex Gonzalez]
> * jenkins_build-blocks: Add package blocks builder script [Alex Gonzalez]
> * balena-deploy: Add functions to deploy block, feed and OS release [Alex Gonzalez]
> * README: Add brief introduction to the main scripts [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.13.0
> ### (2021-05-19)
> 
> * barys: Replace supervisor tag with supervisor release version [Alex Gonzalez]
> * jenkins_build: Replace supervisor tag with supervisor release [Alex Gonzalez]
> * jenkins_build: Rename metaResinBranch to metaBalenaBranch [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.16
> ### (2021-05-18)
> 
> * tests: Substitute deviceType with MACHINE when packaging tests [Kyle Harding]
> 
> ## balena-yocto-scripts-1.12.15
> ### (2021-05-18)
> 
> * Dockerfile_yocto-build-env: Specify docker version [Alex Gonzalez]
> * balena-docker: Allow to control iptables and ipmasq flags [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.14
> ### (2021-05-17)
> 
> * balena-api: Set default argument value not to exist on nounset setting [Alex Gonzalez]
> * balena-api: Allow access to OS developers to public apps [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.13
> ### (2021-05-14)
> 
> * balena-api: Add functions for apps management [Alex Gonzalez]
> * balena-api: Add block images getter functions [Alex Gonzalez]
> * balena-api: Add missing argument to function comments [Alex Gonzalez]
> * balena-deploy-block: Create public app if required [Alex Gonzalez]
> * balena-lib: Fix device installation path when running in helper container [Alex Gonzalez]
> * balena-deploy: Fix device installation path when running in helper container [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.12
> ### (2021-05-12)
> 
> * balena-docker: Adapt to be used from POSIX shell [Alex Gonzalez]
> * balena-docker: Generalize functions to any engine [Alex Gonzalez]
> * balena-build: Re-enable the container's output [Alex Gonzalez]
> * balena-build: Add option to keep local containers [Alex Gonzalez]
> * yocto-build-env: Update Dockerfile to add host tools dependencies [Alex Gonzalez]
> * Shorten installation directory '/yocto/resin-board' to '/work' [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.11
> ### (2021-05-11)
> 
> * Substitute device type in config.js if present [Kyle Harding]
> 
> ## balena-yocto-scripts-1.12.10
> ### (2021-04-28)
> 
> * balena-build: print submodule status [Alex Gonzalez]
> * balena-build: Correctly pass development images flag and amend usage [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.9
> ### (2021-04-22)
> 
> * balena-build: Pass the API environment to the build container [Alex Gonzalez]
> * balena-lib: Add function to resolve between contract slugs and Yocto machines [Alex Gonzalez]
> * balena-build: Do not exit if no SSH_AUTH_SOCK defined [Alex Gonzalez]
> * balena-build: Fix indentation [Alex Gonzalez]
> * balena-build: Cleanup build containers and enable build output [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.8
> ### (2021-04-15)
> 
> * balena-build: Fix development image build [Alex Gonzalez]
> * jenkins_build-containers: Use a fixed length for the git short revision [Alex Gonzalez]
> * balena-lib: Do not err when sourcing without a repository [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.7
> ### (2021-04-12)
> 
> * balena-api: Improve logs when setting version [Alex Gonzalez]
> * balena-docker: Make it less verbose [Alex Gonzalez]
> * balena-deploy: Set the OS version before setting deploy directory [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.6
> ### (2021-03-30)
> 
> * include: Move include files and entry scripts into its own folder [Alex Gonzalez]
> * balena-build.sh: Move into build script [Alex Gonzalez]
> * balena-lib: Set default namespace if not defined [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.5
> ### (2021-03-30)
> 
> * balena-deploy: Shellcheck warnings [Alex Gonzalez]
> * balena-deploy-block: Adjust variables for common use [Alex Gonzalez]
> * balena-deploy-block: Fix shellcheck warnings [Alex Gonzalez]
> * balena-deploy: Adjust balena_deploy_hostapp to new balena_deploy_block entrypoint arguments [Alex Gonzalez]
> * balena-deploy.inc: Pass API environment to balena_lib_token [Alex Gonzalez]
> * balena-build: Pass an API environment to balena_lib_token [Alex Gonzalez]
> * balena-lib: Pass API environment to balena_lib_token [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.4
> ### (2021-03-29)
> 
> * balena-api: Add is_dt_private function [Alex Gonzalez]
> * balena-lib: Add several function to extract device details from device type JSON file [Alex Gonzalez]
> * balena-lib: By default only login to BaleneCloud if not token is found [Alex Gonzalez]
> * balena_deploy: Add functions to deploy Jenkins artifacts to S3 and dockerhub [Alex Gonzalez]
> * balena-deploy: Fix indentation and shellcheck warnings [Alex Gonzalez]
> * jenkins_build: Call out to script libraries functions [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.3
> ### (2021-03-26)
> 
> * balena-lib: Fix indentation to tabs [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.2
> ### (2021-03-26)
> 
> * balena-docker: Remove execution trace flag [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.1
> ### (2021-03-25)
> 
> * balena-lib: Add commonly used utility functions [Alex Gonzalez]
> * jenkins_build-containers: Allow docker login for local development [Alex Gonzalez]
> * barys: Add bitbake-args argument and make bitbake-target accept multiple arguments [Alex Gonzalez]
> * jenkins_build: Separate deploy functions [Alex Gonzalez]
> * jenkins_build: Refactor balena_lib_get_os_version [Alex Gonzalez]
> * balena-api: Add script library with API calls [Alex Gonzalez]
> * balena-push-os-version: Rename to balena-deploy-block and set the release version on deploy [Alex Gonzalez]
> * Dockerfile_balena-push-env: Refactor to use balena-deploy-block [Alex Gonzalez]
> * balena-build: Split build related functions [Alex Gonzalez]
> * jenkins_build: Separate barys build functions [Alex Gonzalez]
> * balena-deploy: Add script library for deploy logic [Alex Gonzalez]
> * jenkins_build: Use balena_deploy_hostapp from balena-deploy [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.12.0
> ### (2021-03-25)
> 
> * barys: Improve template layer matching [Kyle Harding]
> 
> ## balena-yocto-scripts-1.11.2
> ### (2021-03-22)
> 
> * jenkins_build-container: Do not overwrite environment DOCKERFILES variable if provided [Alex Gonzalez]
> * balena-lib: Rename to balena-lib.inc [Alex Gonzalez]
> * balena-lib: Rename functions with the balena_lib prefix [Alex Gonzalez]
> * jenkins_build: Use balena-lib.inc instead of balena-inc.sh [Alex Gonzalez]
> 
> ## balena-yocto-scripts-1.11.1
> ### (2021-03-22)
> 
> * balena-docker: Rename manage-docker to balena-docker [Alex Gonzalez]
> * balena-push-os-version: Refactor to use balena-docker [Alex Gonzalez]
> * prepare-and-start: Refactor to use balena-lib [Alex Gonzalez]
> * Dockerfile_yocto_build-env: Refactor to update dockerd and use balena-docker [Alex Gonzalez]
> * Dockerfile_balena-push-env: Refactor to use balena-docker [Alex Gonzalez]
> 
</details>

# v2.80.5+rev2
## (2021-06-21)

* Add balena-yocto-scripts upstream source [Alex Gonzalez]

# v2.80.5+rev1
## (2021-06-18)


<details>
<summary> Update meta-balena from v2.80.3 to v2.80.5 [Alexandru Costache] </summary>

> ## meta-balena-2.80.5
> ### (2021-06-17)
> 
> * update-balena-supervisor: Improve obtaining the supervisor directory name [Alexandru Costache]
> * Update balena-supervisor from v12.7.0 to v12.8.7 [Miguel Casqueira]
> 
> ## meta-balena-2.80.4
> ### (2021-06-14)
> 
> * kernel-headers-test: simplify example module Makefile [Joseph Kogut]
> 
</details>

# v2.80.3+rev1
## (2021-06-11)


<details>
<summary> Update meta-balena from v2.80.2 to v2.80.3 [Alexandru Costache] </summary>

> ## meta-balena-2.80.3
> ### (2021-06-10)
> 
> * Add oneshot service to migrate supervisor state config [Kyle Harding]
> 
</details>

# v2.80.2+rev1
## (2021-06-10)


<details>
<summary> Update meta-balena from v2.80.0 to v2.80.2 [Alexandru Costache] </summary>

> ## meta-balena-2.80.2
> ### (2021-06-09)
> 
> * update-balena-supervisor: Refactor script to ensure target version is ran [Alexandru Costache]
> 
> ## meta-balena-2.80.1
> ### (2021-06-07)
> 
> * bluez5: Disable PnP Device Information service [Zahari Petkov]
> 
</details>

# v2.80.0+rev1
## (2021-06-08)


<details>
<summary> Update meta-balena from v2.79.7 to v2.80.0 [Alexandru Costache] </summary>

> ## meta-balena-2.80.0
> ### (2021-06-07)
> 
> * Revert Go 1.16 recipes [Joseph Kogut]
> 
> ## meta-balena-2.79.10
> ### (2021-06-03)
> 
> * supervisor: Remove symlink to legacy resin sysconfig [Kyle Harding]
> * hostapp-update-hooks: Migrate resin-supervisor to balena-supervisor [Kyle Harding]
> * supervisor: Remove legacy resin supervisor container [Kyle Harding]
> 
> ## meta-balena-2.79.9
> ### (2021-06-03)
> 
> * hostapp-update-hooks: Sync to disk when hook is done [Alex Gonzalez]
> * extract-balena-ca: Sync changes to disk in case of power loss [Alex Gonzalez]
> * resin-net-config: Make sure to sync changes to disk in case of power loss [Alex Gonzalez]
> 
> ## meta-balena-2.79.8
> ### (2021-06-02)
> 
> * bluez: Set policy configuration to AutoEnable [Alex Gonzalez]
> * bluez5: Replace executable path directory in unit file [Alex Gonzalez]
> 
</details>

# v2.79.7+rev1
## (2021-06-02)


<details>
<summary> Update meta-balena from v2.78.0 to v2.79.7 [Mark Corbin] </summary>

> ## meta-balena-2.79.7
> ### (2021-05-26)
> 
> * meta-balena: rename connectivity packagegroup [Mark Corbin]
> 
> ## meta-balena-2.79.6
> ### (2021-05-26)
> 
> * bluez5: Use bluez5 recipe from poky master [Zahari Petkov]
> 
> ## meta-balena-2.79.5
> ### (2021-05-21)
> 
> * README: Update supported Yocto versions [Alex Gonzalez]
> 
> ## meta-balena-2.79.4
> ### (2021-05-21)
> 
> * Skip some services when running under docker [Robert Günzler]
> 
> ## meta-balena-2.79.3
> ### (2021-05-20)
> 
> * kernel-resin: disable panic on hung task [Joseph Kogut]
> 
> ## meta-balena-2.79.2
> ### (2021-05-19)
> 
> * Add boot-splash test to unmanaged suite [rcooke-warwick]
> 
> ## meta-balena-2.79.1
> ### (2021-05-18)
> 
> * balena-os: Add preferred provider for Go native [Alex Gonzalez]
> 
> ## meta-balena-2.79.0
> ### (2021-05-13)
> 
> * balena-engine: build in GOPATH mode [Joseph Kogut]
> * recipes-devtools: go: backport get_linuxloader [Joseph Kogut]
> * meta-resin-pyro: go-native: include fix-goarch.inc [Joseph Kogut]
> * meta-balena-common: upgrade from go 1.12.17 to 1.16.2 [Joseph Kogut]
> 
> ## meta-balena-2.78.2
> ### (2021-05-13)
> 
> * balena-config-vars: improve handling of NM config parameters [Mark Corbin]
> 
> ## meta-balena-2.78.1
> ### (2021-05-12)
> 
> * Add Device Tree tests [Vipul Gupta (@vipulgupta2048)]
> 
</details>

* balena-raspberrypi: rename connectivity packagegroup [Mark Corbin]

# v2.78.0+rev2
## (2021-05-20)

* Add bcm2711-rpi-400.dtb and bcm2711-rpi-cm4.dtb for the raspberrypi4-64 machine [Florin Sarbu]

# v2.78.0+rev1
## (2021-05-11)

* Rename resin-supervisor to balena-supervisor [Kyle Harding]

<details>
<summary> Update meta-balena from v2.77.0 to v2.78.0 [Kyle Harding] </summary>

> ## meta-balena-2.78.0
> ### (2021-05-10)
> 
> * Add symlinks and aliases for legacy resin namespaces [Kyle Harding]
> * Rename resin-supervisor to balena-supervisor [Kyle Harding]
> 
> ## meta-balena-2.77.2
> ### (2021-05-10)
> 
> 
> <details>
> <summary> Update balena-supservisor from v12.5.10 to v12.7.0 [Kyle Harding] </summary>
> 
>> ### balena-supervisor-12.7.0
>> #### (2021-05-07)
>> 
>> * Backwards compatility changes for old resin namespaces [Kyle Harding]
>> * Change container name to balena_supervisor [Kyle Harding]
>> * Rename resin-supervisor to balena-supervisor [Kyle Harding]
>> 
>> ### balena-supervisor-12.6.8
>> #### (2021-05-06)
>> 
>> * Show warning instead of exception for invalid network config [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.6.7
>> #### (2021-05-06)
>> 
>> * Patch awaiting response when checking if supervisor0 network exists [Miguel Casqueira]
>> 
>> ### balena-supervisor-12.6.6
>> #### (2021-05-06)
>> 
>> * Fix parsing driver_opts from compose to docker network creation [quentinGllmt]
>> 
>> ### balena-supervisor-12.6.5
>> #### (2021-05-06)
>> 
>> 
>> <details>
>> <summary> Update balena-register-device and send extra info at provision time [Pagan Gazzard] </summary>
>> 
>>> #### balena-register-device-7.2.0
>>> ##### (2021-04-29)
>>> 
>>> * Support `supervisorVersion`/`osVersion`/`osVariant`/`macAddress` fields [Pagan Gazzard]
>>> 
>>> #### balena-register-device-7.1.1
>>> ##### (2021-04-29)
>>> 
>>> * Update dependencies [Pagan Gazzard]
>>> 
>>> #### balena-register-device-7.1.0
>>> ##### (2020-07-13)
>>> 
>>> * Switch from randomstring to uuid for generating device uuids [Pagan Gazzard]
>>> 
>>> #### balena-register-device-7.0.1
>>> ##### (2020-07-13)
>>> 
>>> * Add .versionbot/CHANGELOG.yml for nested changelogs [Pagan Gazzard]
>>> 
>>> #### balena-register-device-7.0.0
>>> ##### (2020-07-06)
>>> 
>>> * Convert to type checked javascript [Pagan Gazzard]
>>> * Drop callback interface in favor of promise interface [Pagan Gazzard]
>>> * Switch to a named export [Pagan Gazzard]
>>> * Convert to typescript [Pagan Gazzard]
>>> * Update to typed-error 3.x [Pagan Gazzard]
>>> * Switch to returning native promises [Pagan Gazzard]
>>> * Update to balena-request 11.x [Pagan Gazzard]
>>> * Use typescript import helpers [Pagan Gazzard]
>>> 
>> </details>
>> 
>> 
>> ### balena-supervisor-12.6.4
>> #### (2021-05-05)
>> 
>> * Log error responses from API when reporting state [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.6.3
>> #### (2021-05-04)
>> 
>> * Added configurations.md to document all configurable vars [Miguel Casqueira]
>> 
>> ### balena-supervisor-12.6.2
>> #### (2021-04-30)
>> 
>> * Remove version tag from livepush generated image [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.6.1
>> #### (2021-04-27)
>> 
>> * Remove mz, mkdirp, body-parser dependencies [Christina Wang]
>> 
>> ### balena-supervisor-12.6.0
>> #### (2021-04-27)
>> 
>> * Bump dockerode types to 2.5.34 [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.5.16
>> #### (2021-04-27)
>> 
>> * Enable docker layer caching on CircleCI [Miguel Casqueira]
>> 
>> ### balena-supervisor-12.5.15
>> #### (2021-04-26)
>> 
>> * Added clean step to remove previous builds before running tests [Miguel Casqueira]
>> 
>> ### balena-supervisor-12.5.14
>> #### (2021-04-26)
>> 
>> * balena-supervisor: replace references to resin-vars [Mark Corbin]
>> 
>> ### balena-supervisor-12.5.13
>> #### (2021-04-25)
>> 
>> * Update supervisor to typescript 4 [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.5.12
>> #### (2021-04-20)
>> 
>> * Bump ssri from 6.0.1 to 6.0.2 [dependabot[bot]]
>> 
>> ### balena-supervisor-12.5.11
>> #### (2021-04-14)
>> 
>> * Refactor extra_uEnv to not match with intel nuc [Miguel Casqueira]
>> 
> </details>
> 
> 
> ## meta-balena-2.77.1
> ### (2021-05-10)
> 
> * Update os-config from v1.2.0 to v1.2.1 [Kyle Harding]
> 
</details>

# v2.77.0+rev1
## (2021-05-10)

* Switch revpi-connect from community to officialy supported [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.75.0 to v2.77.0 [Florin Sarbu] </summary>

> ## meta-balena-2.77.0
> ### (2021-05-05)
> 
> * grub update hook: move variables from grub.cfg to grubenv [Michal Toman]
> 
> ## meta-balena-2.76.0
> ### (2021-04-30)
> 
> * kernel: Always include overlayfs support [Robert Günzler]
> 
> ## meta-balena-2.75.1
> ### (2021-04-29)
> 
> * grub: grub-efi: buildin gzio for gz compressed kernels [Joseph Kogut]
> 
</details>

# v2.75.0+rev5
## (2021-05-05)

* Rework unipi-tools package for raspberrypi3-unipi-neuron [Florin Sarbu]
* Add required dtoverlays to config.txt for raspberrypi3-unipi-neuron [Florin Sarbu]

# v2.75.0+rev4
## (2021-04-30)

* Add mcp251xfd overlay to rootfs [Florin Sarbu]

# v2.75.0+rev3
## (2021-04-29)

* Fix unipi-tools binaries installation [Florin Sarbu]

# v2.75.0+rev2
## (2021-04-29)

* Transition to NXP GPL balenaFin sd8887 driver distribution [Zahari Petkov]

# v2.75.0+rev1
## (2021-04-28)


<details>
<summary> Update meta-balena from v2.73.15 to v2.75.0 [Florin Sarbu] </summary>

> ## meta-balena-2.75.0
> ### (2021-04-22)
> 
> * Update mobynit to the new multi-container hostOS specification [Alex Gonzalez]
> 
> ## meta-balena-2.74.0
> ### (2021-04-20)
> 
> * balena-engine: Update to 19.03.18 [Robert Günzler]
> 
</details>

# v2.73.15+rev1
## (2021-04-26)


<details>
<summary> Update meta-balena from v2.73.12 to v2.73.15 [Alex Gonzalez] </summary>

> ## meta-balena-2.73.15
> ### (2021-04-20)
> 
> * modemmanager:u-blox-switch: Rework the u-blox modem switch to ECM mode [Florin Sarbu]
> 
> ## meta-balena-2.73.14
> ### (2021-04-19)
> 
> * device-progress: do not force an exit code [Matthew McGinn]
> 
> ## meta-balena-2.73.13
> ### (2021-04-19)
> 
> * add retries to status check [rcooke-warwick]
> 
</details>

# v2.73.12+rev5
## (2021-04-21)

* Fix typo in raspberrypi3-unipi-neuron.coffee file [Florin Sarbu]

# v2.73.12+rev4
## (2021-04-21)

* Rename unipi-neuron to raspberrypi3-unipi-neuron [Florin Sarbu]

# v2.73.12+rev3
## (2021-04-20)

* conf/layer: Add 2xmcp2517fd dtbo to overlays [Andrew Koroluk]
* bluez-firmware-rpidistro: Update to latest revision [Alexandru Costache]

# v2.73.12+rev2
## (2021-04-20)

* Add support for UniPi Neuron boards [Florin Sarbu]

# v2.73.12+rev1
## (2021-04-16)


<details>
<summary> Update meta-balena from v2.73.1 to v2.73.12 [Mark Corbin] </summary>

> ## meta-balena-2.73.12
> ### (2021-04-16)
> 
> * meta-balena: rename resin-vars to balena-config-vars [Mark Corbin]
> 
> ## meta-balena-2.73.11
> ### (2021-04-16)
> 
> * patch: Add strict bootcount count condition [Vipul Gupta (@vipulgupta2048)]
> * patch: Reactivate Persistent Logging test [Vipul Gupta (@vipulgupta2048)]
> 
> ## meta-balena-2.73.10
> ### (2021-04-14)
> 
> * repo.yml: Move balena-supervisor reference to balena-os [Alex Gonzalez]
> 
> ## meta-balena-2.73.9
> ### (2021-04-14)
> 
> * Update balena-supervisor from v12.5.6 to v12.5.10 [Christina Wang]
> 
> ## meta-balena-2.73.8
> ### (2021-04-13)
> 
> * resin-mounts/etc-fake-hwclock: add dependency on resin-state services [Mark Corbin]
> 
> ## meta-balena-2.73.7
> ### (2021-04-13)
> 
> * fix udev test indentation [rcooke-warwick]
> * Added comments for easier debugging [rcooke-warwick]
> * Fix old tests + add new tests based on testlodge [rcooke-warwick]
> 
> ## meta-balena-2.73.6
> ### (2021-04-12)
> 
> * Add automated test checking for udev/resin_update_state_probe warnings [Michal Toman]
> * udev: Silence warnings from resin_update_state_probe [Michal Toman]
> 
> ## meta-balena-2.73.5
> ### (2021-04-06)
> 
> * Update balena-supervisor from v12.4.6 to v12.5.6 [Christina Wang]
> 
> ## meta-balena-2.73.4
> ### (2021-03-20)
> 
> * Add to persistent logging defn [Andrew Nhem]
> 
> ## meta-balena-2.73.3
> ### (2021-03-19)
> 
> * wifi: remove listed example as it's discontinued [Tomás Migone]
> 
> ## meta-balena-2.73.2
> ### (2021-03-17)
> 
> * hostapp-update: convert absolute symlinks to relative [Joseph Kogut]
> 
</details>

* balena-raspberrypi: replace references to resin-vars [Mark Corbin]

# v2.73.1+rev1
## (2021-03-16)


<details>
<summary> Update meta-balena from v2.72.0 to v2.73.1 [Florin Sarbu] </summary>

> ## meta-balena-2.73.1
> ### (2021-03-16)
> 
> * Update balena-supervisor from v12.3.5 to v12.4.6 [Felipe Lalanne]
> 
> ## meta-balena-2.73.0
> ### (2021-03-15)
> 
> * image_types_balena: make rootfs labeling generic [Joseph Kogut]
> * image_types_balena: make agnostic to root fstype [Joseph Kogut]
> * mkfs-hostapp-native: make agnostic to fstype [Joseph Kogut]
> 
> ## meta-balena-2.72.2
> ### (2021-03-15)
> 
> * balena: dissolve healthcheck-image-load into healthcheck script [Robert Günzler]
> 
> ## meta-balena-2.72.1
> ### (2021-03-11)
> 
> * Fix disablement of userspace firmware loading requests [Pelle van Gils]
> 
</details>

# v2.72.0+rev1
## (2021-03-11)

* Rename resin image types to balena [Kyle Harding]

<details>
<summary> Update meta-balena from v2.71.5 to v2.72.0 [Kyle Harding] </summary>

> ## meta-balena-2.72.0
> ### (2021-03-10)
> 
> 
> <details>
> <summary> os-config: Update os-config from v1.1.4 to v1.2.0 [Kyle Harding] </summary>
> 
>> ### os-config-1.2.0
>> #### (2021-02-23)
>> 
>> * os-config: rename flasher flag path [Kyle Harding]
>> 
> </details>
> 
> * Rename resin image types to balena [Kyle Harding]
> 
> ## meta-balena-2.71.7
> ### (2021-03-08)
> 
> * Apply aufs patches if aufs is present in kernel config [Kyle Harding]
> 
> ## meta-balena-2.71.6
> ### (2021-03-05)
> 
> * grub-efi: build required modules into grub image [Joseph Kogut]
> 
</details>

* Update balena-yocto-scripts from v1.10.3 to v1.11.0 [Kyle Harding]

# v2.71.5+rev1
## (2021-03-11)


<details>
<summary> Update meta-balena from v2.71.3 to v2.71.5 [Florin Sarbu] </summary>

> ## meta-balena-2.71.5
> ### (2021-03-03)
> 
> * initrdscripts: always use by-uuid symlink looking for flasher rootfs [Michal Toman]
> 
> ## meta-balena-2.71.4
> ### (2021-03-01)
> 
> * Update OS test suite [Vipul Gupta (@vipulgupta2048)]
> 
</details>

# v2.71.3+rev8
## (2021-03-10)

* Add dts overlays for UniPi devices [Florin Sarbu]

# v2.71.3+rev7
## (2021-03-10)

* bluez: Disable Bluez GATT service for NebraHNT [Ryan Walmsley]

# v2.71.3+rev6
## (2021-03-09)

* u-boot: Include pl01 patch for Pi4 [Alexandru Costache]

# v2.71.3+rev5
## (2021-03-08)

* bluez5: Add pending patches for testing on Nebra HNT [Alexandru Costache]

# v2.71.3+rev4
## (2021-03-08)

* raspberrypicm4-ioboard: Add CM4 IO Board coffee file [Alexandru Costache]

# v2.71.3+rev3
## (2021-03-02)

* conf/samples: Switch HNT device to overlay2 [Alexandru Costache]

# v2.71.3+rev2
## (2021-03-01)

* Update balena-yocto-scripts to v1.10.3 [Kyle Harding]

# v2.71.3+rev1
## (2021-02-27)


<details>
<summary> Update meta-balena from v2.71.2 to v2.71.3 [Florin Sarbu] </summary>

> ## meta-balena-2.71.3
> ### (2021-02-26)
> 
> * balena: Make the healthcheck loading service part of balena.service [Robert Günzler]
> 
</details>

# v2.71.2+rev1
## (2021-02-26)


<details>
<summary> Update meta-balena from v2.71.1 to v2.71.2 [Florin Sarbu] </summary>

> ## meta-balena-2.71.2
> ### (2021-02-23)
> 
> * dnsmasq: enable dbus support [Kyle Harding]
> * dnsmasq: update to 2.84 with dnspooq fix [Kyle Harding]
> 
</details>

* Update balena-yocto-scripts to v1.10.1 [Florin Sarbu]

# v2.71.1+rev1
## (2021-02-25)


<details>
<summary> Update meta-balena from v2.69.1 to v2.71.1 [Florin Sarbu] </summary>

> ## meta-balena-2.71.1
> ### (2021-02-23)
> 
> * recipes-bsp: grub: install only release modules [Joseph Kogut]
> 
> ## meta-balena-2.71.0
> ### (2021-02-15)
> 
> * meta-balena-common: add grub-efi support [Joseph Kogut]
> 
> ## meta-balena-2.70.2
> ### (2021-02-12)
> 
> * Update PR template to specify test coverage in more detail [Alex Gonzalez]
> * Update codeowners [Alex Gonzalez]
> 
> ## meta-balena-2.70.1
> ### (2021-02-11)
> 
> * Add leviathan automated OS test suite [Vipul Gupta (@vipulgupta2048)]
> 
> ## meta-balena-2.70.0
> ### (2021-02-11)
> 
> * systemd/timeinit: use systemd mount unit for /etc/fake-hwclock [Mark Corbin]
> 
</details>

# v2.69.1+rev4
## (2021-02-23)

* Update balena-yocto-scripts to v1.9.4 [Kyle Harding]

# v2.69.1+rev3
## (2021-02-18)

* meta-balena-raspberrypi/linux: fix ethernet cable detection [Mark Corbin]

# v2.69.1+rev2
## (2021-02-11)

* Update balena-yocto-scripts to v1.9.1 [Kyle Harding]

# v2.69.1+rev1
## (2021-02-10)

* Add bcm2710-rpi-cm3.dtb for the raspberrypi3-64 machine [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.68.1 to v2.69.1 [Alexandru Costache] </summary>

> ## meta-balena-2.69.1
> ### (2021-02-03)
> 
> * Update balena-supervisor from v12.3.0 to v12.3.5 [Miguel Casqueira]
> 
> ## meta-balena-2.69.0
> ### (2021-02-01)
> 
> * openvpn: remove resin-ntp-config call from upscript.sh [Mark Corbin]
> * resin-vars: trigger NTP config script on config.json changes [Mark Corbin]
> * resin-ntp-config: update script and add systemd service [Mark Corbin]
> * networkmanager: add improved dispatcher scripts for NTP handling [Mark Corbin]
> * chrony: add sourcedir support and helper script [Mark Corbin]
> 
</details>

* Add tpm-slb9670-tis-spi DT overlay [Michal Toman]

# v2.68.1+rev1
## (2021-02-09)


<details>
<summary> Update meta-balena from v2.67.3 to v2.68.1 [Alex Gonzalez] </summary>

> ## meta-balena-2.68.1
> ### (2021-01-29)
> 
> * Fix task ordering for the iwlwifi_firmware_clean task [Florin Sarbu]
> 
> ## meta-balena-2.68.0
> ### (2021-01-29)
> 
> * Update NetworkManager to 1.28.0 [Zahari Petkov]
> 
> ## meta-balena-2.67.6
> ### (2021-01-28)
> 
> * docs: mention balenaRootCA as a config.json parameter [Matthew McGinn]
> 
> ## meta-balena-2.67.5
> ### (2021-01-27)
> 
> * replace busybox ps with procps [klutchell] [Kyle Harding]
> 
> ## meta-balena-2.67.4
> ### (2021-01-27)
> 
> * Update aufs4 and aufs5 kernel patches [Florin Sarbu]
> 
</details>

# v2.67.3+rev5
## (2021-02-04)

* Use 2GB kernel / 2GB userspace memory split on 5.4 kernels [Michal Toman]

# v2.67.3+rev4
## (2021-01-29)

* Fix overlay-map.dtb deploy location [Florin Sarbu]

# v2.67.3+rev3
## (2021-01-26)

* u-boot: Avoid lockup on dev image with uart disabled [Alexandru Costache]

# v2.67.3+rev2
## (2021-01-26)

* resin-image: Drop bootrom update packages for pi4 [Alexandru Costache]

# v2.67.3+rev1
## (2021-01-21)

* layers: Update device tree overlay list [Aaron Shaw]
* Update to dunfell-23.0.4 [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.65.1 to v2.67.3 [Florin Sarbu] </summary>

> ## meta-balena-2.67.3
> ### (2021-01-15)
> 
> * kernel-headers-test: Install python dependency [Alexandru Costache]
> 
> ## meta-balena-2.67.2
> ### (2021-01-14)
> 
> * Fix pppd timeout when launched by NetworkManager [Zahari Petkov]
> 
> ## meta-balena-2.67.1
> ### (2021-01-13)
> 
> * resin-device-register: Fix post provisioning state not reported [Alexandru Costache]
> 
> ## meta-balena-2.67.0
> ### (2021-01-12)
> 
> * Update balena-supervisor from v12.2.11 to v12.3.0 [Felipe Lalanne]
> 
> ## meta-balena-2.66.3
> ### (2021-01-12)
> 
> * Respect custom CA in supervisor [Michal Toman]
> 
> ## meta-balena-2.66.2
> ### (2021-01-11)
> 
> * README: Rename resin-logo to balena-logo. [Alex Gonzalez]
> 
> ## meta-balena-2.66.1
> ### (2021-01-04)
> 
> * kernel-devsrc: use upstream recipe starting with dunfell [Kyle Harding]
> * gen_mod_headers: add missing arch headers to tools [Kyle Harding]
> 
> ## meta-balena-2.66.0
> ### (2020-12-18)
> 
> * chrony: bump to version 4.0 [Mark Corbin]
> 
</details>

* Set CONFIG_PWRSEQ_SD8787 as built-in so the balenaFin wifi works correctly [Florin Sarbu]

# v2.65.1+rev1
## (2020-12-20)


<details>
<summary> Update meta-balena from v2.65.0 to v2.65.1 [Florin Sarbu] </summary>

> ## meta-balena-2.65.1
> ### (2020-12-17)
> 
> * u-boot: Add required configuration for BalenaOS environment [Alex Gonzalez]
> 
</details>

# v2.65.0+rev2
## (2020-12-18)

* raspberrypi400-64: Update Pi400 icon [Alexandru Costache]

# v2.65.0+rev1
## (2020-12-16)


<details>
<summary> Update meta-balena from v2.60.1 to v2.65.0 [Alexandru Costache] </summary>

> ## meta-balena-2.65.0
> ### (2020-12-14)
> 
> * Update balena-supervisor from v12.1.1 to v12.2.11 [Miguel Casqueira]
> 
> ## meta-balena-2.64.4
> ### (2020-12-14)
> 
> * Add IPV6 multicast routing capability [Alex Gonzalez]
> 
> ## meta-balena-2.64.3
> ### (2020-12-11)
> 
> * Revert "resin-data.mount: Remove default dependencies" [Alex Gonzalez]
> * hostapp-update-hooks: Add supervisor database fix [Alex Gonzalez]
> * resin-supervisor: Make sure the database directory exists [Alex Gonzalez]
> * Correct the data partition mountpoint [Alex Gonzalez]
> 
> ## meta-balena-2.64.2
> ### (2020-12-10)
> 
> * meta-balena-common: kernel-resin: enable task-accounting by default [Joseph Kogut]
> * meta-balena-common: kernel-resin: create task-accounting config [Joseph Kogut]
> 
> ## meta-balena-2.64.1
> ### (2020-12-09)
> 
> * Update codeowners [Alex Gonzalez]
> 
> ## meta-balena-2.64.0
> ### (2020-12-07)
> 
> * rust: remove merged fix for TUNE_FEATURES parsing [Kyle Harding]
> * systemd: update patches to avoid fuzzy matching [Kyle Harding]
> * systemd: add missing udev rules [Kyle Harding]
> * systemd: avoid conflicts with timeinit package [Kyle Harding]
> * dropbear: prevent conflicts with openssh [Kyle Harding]
> * networkmanager: add bash requirement [Kyle Harding]
> * networkmanager: remove deprecated bluetooth inherit [Kyle Harding]
> * meta-balena-common: replace distro_features_check with features_check [Kyle Harding]
> * avahi: remove example services [Kyle Harding]
> * u-boot: disable u-boot-initial-env [Kyle Harding]
> * dnsmasq: fix build after y2038 changes in glib [Kyle Harding]
> * bluez5: replace experimental flag patch with service conf [Kyle Harding]
> * mtools: remove initialize-direntry patch [Kyle Harding]
> * meta-balena-dunfell: dunfell compatibility layer support [Kyle Harding]
> 
> ## meta-balena-2.63.1
> ### (2020-12-04)
> 
> * start-resin-supervisor: fix directory creation for 'balena start' [Mark Corbin]
> 
> ## meta-balena-2.63.0
> ### (2020-11-30)
> 
> * zram-swap-init: adjust default to lesser of 50%/4GB [Joseph Kogut]
> 
> ## meta-balena-2.62.2
> ### (2020-11-25)
> 
> * chrony: use a non-privileged UDP source port [Mark Corbin]
> 
> ## meta-balena-2.62.1
> ### (2020-11-19)
> 
> * supervisor: remove old/unnecessary balenaRootCA references [Matthew McGinn]
> 
> ## meta-balena-2.62.0
> ### (2020-11-13)
> 
> * systemd/timeinit: improve RTC handling at boot [Mark Corbin]
> * os-helpers: add support functions for system date/time [Mark Corbin]
> 
> ## meta-balena-2.61.3
> ### (2020-11-05)
> 
> * modemmanager: add u-blox-modeswitch scripts [Mark Corbin]
> 
> ## meta-balena-2.61.2
> ### (2020-11-05)
> 
> * Check the API for configuration changes once a day [Michal Toman]
> 
> ## meta-balena-2.61.1
> ### (2020-11-04)
> 
> * Enable kernel user space probes support [Alex Gonzalez]
> 
> ## meta-balena-2.61.0
> ### (2020-11-04)
> 
> 
> <details>
> <summary> Update balena-supervisor from v11.14.0 to v12.1.1 [Cameron Diver] </summary>
> 
>> ### balena-supervisor-12.1.1
>> #### (2020-10-28)
>> 
>> * Use root mount point to find device-type.json [Cameron Diver]
>> 
>> ### balena-supervisor-12.1.0
>> #### (2020-10-28)
>> 
>> * Change log source from docker to journalctl [Thomas Manning]
>> 
>> ### balena-supervisor-12.0.9
>> #### (2020-10-27)
>> 
>> * Change source of deviceType to device-type.json [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.0.8
>> #### (2020-10-26)
>> 
>> * Fixed evaluating if updates are needed to reach target state [Miguel Casqueira]
>> 
>> ### balena-supervisor-12.0.7
>> #### (2020-10-19)
>> 
>> * Improved log message when networks do not match [Miguel Casqueira]
>> 
>> ### balena-supervisor-12.0.6
>> #### (2020-10-16)
>> 
>> * Fixes check allowing preloading in local (unmanaged) mode [ab77]
>> * Handle delete of multiple images with same dockerImageId [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.0.5
>> #### (2020-10-14)
>> 
>> * Improve calculation for used system memory [Felipe Lalanne]
>> 
>> ### balena-supervisor-12.0.4
>> #### (2020-10-13)
>> 
>> * Don't require an existing supervisor container to sync [Cameron Diver]
>> 
>> ### balena-supervisor-12.0.3
>> #### (2020-10-12)
>> 
>> * Refactor system information filtering [Cameron Diver]
>> * tests: Clean up and consistify naming scheme [Cameron Diver]
>> 
>> ### balena-supervisor-12.0.2
>> #### (2020-10-12)
>> 
>> * Attempt a state report once every maxReportFrequency [Cameron Diver]
>> * Remove superfluous current state reporting code from api-binder [Cameron Diver]
>> 
>> ### balena-supervisor-12.0.1
>> #### (2020-10-12)
>> 
>> * Add features label `io.balena.features.journal-logs` [Thomas Manning]
>> 
>> ### balena-supervisor-12.0.0
>> #### (2020-09-29)
>> 
>> * version: drop SUPERVISOR_VERSION env var [Matthew McGinn]
>> 
>> ### balena-supervisor-11.14.8
>> #### (2020-09-29)
>> 
>> * Fix supervisor deadlock during migration [Felipe Lalanne]
>> 
>> ### balena-supervisor-11.14.7
>> #### (2020-09-25)
>> 
>> * Correctly evaluate if scheduledApply.delay is not set [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.14.6
>> #### (2020-09-24)
>> 
>> * Fix config checks for ConfigFS backend [Felipe Lalanne]
>> 
>> ### balena-supervisor-11.14.5
>> #### (2020-09-24)
>> 
>> * mixpanel: superisor_version -> supervisor_version [Matthew McGinn]
>> 
>> ### balena-supervisor-11.14.4
>> #### (2020-09-18)
>> 
>> * api: Implement scoped Supervisor API keys [Rich Bayliss]
>> 
>> ### balena-supervisor-11.14.3
>> #### (2020-09-17)
>> 
>> * Clarify docs for toggling update lock override from dashboard [M. Casqueira]
>> 
>> ### balena-supervisor-11.14.2
>> #### (2020-09-15)
>> 
>> * Refactor extra_uEnv backend to match with more devices [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.14.1
>> #### (2020-09-14)
>> 
>> * application-manager: Convert to a singleton [Rich Bayliss]
>> * device-state: Convert to a singleton [Rich Bayliss]
>> * api-binder: Convert to a singleton [Rich Bayliss]
>> 
> </details>
> 
> 
</details>

* raspberrypi400-64: Add coffee file [Alexandru Costache]

# v2.60.1+rev8
## (2020-12-14)

* recipes-kernel: remove rootfstype=ext4 [Joseph Kogut]

# v2.60.1+rev7
## (2020-12-11)

* linux-raspberry: Enable cgroups memory by default [Alex Gonzalez]

# v2.60.1+rev6
## (2020-11-30)

* u-boot: Don't crash with specific pi4 usb [Alexandru Costache]

# v2.60.1+rev5
## (2020-11-11)

* Update balena-yocto-scripts to v1.9.0 [Alexandru Costache]

# v2.60.1+rev4
## (2020-11-10)

* Update Revolution Pi picontrol module to version 4.19.95 [Florin Sarbu]
* Update the Revolution Pi kernel to version 4.19.95 [Florin Sarbu]

# v2.60.1+rev3
## (2020-11-09)

* Remove explicit root cmdline parameter from the kernel recipe [Florin Sarbu]

# v2.60.1+rev2
## (2020-11-06)

* u-blox-modeswitch: remove recipe [Mark Corbin]

# v2.60.1+rev1
## (2020-11-02)


<details>
<summary> Update meta-balena from v2.58.6 to v2.60.1 [Alexandru Costache] </summary>

> ## meta-balena-2.60.1
> ### (2020-10-30)
> 
> * chrony: set the source UDP port for NTP requests to 123 [Mark Corbin]
> 
> ## meta-balena-2.60.0
> ### (2020-10-29)
> 
> * chrony: don't restore time from drift file or RTC [Mark Corbin]
> * systemd/timeinit: add fake.hwclock to maintain system time over reboots [Mark Corbin]
> * resin-mounts: add bind mount service for /etc/fake-hwclock [Mark Corbin]
> 
> ## meta-balena-2.59.0
> ### (2020-10-27)
> 
> * Add host extensions support [Alex Gonzalez]
> * packagegroup-resin: Add hostapp extensions update script [Alex Gonzalez]
> * hostapp-extensions-update: Add host extensions update script [Alex Gonzalez]
> * resin-vars: Parse the HOSTEXT_IMAGES variable from config.json [Alex Gonzalez]
> * docker-disk: Add the host extension images to the data partition [Alex Gonzalez]
> * docker-disk: Generalize hostapp platform variable [Alex Gonzalez]
> * initrdscripts: Busybox switch_root does not support -c argument [Alex Gonzalez]
> * resin-filesystem-expand: Omit fs check and resize if partition is mounted [Alex Gonzalez]
> * initrdscripts: Expand the resin-data filesystem [Alex Gonzalez]
> * initrdscripts: Add resin-data to fs UUID generation [Alex Gonzalez]
> * resin-data.mount: Remove default dependencies [Alex Gonzalez]
> * packagegroup-resin: Add independent mobynit package to image [Alex Gonzalez]
> * balena-engine: Do not build mobynit [Alex Gonzalez]
> * mobynit: Fix source directory [Alex Gonzalez]
> * mobynit: Separate recipe from balena-engine [Alex Gonzalez]
> 
</details>

# v2.58.6+rev5
## (2020-10-30)

* Revert the 1GB kernel / 3GB userspace memory split [Michal Toman]

# v2.58.6+rev4
## (2020-10-21)

* u-boot: fix possible freeze in uart driver [Alexandru Costache]

# v2.58.6+rev3
## (2020-10-21)

* Use proper bootfiles for rt-rpi-300 [Florin Sarbu]

# v2.58.6+rev2
## (2020-10-20)

* Add rt-rpi-300 machine based on Raspberry Pi4 [Florin Sarbu]

# v2.58.6+rev1
## (2020-10-19)


<details>
<summary> Update meta-balena from v2.58.3 to v2.58.6 [Alexandru Costache] </summary>

> ## meta-balena-2.58.6
> ### (2020-10-15)
> 
> * readme: DCHP -> DHCP [Matthew McGinn]
> 
> ## meta-balena-2.58.5
> ### (2020-10-13)
> 
> * bootfiles: blacklist proper grub configuration backend [Matthew McGinn]
> 
> ## meta-balena-2.58.4
> ### (2020-10-05)
> 
> * docker-disk: Allow expanding data filesystem on 2TB disks [Alexandru Costache]
> 
</details>

# v2.58.3+rev4
## (2020-10-12)

* linux-raspberrypi: Backport i2c-gpio fix for Pi3 [Alexandru Costache]

# v2.58.3+rev3
## (2020-10-05)

* Fix device tree overlay deploy to the boot partition [Florin Sarbu]

# v2.58.3+rev2
## (2020-09-30)

* Add support for RevolutionPi Connect [Florin Sarbu]
* Use the proper device tree overlay for the RevPi Core [Florin Sarbu]

# v2.58.3+rev1
## (2020-09-21)


<details>
<summary> Update meta-balena from v2.58.0 to v2.58.3 [Florin Sarbu] </summary>

> ## meta-balena-2.58.3
> ### (2020-09-18)
> 
> * Blacklist supervisor configuration backend files during HUP [Alex Gonzalez]
> 
> ## meta-balena-2.58.2
> ### (2020-09-17)
> 
> * hooks: fix up improperly named variable [Matthew McGinn]
> 
> ## meta-balena-2.58.1
> ### (2020-09-15)
> 
> * Wait for the root device to come up when necessary [Michal Toman]
> 
</details>

# v2.58.0+rev2
## (2020-09-21)

* u-boot: fix possible freeze in uart driver [Alexandru Costache]

# v2.58.0+rev1
## (2020-09-15)


<details>
<summary> Update meta-balena from v2.56.0 to v2.58.0 [Alexandru Costache] </summary>

> ## meta-balena-2.58.0
> ### (2020-09-05)
> 
> * Respect balenaRootCA system-wide [Michal Toman]
> 
> ## meta-balena-2.57.1
> ### (2020-09-04)
> 
> * os-helpers-logging: Log to stderr rather than stdout [Michal Toman]
> 
> ## meta-balena-2.57.0
> ### (2020-09-04)
> 
> * Update libmbim to 1.24.2, libqmi to 1.26.0, modemmanager to 1.14.2 [Vicentiu Galanopulo]
> 
</details>

# v2.56.0+rev3
## (2020-09-15)

* Use bt / wifi prebuilts for kernel 4.19.118 [Florin Sarbu]

# v2.56.0+rev2
## (2020-09-14)

* README: Rename resin to Balena in layer readme [Alexandru Costache]

# v2.56.0+rev1
## (2020-09-03)


<details>
<summary> Update meta-balena from v2.54.3 to v2.56.0 [Florin Sarbu] </summary>

> ## meta-balena-2.56.0
> ### (2020-09-03)
> 
> 
> <details>
> <summary> Update balena-supervisor from v11.13.0 to v11.14.0 [Cameron Diver] </summary>
> 
>> ### balena-supervisor-11.14.0
>> #### (2020-09-03)
>> 
>> * Add device system information to state endpoint patch [Cameron Diver]
>> 
> </details>
> 
> 
> ## meta-balena-2.55.0
> ### (2020-09-03)
> 
> 
> <details>
> <summary> Update balena-supervisor from v11.12.4 to v11.13.0 [Cameron Diver] </summary>
> 
>> ### balena-supervisor-11.13.0
>> #### (2020-08-29)
>> 
>> * added support for configuring ODMDATA [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.12.11
>> #### (2020-08-27)
>> 
>> * bug: Resolve mDNS API URLs [Rich Bayliss]
>> 
>> ### balena-supervisor-11.12.10
>> #### (2020-08-24)
>> 
>> * Preventing removing all configurations if device has no backends [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.12.9
>> #### (2020-08-20)
>> 
>> * Don't enforce the vc4-fkms-v3d dtoverlay on rpi4 [Cameron Diver]
>> 
>> ### balena-supervisor-11.12.8
>> #### (2020-08-19)
>> 
>> 
>> <details>
>> <summary> Update dependencies [Pagan Gazzard] </summary>
>> 
>>> #### node-docker-delta-2.2.11
>>> ##### (2020-08-19)
>>> 
>>> * Add .versionbot/CHANGELOG.yml for nested changelogs [Pagan Gazzard]
>>> 
>>> #### node-docker-delta-2.2.10
>>> ##### (2020-08-05)
>>> 
>>> * Removed unused dependencies [Pagan Gazzard]
>>> * circleci: update docker [Pagan Gazzard]
>>> 
>>> #### docker-progress-4.0.3
>>> ##### (2020-08-17)
>>> 
>>> * Update to balena-lint 5.x [Pagan Gazzard]
>>> 
>>> #### docker-progress-4.0.2
>>> ##### (2020-08-17)
>>> 
>>> * Add .versionbot/CHANGELOG.yml for nested changelogs [Pagan Gazzard]
>>> 
>>> #### docker-progress-4.0.1
>>> ##### (2020-03-04)
>>> 
>>> * Update dependencies [Pagan Gazzard]
>>> 
>>> #### docker-progress-4.0.0
>>> ##### (2019-03-26)
>>> 
>>> * Detect error events in push/pull progress streams [Paulo Castro]
>>> 
>>> #### docker-toolbelt-3.3.10
>>> ##### (2020-08-19)
>>> 
>>> * Add .versionbot/CHANGELOG.yml for nested changelogs [Pagan Gazzard]
>>> 
>>> #### docker-toolbelt-3.3.9
>>> ##### (2020-08-17)
>>> 
>>> * Update to balena-lint 5.x [Pagan Gazzard]
>>> 
>>> #### livepush-3.5.1
>>> ##### (2020-08-19)
>>> 
>>> * Add .versionbot/CHANGELOG.yml for nested changelogs [Pagan Gazzard]
>>> 
>>> #### livepush-3.5.0
>>> ##### (2020-07-13)
>>> 
>>> * Allow setting ENV variables in the live image [Roman Mazur]
>>> * Bump dockerode types dependency [Roman Mazur]
>>> 
>>> #### livepush-3.4.1
>>> ##### (2020-05-05)
>>> 
>>> * Update README with information about live directives [Cameron Diver]
>>> 
>>> #### livepush-3.4.0
>>> ##### (2020-04-15)
>>> 
>>> * 🔭 Add a file watcher which can be used by library users [Cameron Diver]
>>> 
>>> #### resin-docker-build-1.1.6
>>> ##### (2020-08-19)
>>> 
>>> * Add .versionbot/CHANGELOG.yml for nested changelogs [Pagan Gazzard]
>>> 
>>> #### resin-docker-build-1.1.5
>>> ##### (2020-04-02)
>>> 
>>> * Update README with correct instantiation method [CameronDiver]
>>> 
>> </details>
>> 
>> 
>> ### balena-supervisor-11.12.7
>> #### (2020-08-19)
>> 
>> 
>> <details>
>> <summary> Update typed-error to 3.x [Pagan Gazzard] </summary>
>> 
>>> #### typed-error-3.2.1
>>> ##### (2020-08-05)
>>> 
>>> * Update dependencies [Pagan Gazzard]
>>> 
>>> #### typed-error-3.2.0
>>> ##### (2019-11-20)
>>> 
>>> * update deps and specify minimum engine requirements [Will Boyce]
>>> 
>>> #### typed-error-3.1.0
>>> ##### (2019-04-01)
>>> 
>>> * dev: Enforce prettier coding standards [Will Boyce]
>>> * npm: Update dependencies and remove `package-lock.json` [Will Boyce]
>>> * codeowners: Add top contributors @wrboyce, @Page-, and @dfunckt [Will Boyce]
>>> * versionbot: Add CHANGELOG.yml (for nested changelogs) [Will Boyce]
>>> 
>>> #### typed-error-3.0.2
>>> ##### (2018-11-01)
>>> 
>>> * Update README with new import style [CameronDiver]
>>> 
>>> #### typed-error-3.0.1
>>> ##### (2018-10-29)
>>> 
>>> * Update to typescript 3 [Pagan Gazzard]
>>> * Update dev dependencies [Pagan Gazzard]
>>> * Add node-10 to the circle test suite [Pagan Gazzard]
>>> 
>>> #### typed-error-3.0.0
>>> ##### (2018-04-17)
>>> 
>>> * Distribute generated typescript declaration [Will Boyce]
>>> * use circle for build/publish and add package-lock [Will Boyce]
>>> * add lint scripts/requirements [Will Boyce]
>>> * Remove `BaseError` class and  directly subclass `Error` [Will Boyce]
>>> * Update dependencies, clean up package/tsconfig [Will Boyce]
>>> 
>>> #### typed-error-2.0.1
>>> ##### (2017-12-15)
>>> 
>>> * Add LICENSE [Akis Kesoglou]
>>> 
>> </details>
>> 
>> 
>> ### balena-supervisor-11.12.6
>> #### (2020-08-18)
>> 
>> 
>> <details>
>> <summary> Update pinejs-client-request to 7.2.1 [Pagan Gazzard] </summary>
>> 
>>> #### pinejs-client-request-7.2.1
>>> ##### (2020-08-18)
>>> 
>>> 
>>> <details>
>>> <summary> Update dependencies [Pagan Gazzard] </summary>
>>> 
>>>> ##### pinejs-client-js-6.7.1
>>>> ###### (2020-08-12)
>>>> 
>>>> * Fix prepare $count typings [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.7.0
>>>> ###### (2020-08-12)
>>>> 
>>>> * Improve typings for request/post/put/patch/delete [Pagan Gazzard]
>>>> 
>>> </details>
>>> 
>>> 
>>> #### pinejs-client-request-7.2.0
>>> ##### (2020-08-12)
>>> 
>>> 
>>> <details>
>>> <summary> Update pinejs-client-core to 6.6.1 [Pagan Gazzard] </summary>
>>> 
>>>> ##### typed-error-3.2.1
>>>> ###### (2020-08-05)
>>>> 
>>>> * Update dependencies [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.6.1
>>>> ###### (2020-08-11)
>>>> 
>>>> * Fix typing when id is specified to be `AnyObject | undefined` [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.6.0
>>>> ###### (2020-08-11)
>>>> 
>>>> * Deprecate `$expand: { 'a/$count': {...} }` [Pagan Gazzard]
>>>> * Deprecate `resource: 'a/$count'` and update typings to reflect it [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.5.0
>>>> ###### (2020-08-11)
>>>> 
>>>> * Add `options: { $count: { ... } }` sugar for top level $count [Pagan Gazzard]
>>>> * Add `$expand: { a: { $count: { ... } } }` sugar for $count in expands [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.4.0
>>>> ###### (2020-08-11)
>>>> 
>>>> * Improve return typing of `subscribe` method [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.3.0
>>>> ###### (2020-08-11)
>>>> 
>>>> * Fix Poll.on typings [Pagan Gazzard]
>>>> * Improve return typing when id is passed to GET methods [Pagan Gazzard]
>>>> * Remove `PromiseResult` type, use `Promise<PromiseResultTypes>` instead [Pagan Gazzard]
>>>> * Remove `PromiseObj` type, use `Promise<{}>` instead [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.2.0
>>>> ###### (2020-08-10)
>>>> 
>>>> * Add `$filter: { a: { $count: 1 } }` sugar for $count in filters [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.1.2
>>>> ###### (2020-08-10)
>>>> 
>>>> * Remove redundant ParamsObj/SubscribeParamsObj types [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.1.1
>>>> ###### (2020-08-10)
>>>> 
>>>> * Make use of `mapObj` helper in more places [Pagan Gazzard]
>>>> * Use `Object.keys` in preference to `hasOwnProperty` where applicable [Pagan Gazzard]
>>>> 
>>> </details>
>>> 
>>> 
>> </details>
>> 
>> 
>> ### balena-supervisor-11.12.5
>> #### (2020-08-12)
>> 
>> * Refactor configurable backend class names [Miguel Casqueira]
>> 
> </details>
> 
> 
</details>

* Update balena-yocto-scripts to v1.8.1 [Florin Sarbu]

# v2.54.3+rev4
## (2020-09-02)

* gitmodules: Rename resin to balena in repo links [Alexandru Costache]

# v2.54.3+rev3
## (2020-08-28)

* use the linux-raspberrypi.inc from meta-raspberrypi [Vicentiu Galanopulo]

# v2.54.3+rev2
## (2020-08-28)

* Avoid Pi4 freeze while booting production builds [Alexandru Costache]

# v2.54.3+rev1
## (2020-08-25)

* Update RPI4 to kernel 5.4.58 [Vicentiu Galanopulo]

# v2.54.2+rev1
## (2020-08-14)


<details>
<summary> Update meta-balena from v2.53.12 to v2.54.2 [Florin Sarbu] </summary>

> ## meta-balena-2.54.2
> ### (2020-08-12)
> 
> 
> <details>
> <summary> balena-supervisor: Update to v11.12.4 [Alex Gonzalez] </summary>
> 
>> ### balena-supervisor-11.12.4
>> #### (2020-08-12)
>> 
>> * bug: Firewall not blocking supervisor access from outside the device [Rich Bayliss]
>> 
>> ### balena-supervisor-11.12.3
>> #### (2020-08-11)
>> 
>> * bug: Allow DNS through firewall for local containers [Rich Bayliss]
>> 
> </details>
> 
> 
> ## meta-balena-2.54.1
> ### (2020-08-07)
> 
> * Package iwlwifi-cc-a0-48 firmware separately [Florin Sarbu]
> 
> ## meta-balena-2.54.0
> ### (2020-08-06)
> 
> 
> <details>
> <summary> Update balena-supervisor from v11.9.9 to v11.12.2 [Cameron Diver] </summary>
> 
>> ### balena-supervisor-11.12.2
>> #### (2020-08-05)
>> 
>> * Fix device-tag fetching function [Cameron Diver]
>> 
>> ### balena-supervisor-11.12.1
>> #### (2020-08-05)
>> 
>> 
>> <details>
>> <summary> Update resumable-request [Pagan Gazzard] </summary>
>> 
>>> #### resumable-request-2.0.1
>>> ##### (2020-08-05)
>>> 
>>> * Add .versionbot/CHANGELOG.yml for nested changelogs [Pagan Gazzard]
>>> * Optimize lodash dependency [Pagan Gazzard]
>>> 
>> </details>
>> 
>> 
>> ### balena-supervisor-11.12.0
>> #### (2020-08-05)
>> 
>> 
>> <details>
>> <summary> Update contrato to 0.5 [Pagan Gazzard] </summary>
>> 
>>> #### contrato-0.5.0
>>> ##### (2020-08-05)
>>> 
>>> * Remove handlebars-helpers to shrink bundle size [Pagan Gazzard]
>>> 
>>> #### contrato-0.4.0
>>> ##### (2020-08-04)
>>> 
>>> 
>>> <details>
>>> <summary> Update skhema to 5.x [Pagan Gazzard] </summary>
>>> 
>>>> ##### skhema-5.3.2
>>>> ###### (2020-08-04)
>>>> 
>>>> * Switch to typed-error [Pagan Gazzard]
>>>> 
>>>> ##### skhema-5.3.1
>>>> ###### (2020-08-04)
>>>> 
>>>> * Add .versionbot/CHANGELOG.yml for nested changelogs [Pagan Gazzard]
>>>> 
>>>> ##### skhema-5.3.0
>>>> ###### (2020-05-05)
>>>> 
>>>> * filter: Throw a custom error if the schema is invalid [Juan Cruz Viotti]
>>>> 
>>>> ##### skhema-5.2.9
>>>> ###### (2019-12-12)
>>>> 
>>>> * Add test to show .filter() not working correctly [StefKors]
>>>> * When combining with baseSchema merge enum with AND operator [StefKors]
>>>> 
>>>> ##### skhema-5.2.8
>>>> ###### (2019-11-27)
>>>> 
>>>> * Ensure values in "enum" are unique [Juan Cruz Viotti]
>>>> 
>>>> ##### skhema-5.2.7
>>>> ###### (2019-11-27)
>>>> 
>>>> * filter: Correctly handle "enum" inside "anyOf" [Juan Cruz Viotti]
>>>> 
>>>> ##### skhema-5.2.6
>>>> ###### (2019-11-19)
>>>> 
>>>> * merge: Be explicit about additionalProperties [Juan Cruz Viotti]
>>>> 
>>>> ##### skhema-5.2.5
>>>> ###### (2019-05-09)
>>>> 
>>>> * Add a resolver for the const keyword [Lucian]
>>>> 
>>>> ##### skhema-5.2.4
>>>> ###### (2019-04-15)
>>>> 
>>>> * Configure AJV instances with an LRU cache [Juan Cruz Viotti]
>>>> 
>>>> ##### skhema-5.2.3
>>>> ###### (2019-04-15)
>>>> 
>>>> * Set addUsedSchema to false in all AJV instances [Juan Cruz Viotti]
>>>> 
>>>> ##### skhema-5.2.2
>>>> ###### (2019-03-20)
>>>> 
>>>> * Fix bug in scoreMatch when handling arrays [Lucian]
>>>> 
>>>> ##### skhema-5.2.1
>>>> ###### (2019-03-19)
>>>> 
>>>> * Fix bad require name and .only in tests [Lucian]
>>>> 
>>>> ##### skhema-5.2.10
>>>> ###### (Invalid date)
>>>> 
>>>> * .filter(): Only match if the base schema matches [Lucian Buzzo]
>>>> 
>>>> ##### skhema-5.2.0
>>>> ###### (2019-03-19)
>>>> 
>>>> * Add ability to provide custom resolvers to merge() [Lucian]
>>>> 
>>>> ##### skhema-5.1.1
>>>> ###### (2019-02-08)
>>>> 
>>>> * Split up and optimize lodash dependencies [Lucian]
>>>> 
>>>> ##### skhema-5.1.0
>>>> ###### (2019-01-08)
>>>> 
>>>> * feature: Implement method for restricting a schema by another schema [Lucian Buzzo]
>>>> 
>>>> ##### skhema-5.0.0
>>>> ###### (Invalid date)
>>>> 
>>>> * Remove ability to add custom keywords or formats [Lucian]
>>>> 
>>>> ##### skhema-4.0.4
>>>> ###### (Invalid date)
>>>> 
>>>> * Improve performance of clone operations [Lucian]
>>>> 
>>>> ##### skhema-4.0.3
>>>> ###### (2018-12-10)
>>>> 
>>>> * Don't bust AJV cache [Lucian]
>>>> 
>>>> ##### skhema-4.0.2
>>>> ###### (2018-12-10)
>>>> 
>>>> * Add benchmark tests [Giovanni Garufi]
>>>> 
>>>> ##### skhema-4.0.1
>>>> ###### (2018-12-04)
>>>> 
>>>> * Recurse through nested `anyOf` statements when filtering [Lucian]
>>>> 
>>>> ##### skhema-4.0.0
>>>> ###### (2018-12-03)
>>>> 
>>>> * Treat undefined additionalProperties as true instead of false [Lucian]
>>>> 
>>>> ##### skhema-3.0.1
>>>> ###### (Invalid date)
>>>> 
>>>> * stryker: Increase test timeout [Juan Cruz Viotti]
>>>> * test: Configure Stryker for mutative testing [Juan Cruz Viotti]
>>>> 
>>>> ##### skhema-3.0.0
>>>> ###### (2018-11-29)
>>>> 
>>>> * Define additionalProperty inheritance in anyOf [Giovanni Garufi]
>>>> * Formalising filtering logic [Lucian]
>>>> * Added failing test case with mutation [Lucian]
>>>> 
>>>> ##### skhema-2.5.2
>>>> ###### (2018-11-07)
>>>> 
>>>> * hotfix: Make sure things that should be filtered are filtered [Juan Cruz Viotti]
>>>> 
>>>> ##### skhema-2.5.1
>>>> ###### (2018-11-06)
>>>> 
>>>> * filter: Force additionalProperties: true on match schemas [Juan Cruz Viotti]
>>>> 
>>>> ##### skhema-2.5.0
>>>> ###### (2018-10-16)
>>>> 
>>>> * Validate against just the schema if `options.schemaOnly` is true [Lucian Buzzo]
>>>> 
>>>> ##### skhema-2.4.1
>>>> ###### (2018-10-09)
>>>> 
>>>> * merge: When merging an empty array, return a wildcard schema [Lucian Buzzo]
>>>> 
>>>> ##### skhema-2.4.0
>>>> ###### (2018-10-09)
>>>> 
>>>> * validate: Make object optional [Lucian Buzzo]
>>>> 
>>> </details>
>>> 
>>> 
>>> #### contrato-0.3.1
>>> ##### (2020-08-04)
>>> 
>>> * Add .versionbot/CHANGELOG.yml for nested changelogs [Pagan Gazzard]
>>> 
>>> #### contrato-0.3.0
>>> ##### (2020-07-17)
>>> 
>>> * Add logical operator support in templates [Stevche Radevski]
>>> 
>> </details>
>> 
>> 
>> ### balena-supervisor-11.11.7
>> #### (2020-08-04)
>> 
>> * Bump elliptic from 6.5.2 to 6.5.3 [dependabot[bot]]
>> 
>> <details>
>> <summary> Update pinejs-client-request and make use of a named key [Pagan Gazzard] </summary>
>> 
>>> #### pinejs-client-request-7.1.0
>>> ##### (2020-07-28)
>>> 
>>> 
>>> <details>
>>> <summary> Update dependencies [Pagan Gazzard] </summary>
>>> 
>>>> ##### pinejs-client-js-6.1.0
>>>> ###### (2020-07-21)
>>>> 
>>>> * Add support for using named ids [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-6.0.1
>>>> ###### (2020-06-19)
>>>> 
>>>> * Drop unnecessary async from request() [Thodoris Greasidis]
>>>> 
>>> </details>
>>> 
>>> 
>>> #### pinejs-client-request-7.0.1
>>> ##### (2020-07-28)
>>> 
>>> * Increase default timeout to 59s [Pagan Gazzard]
>>> 
>> </details>
>> 
>> 
>> ### balena-supervisor-11.11.6
>> #### (2020-07-31)
>> 
>> * Fixes documentation - ping doesn't need apiKey and minor documentation formatting changes. [Nitish Agarwal]
>> 
>> ### balena-supervisor-11.11.5
>> #### (2020-07-31)
>> 
>> * Fixes #1299 v1 start/stop endpoint issue with service access. [Nitish Agarwal]
>> 
>> ### balena-supervisor-11.11.4
>> #### (2020-07-31)
>> 
>> * bug: Fix undefined containerId object [Rich Bayliss]
>> 
>> ### balena-supervisor-11.11.3
>> #### (2020-07-30)
>> 
>> * fix matching extra_uEnv backend with unsupported devices [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.11.2
>> #### (2020-07-30)
>> 
>> * Fix an issue with reporting initial config using a stale target state [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.11.1
>> #### (2020-07-29)
>> 
>> * fix up "atleast" -> "at least" [Matthew McGinn]
>> 
>> ### balena-supervisor-11.11.0
>> #### (2020-07-28)
>> 
>> * Support setting device/fleet configuration in extra_uEnv.txt [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.10.0
>> #### (2020-07-24)
>> 
>> * Extract current state reporting to its own module [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.9.10
>> #### (2020-07-23)
>> 
>> * log detection of changes to VPN status [dt-rush]
>> 
> </details>
> 
> 
> ## meta-balena-2.53.14
> ### (2020-08-06)
> 
> * balena-unique-key: Ensure config.json is synced after replacing [Alexandru Costache]
> 
> ## meta-balena-2.53.13
> ### (2020-08-05)
> 
> * flasher-register: if no supervisor information found, report null [Matthew McGinn]
> 
</details>

# v2.53.12+rev1
## (2020-08-05)


<details>
<summary> Update meta-balena from v2.53.11 to v2.53.12 [Florin Sarbu] </summary>

> ## meta-balena-2.53.12
> ### (2020-08-04)
> 
> * systemd: Set net.ipv4.conf.all.rp_filter in balena-os-sysctl [Alexandru Costache]
> 
</details>

* Add i2c overlays [Florin Sarbu]

# v2.53.11+rev1
## (2020-08-05)


<details>
<summary> Update meta-balena from v2.53.9 to v2.53.11 [Florin Sarbu] </summary>

> ## meta-balena-2.53.11
> ### (2020-07-30)
> 
> * Use a named key when querying for device by uuid [Pagan Gazzard]
> 
> ## meta-balena-2.53.10
> ### (2020-07-29)
> 
> * supervisor: allow supervisor updates without controlling the supervisor state [Matthew McGinn]
> 
</details>

# v2.53.9+rev3
## (2020-07-27)

* Remove kernel check config warning for PWRSEQ_SD8787 [Alex Gonzalez]

# v2.53.9+rev2
## (2020-07-24)

* Update the boot firmware to the 20200601arm64 [Alexandru Costache]

# v2.53.9+rev1
## (2020-07-24)


<details>
<summary> Update meta-balena from v2.53.8 to v2.53.9 [Alexandru Costache] </summary>

> ## meta-balena-2.53.9
> ### (2020-07-23)
> 
> 
> <details>
> <summary> balena-supervisor: Update to v11.9.9 [Rich Bayliss] </summary>
> 
>> ### balena-supervisor-11.9.9
>> #### (2020-07-23)
>> 
>> * common: Fix bug where aliases might be undefined [Rich Bayliss]
>> 
> </details>
> 
> 
</details>

# v2.53.8+rev2
## (2020-07-24)

* Use 1GB kernel / 3GB userspace memory split for 32-bit kernels [Michal Toman]

# v2.53.8+rev1
## (2020-07-23)


<details>
<summary> Update meta-balena from v2.52.7 to v2.53.8 [Alexandru Costache] </summary>

> ## meta-balena-2.53.8
> ### (2020-07-23)
> 
> * resin-supervisor: Create required directories before launch [Alex Gonzalez]
> 
> ## meta-balena-2.53.7
> ### (2020-07-23)
> 
> 
> <details>
> <summary> balena-supervisor: Update to v11.9.8 [Florin Sarbu] </summary>
> 
>> ### balena-supervisor-11.9.8
>> #### (2020-07-22)
>> 
>> * Bump lodash from 4.17.15 to 4.17.19 [dependabot[bot]]
>> 
>> ### balena-supervisor-11.9.7
>> #### (2020-07-22)
>> 
>> * docker-utils: Test network gateway determination logic [Rich Bayliss]
>> * Fix docker-util using incorrect reference for function [Miguel Casqueira]
>> 
> </details>
> 
> 
> ## meta-balena-2.53.6
> ### (2020-07-21)
> 
> * recipes-containers/balena: Use separate service for loading healthcheck image [Alexandru Costache]
> 
> ## meta-balena-2.53.5
> ### (2020-07-21)
> 
> 
> <details>
> <summary> balena-supervisor: Update to v11.9.6 [Rich Bayliss] </summary>
> 
>> ### balena-supervisor-11.9.6
>> #### (2020-07-20)
>> 
>> * Fix purge and restart invocations by providing instanced apps [Cameron Diver]
>> * Fix purge invocations of new singletons [Cameron Diver]
>> 
>> ### balena-supervisor-11.9.5
>> #### (2020-07-14)
>> 
>> * Update ESR version information [Cameron Diver]
>> 
> </details>
> 
> 
> ## meta-balena-2.53.4
> ### (2020-07-21)
> 
> * Add support for aufs5 on kernel 5.x variants [Florin Sarbu]
> * Force choosing busybox-hwclock over util-linux-hwclock [Alex Gonzalez]
> 
> ## meta-balena-2.53.3
> ### (2020-07-16)
> 
> * provisioning: provide base supervisor_version during provision [Matthew McGinn]
> 
> ## meta-balena-2.53.2
> ### (2020-07-16)
> 
> * Add LZ4 support config for older kernels [Alexandru Costache]
> 
> ## meta-balena-2.53.1
> ### (2020-07-14)
> 
> * Remove unnecessary config.json keys [Pagan Gazzard]
> 
> ## meta-balena-2.53.0
> ### (2020-07-14)
> 
> * resin-supervisor: Create required directories before launch [Alex Gonzalez]
> * Rebrand custom resin logos [Alex Gonzalez]
> * plymouth: Remove patch that sets plymouth resin theme [Alex Gonzalez]
> * docker-disk: Update dind container to v19.03.10 [Michal Toman]
> * docker-disk: Update to still supported dind container [Gergely Imreh]
> * Use udev for setting up wlan power management [Michal Toman]
> * Use --mount instead of --volume for bind mounts to the supervisor container. [Robert Günzler]
> 
</details>

# v2.52.7+rev1
## (2020-07-13)


<details>
<summary> Update meta-balena from v2.52.6 to v2.52.7 [Florin Sarbu] </summary>

> ## meta-balena-2.52.7
> ### (2020-07-13)
> 
> 
> <details>
> <summary> Update balena-supervisor from v11.9.3 to v11.9.4 [Rich Bayliss] </summary>
> 
>> ### balena-supervisor-11.9.4
>> #### (2020-07-13)
>> 
>> * bug: Fix unhandled promise rejection [Rich Bayliss]
>> 
> </details>
> 
> 
</details>

# v2.52.6+rev1
## (2020-07-13)


<details>
<summary> Update meta-balena from v2.52.5 to v2.52.6 [Florin Sarbu] </summary>

> ## meta-balena-2.52.6
> ### (2020-07-13)
> 
> * Update to use api v6 and fix a quoting bug [Pagan Gazzard]
> 
</details>

# v2.52.5+rev1
## (2020-07-12)


<details>
<summary> Update meta-balena from v2.52.4 to v2.52.5 [Florin Sarbu] </summary>

> ## meta-balena-2.52.5
> ### (2020-07-10)
> 
> * Allow comments in iptables ruleset [Alex Gonzalez]
> 
</details>

# v2.52.4+rev1
## (2020-07-09)


<details>
<summary> Update meta-balena from v2.52.1 to v2.52.4 [Florin Sarbu] </summary>

> ## meta-balena-2.52.4
> ### (2020-07-09)
> 
> 
> <details>
> <summary> Update balena-supervisor from v11.4.10 to v11.9.3 [Cameron Diver] </summary>
> 
>> ### balena-supervisor-11.9.3
>> #### (2020-07-08)
>> 
>> * Fix bug where a promise was not resolved in db-format [Cameron Diver]
>> * Convert deviceConfig module to a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.9.2
>> #### (2020-07-06)
>> 
>> * avahi: Control with HOST_DISCOVERABILITY [Cameron Diver]
>> 
>> ### balena-supervisor-11.9.1
>> #### (2020-07-01)
>> 
>> * firewall: Add Host Firewall functionality [Rich Bayliss]
>> 
>> ### balena-supervisor-11.9.0
>> #### (2020-06-23)
>> 
>> * Added support for configuring FDT directive in extlinux.conf [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.8.4
>> #### (2020-06-22)
>> 
>> * state: Report device MAC address to the API [Rich Bayliss]
>> 
>> ### balena-supervisor-11.8.3
>> #### (2020-06-18)
>> 
>> 
>> <details>
>> <summary> Update pinejs-client-request to 7.x [Pagan Gazzard] </summary>
>> 
>>> #### pinejs-client-request-7.0.0
>>> ##### (2020-06-16)
>>> 
>>> * Empty commit to attempt republish [Pagan Gazzard]
>>> * Switch from bluebird-lru-cache to lru-cache for caching [Pagan Gazzard]
>>> * Update target to es2018 [Pagan Gazzard]
>>> * Remove bluebird dependency [Pagan Gazzard]
>>> * Convert to async/await [Pagan Gazzard]
>>> 
>>> <details>
>>> <summary> Update to pinejs-client-core 6.x [Pagan Gazzard] </summary>
>>> 
>>>> ##### pinejs-client-js-6.0.0
>>>> ###### (2020-06-04)
>>>> 
>>>> * Increase minimum es version to es2015 [Pagan Gazzard]
>>>> * Convert to async/await [Pagan Gazzard]
>>>> * Remove now unnecessary PinejsClientCoreFactory [Pagan Gazzard]
>>>> * Switch to using native promises [Pagan Gazzard]
>>>> * Drop support for deprecated request overrides [Pagan Gazzard]
>>>> * Drop support for deprecated `query` method [Pagan Gazzard]
>>>> * Drop support for deprecated string based requests [Pagan Gazzard]
>>>> * Use `;` for expand options instead of `&` [Pagan Gazzard]
>>>> 
>>> </details>
>>> 
>>> 
>>> #### pinejs-client-request-6.2.0
>>> ##### (2020-06-08)
>>> 
>>> * Lazy load bluebird-lru-cache and lodash [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.1.4
>>> ##### (2020-06-08)
>>> 
>>> * Convert some lodash usage to native versions [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.1.3
>>> ##### (2020-06-04)
>>> 
>>> * Remove unused dependencies [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.1.2
>>> ##### (2020-06-02)
>>> 
>>> 
>>> <details>
>>> <summary> Update dependencies [Pagan Gazzard] </summary>
>>> 
>>>> ##### pinejs-client-js-5.8.0
>>>> ###### (2020-05-29)
>>>> 
>>>> * Generate optional builds for es2015/es2018 as well as the default es5 [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.7.1
>>>> ###### (2020-05-25)
>>>> 
>>>> * Update dependencies [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.7.0
>>>> ###### (2020-04-15)
>>>> 
>>>> * Make transformGetResult a method , to ease overriding the get method [Thodoris Greasidis]
>>>> 
>>> </details>
>>> 
>>> 
>>> #### pinejs-client-request-6.1.1
>>> ##### (2020-03-19)
>>> 
>>> * Add linting [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.1.0
>>> ##### (2020-03-19)
>>> 
>>> * Move require-npm4-to-publish to dev dependencies [Pagan Gazzard]
>>> 
>>> <details>
>>> <summary> Update dependencies [Pagan Gazzard] </summary>
>>> 
>>>> ##### typed-error-3.2.0
>>>> ###### (2019-11-20)
>>>> 
>>>> * update deps and specify minimum engine requirements [Will Boyce]
>>>> 
>>>> ##### pinejs-client-js-5.6.11
>>>> ###### (2020-02-21)
>>>> 
>>>> * 🐛: Fix missing `deprecated.getStringParams` function [Andreas Fitzek]
>>>> 
>>>> ##### pinejs-client-js-5.6.10
>>>> ###### (2020-02-14)
>>>> 
>>>> * Update to resin-lint 3.x [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.9
>>>> ###### (2020-02-14)
>>>> 
>>>> * CircleCI: Remove deploy job as it's handled by balenaCI [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.8
>>>> ###### (2020-02-14)
>>>> 
>>>> * Add the missing `method` on the post method [Thodoris Greasidis]
>>>> 
>>>> ##### pinejs-client-js-5.6.7
>>>> ###### (2020-02-14)
>>>> 
>>>> * Deprecate request overrides [Pagan Gazzard]
>>>> * Deprecate queries using a string url [Pagan Gazzard]
>>>> * Deprecate `query` in favor of `get` [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.6
>>>> ###### (2020-02-14)
>>>> 
>>>> * Allow resource/$count in $filter [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.5
>>>> ###### (2020-01-30)
>>>> 
>>>> * Remove `defaults` helper in favour of `??` [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.4
>>>> ###### (2020-01-30)
>>>> 
>>>> * Avoid allocations when destroying a poll [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.3
>>>> ###### (2020-01-30)
>>>> 
>>>> * Improve `RawFilter` typing [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.2
>>>> ###### (2020-01-29)
>>>> 
>>>> * Update dependencies [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.1
>>>> ###### (2020-01-22)
>>>> 
>>>> * Switch most CODEOWNERS entries to a team [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.0
>>>> ###### (2019-07-12)
>>>> 
>>>> * Add 'upsert' method supporting natural keys, requires Pinejs ^10.19.1 [Thodoris Greasidis]
>>>> 
>>>> ##### pinejs-client-js-5.5.4
>>>> ###### (2019-06-18)
>>>> 
>>>> * Remove unnecessary `string` type that is handled by the `Params` type [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.5.3
>>>> ###### (2019-06-18)
>>>> 
>>>> * Use an .npmrc to prevent creating a package-lock on each install [Thodoris Greasidis]
>>>> 
>>>> ##### pinejs-client-js-5.5.2
>>>> ###### (2019-06-10)
>>>> 
>>>> * Add some type casting so that it compiles on TypeScript 3.5 [Thodoris Greasidis]
>>>> 
>>>> ##### pinejs-client-js-5.5.1
>>>> ###### (2019-05-15)
>>>> 
>>>> * Fix downstream declaration creation errors due to `Dictionary` [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.5.0
>>>> ###### (2019-05-15)
>>>> 
>>>> * Add a prepare method that prepares a query into a function [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.4.1
>>>> ###### (2019-05-10)
>>>> 
>>>> * Add CODEOWNERS [Gergely Imreh]
>>>> 
>>>> ##### pinejs-client-js-5.4.0
>>>> ###### (2019-05-10)
>>>> 
>>>> * Add support for parameter aliases in resource ids [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.3.10
>>>> ###### (2019-05-10)
>>>> 
>>>> * Deduplicate transformation of GET results [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.3.9
>>>> ###### (2019-05-10)
>>>> 
>>>> * Simplify how we expose types, which means `subscribe` is now exposed [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.3.8
>>>> ###### (2019-05-09)
>>>> 
>>>> * Add automatic formatting via prettier [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.3.7
>>>> ###### (2019-05-08)
>>>> 
>>>> * Remove node 4 build, add node 12 [Pagan Gazzard]
>>>> * Add .versionbot/CHANGELOG.yml for downstream changelogs [Pagan Gazzard]
>>>> 
>>> </details>
>>> 
>>> 
>>> #### pinejs-client-request-6.0.3
>>> ##### (2020-01-22)
>>> 
>>> * Add CODEOWNERS [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.0.2
>>> ##### (2019-05-08)
>>> 
>>> * Add node 12 tests [Pagan Gazzard]
>>> * Add upstream for pinejs-client-core [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.0.1
>>> ##### (2019-04-23)
>>> 
>>> * Update target to es2016, part of/fixing the typed-error bump [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.0.0
>>> ##### (2019-04-17)
>>> 
>>> * typed-error: Update to v3.1.0 [Will Boyce]
>>> 
>> </details>
>> 
>> 
>> ### balena-supervisor-11.8.2
>> #### (2020-06-17)
>> 
>> * Make service-manager module a singleton [Cameron Diver]
>> * Make volume-manager module a singleton [Cameron Diver]
>> * Make network-manager module a singleton [Cameron Diver]
>> * Add supervisor upgrade document [Hugh Brown]
>> 
>> ### balena-supervisor-11.8.1
>> #### (2020-06-16)
>> 
>> * Update webpack dependencies [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.8.0
>> #### (2020-06-16)
>> 
>> * Use API v6 [Akis Kesoglou]
>> 
>> ### balena-supervisor-11.7.3
>> #### (2020-06-15)
>> 
>> * Db-format module code fixups [Cameron Diver]
>> 
>> ### balena-supervisor-11.7.2
>> #### (2020-06-11)
>> 
>> * Add label to expose gpu to container [Robert Günzler]
>> 
>> ### balena-supervisor-11.7.1
>> #### (2020-06-11)
>> 
>> * Move database app processing out to its own module [Cameron Diver]
>> * Make target-state-cache a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.7.0
>> #### (2020-06-10)
>> 
>> * Respect an initialDeviceName field in the config.json [Cameron Diver]
>> 
>> ### balena-supervisor-11.6.6
>> #### (2020-06-10)
>> 
>> * Make images module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.6.5
>> #### (2020-06-09)
>> 
>> * fix: API auth missing on state GET/PATCH [Rich Bayliss]
>> 
>> ### balena-supervisor-11.6.4
>> #### (2020-06-08)
>> 
>> * Refactored @ts-ignore to @ts-expect-error in test file [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.6.3
>> #### (2020-06-08)
>> 
>> * Make logger module a singleton [Cameron Diver]
>> * Fix exponential backoff for state polling [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.6.2
>> #### (2020-06-08)
>> 
>> * Make the event-tracker module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.6.1
>> #### (2020-06-05)
>> 
>> * Convert all test files to TS and add .spec to all filenames [Miguel Casqueira]
>> * fix: Pin alpine python version [Rich Bayliss]
>> 
>> ### balena-supervisor-11.6.0
>> #### (2020-06-03)
>> 
>> * Isolate target state fetching to its own module which emits on update [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.5.3
>> #### (2020-06-02)
>> 
>> * Make docker module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.5.2
>> #### (2020-06-02)
>> 
>> * Make the config module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.5.1
>> #### (2020-06-01)
>> 
>> * Remove unused dependencies and dedupe [Cameron Diver]
>> 
>> ### balena-supervisor-11.5.0
>> #### (2020-05-29)
>> 
>> * Refactor device-state healthchecks to log reason for failure [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.4.17
>> #### (2020-05-29)
>> 
>> * Update dependencies [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.4.16
>> #### (2020-05-29)
>> 
>> * Make the db module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.4.15
>> #### (2020-05-26)
>> 
>> * Check for ApiError before using it as such [Cameron Diver]
>> 
>> ### balena-supervisor-11.4.14
>> #### (2020-05-21)
>> 
>> * check for 409 status code, rather than string matching uuid conflicts [Cameron Diver]
>> 
>> ### balena-supervisor-11.4.13
>> #### (2020-05-21)
>> 
>> * Use safeStateClone to avoid call-stack exceeding errors [Cameron Diver]
>> 
>> ### balena-supervisor-11.4.12
>> #### (2020-05-19)
>> 
>> * Improved handling of invalid appId in V2 state endpoint [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.4.11
>> #### (2020-05-18)
>> 
>> * Switch to balenaApi for the state patch as patching cannot be cached [Pagan Gazzard]
>> 
> </details>
> 
> 
> ## meta-balena-2.52.3
> ### (2020-07-09)
> 
> * systemd: Simplify zram swap unit dependencies to avoid ordering cycle [Alex Gonzalez]
> 
> ## meta-balena-2.52.2
> ### (2020-07-06)
> 
> * kernel-resin: Make USB_SERIAL and USB_SERIAL_GENERIC built-ins [Alex Gonzalez]
> * kernel-resin: Fix configuration warnings from newer kernels [Alex Gonzalez]
> * kernel-resin: Update balena kernel configuration for updated engine [Alex Gonzalez]
> 
</details>

# v2.52.1+rev2
## (2020-07-08)

* Add custom dts for AD5446 DAC support on balenaFin [Florin Sarbu]

# v2.52.1+rev1
## (2020-07-02)


<details>
<summary> Update meta-balena from v2.51.8 to v2.52.1 [Florin Sarbu] </summary>

> ## meta-balena-2.52.1
> ### (2020-07-02)
> 
> * Fix up UUID variable when communicating with API [Matthew McGinn]

> ## meta-balena-2.52.0
> ### (2020-06-30)
> 
> * Add compressed memory swap support [Alex Gonzalez]
> * systemd-zram-swap: Add compressed memory swap support [Alex Gonzalez]
> * kernel-resin: Built-in zram configuration [Alex Gonzalez]
</details>

# v2.51.8+rev1
## (2020-07-01)

* Update balena-yocto-scripts to v1.8.0 [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.51.1 to v2.51.8 [Florin Sarbu] </summary>

> ## meta-balena-2.51.8
> ### (2020-06-30)
> 
> * resin-ntp-config: merge 'burst' command with 'add server' line [Mark Corbin]

> ## meta-balena-2.51.7
> ### (2020-06-25)
> 
> * resin-image: Install extra_uEnv.txt in boot partition [Alexandru Costache]

> ## meta-balena-2.51.6
> ### (2020-06-25)
> 
> * initrdscripts: rootfs: Fix comparison to account for empty variable [Alex Gonzalez]
> * Use UUID rather than ID when communicating with API [Matthew McGinn]

> ## meta-balena-2.51.5
> ### (2020-06-18)
> 
> * Set chrony default servers as pools [Matthew McGinn]

> ## meta-balena-2.51.4
> ### (2020-06-15)
> 
> * Generate nested changelogs for balena-engine [Robert Günzler]

> ## meta-balena-2.51.3
> ### (2020-06-10)
> 
> * Revert allowing local resin-supervisor image updates [Alex Gonzalez]

> ## meta-balena-2.51.2
> ### (2020-06-08)
> 
> * Disable u-boot console, silence u-boot in production builds [Florin Sarbu]
</details>

# v2.51.1+rev2
## (2020-06-26)

* Update the raspberry pi kernel to version 4.19.118 so we are in sync with Raspberry Pi OS based on Debian Buster (released on 2020-05-27) [Florin Sarbu]
* Update the boot firmware to the 20200512 drop to match Raspberry Pi OS based on Debian Buster (released on 2020-05-27) [Florin Sarbu]

# v2.51.1+rev1
## (2020-06-04)


<details>
<summary> Update meta-balena from v2.50.4 to v2.51.1 [Florin Sarbu] </summary>

> ## meta-balena-2.51.1
> ### (2020-06-04)
> 
> * openvpn: Add runtime dependency on bash [Willem Remie]

> ## meta-balena-2.51.0
> ### (2020-06-03)
> 
> * balena-engine: Update to 19.03.13 [Robert Günzler]
</details>

# v2.50.4+rev2
## (2020-06-04)

* Fix bluetooth and mlan loading order for the balenaFin [Florin Sarbu]

# v2.50.4+rev1
## (2020-06-03)


<details>
<summary> Update meta-balena from v2.50.1 to v2.50.4 [Florin Sarbu] </summary>

> ## meta-balena-2.50.4
> ### (2020-06-02)
> 
> * Use correct SRC_URI for bindmount [Florin Sarbu]

> ## meta-balena-2.50.3
> ### (2020-06-01)
> 
> * os-helpers-fs: Fix shellcheck warnings [Alex Gonzalez]
> * Fallback to label root device matching to support devices with closed source bootloaders [Alex Gonzalez]
> * Fallback to labels and partlabels for devices with custom HUPs [Alex Gonzalez]

> ## meta-balena-2.50.2
> ### (2020-05-27)
> 
> * Enable the Analog Devices AD5446 kernel driver [Florin Sarbu]
</details>

# v2.50.1+rev1
## (2020-05-26)

* Update balena-yocto-scripts to v1.7.2 [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.48.0 to v2.50.1 [Florin Sarbu] </summary>

> ## meta-balena-2.50.1
> ### (2020-05-21)
> 
> * networkmanager: Remove build warning [Alex Gonzalez]
> * Remove busybox-syslog to use only systemd's journald [Alex Gonzalez]
> * Update CODEOWNERS [Alex Gonzalez]
> * Backport NM patch for setting modem MTU correctly [Florin Sarbu]
> * update-resin-supervisor: short circuit if remote image cannot be fetched [Matthew McGinn]
> 
<details>
<summary> Update balena-supervisor from v11.4.1 to v11.4.10 [Cameron Diver] </summary>

>> ### balena-supervisor-11.4.10
>> #### (2020-05-18)
>> 
>> * Fix leftover spurious return from typescript conversion [Cameron Diver]

>> ### balena-supervisor-11.4.9
>> #### (2020-05-18)
>> 
>> * Catch errors in the target state poll so polling will always continue [Pagan Gazzard]

>> ### balena-supervisor-11.4.8
>> #### (2020-05-18)
>> 
>> * Avoid querying `instantUpdates` on every state poll [Pagan Gazzard]

>> ### balena-supervisor-11.4.7
>> #### (2020-05-16)
>> 
>> * Fix default request options [Pagan Gazzard]

>> ### balena-supervisor-11.4.6
>> #### (2020-05-15)
>> 
>> * Remove CoffeeScript tests and all CoffeeScript tools [Miguel Casqueira]

>> ### balena-supervisor-11.4.5
>> #### (2020-05-15)
>> 
>> * Update to @balena/lint 5.x [Pagan Gazzard]

>> ### balena-supervisor-11.4.4
>> #### (2020-05-15)
>> 
>> * Add a random offset to the poll interval with each poll [Cameron Diver]

>> ### balena-supervisor-11.4.3
>> #### (2020-05-14)
>> 
>> * Cache service names in local log backend [Cameron Diver]

>> ### balena-supervisor-11.4.2
>> #### (2020-05-13)
>> 
>> * Update engine information in package.json [Cameron Diver]
</details>

> 

> ## meta-balena-2.50.0
> ### (2020-05-13)
> 
> * Use /tmp as bootparam_root storage [Alex Gonzalez]
> * Update to libqmi v1.24.10 [Michal Toman]
> * Set rust 1.36 as the preferred rust version from meta-balena-common [Zubair Lutfullah Kakakhel]
> * Turn off wlan0 power save [Michal Toman]
> 
<details>
<summary> Update os-config from 1.1.3 to 1.1.4 [Alex Gonzalez] </summary>

>> ### os-config-1.1.4
>> #### (2020-05-13)
>> 
>> * versionbot: Add changelog yml file [Alex Gonzalez]
</details>

> 
> 
<details>
<summary> Update balena-supervisor from v11.3.0 to v11.4.1 [Cameron Diver] </summary>

>> ### balena-supervisor-11.4.1
>> #### (2020-05-12)
>> 
>> * Correctly check if value is a valid Integer [Miguel Casqueira]

>> ### balena-supervisor-11.4.0
>> #### (2020-05-12)
>> 
>> * Added endpoint to check if VPN is connected [Miguel Casqueira]

>> ### balena-supervisor-11.3.11
>> #### (2020-05-11)
>> 
>> * Fixed stubs for test suite [Miguel Casqueira]

>> ### balena-supervisor-11.3.10
>> #### (2020-05-11)
>> 
>> * Added more documentation to help new contributors start developing [Miguel Casqueira]

>> ### balena-supervisor-11.3.9
>> #### (2020-05-11)
>> 
>> * Fix dindctl script and update balenaos-in-container [Cameron Diver]

>> ### balena-supervisor-11.3.8
>> #### (2020-05-08)
>> 
>> * Remove unnecessary config.json keys [Pagan Gazzard]

>> ### balena-supervisor-11.3.7
>> #### (2020-05-08)
>> 
>> * CI: Use node 12 for tests to match runtime version [Pagan Gazzard]
>> * CI: Use docker 18 client to match remote [Pagan Gazzard]

>> ### balena-supervisor-11.3.6
>> #### (2020-05-07)
>> 
>> * Move SupervisorAPI state change logs to appropriate functions [Miguel Casqueira]

>> ### balena-supervisor-11.3.5
>> #### (2020-05-07)
>> 
>> * Add 20k-ultra to codeowners [Miguel Casqueira]

>> ### balena-supervisor-11.3.4
>> #### (2020-05-06)
>> 
>> * Don't use the openvpn alias to check VPN status [Cameron Diver]

>> ### balena-supervisor-11.3.3
>> #### (2020-05-06)
>> 
>> * Use lstat rather than stat to avoid error with symlinks in sync [Cameron Diver]

>> ### balena-supervisor-11.3.2
>> #### (2020-05-05)
>> 
>> * Move build files into build-conf and rename to build-utils [Cameron Diver]
>> * Fix knex migration require translation [Cameron Diver]

>> ### balena-supervisor-11.3.1
>> #### (2020-05-05)
>> 
>> * Remove legacy fallback to DROP rule in iptables [Cameron Diver]
>> * Add an ESTABLISHED flag to API iptables rules [Cameron Diver]
>> * Add ESR information to repo.yml [Cameron Diver]
</details>

> 
> 
<details>
<summary> Update balena-supervisor from v10.11.0 to v11.3.0 [Cameron Diver] </summary>

>> ### balena-supervisor-11.3.0
>> #### (2020-05-04)
>> 
>> * Added Bearer Authorization spec [Miguel Casqueira]

>> ### balena-supervisor-11.2.0
>> #### (2020-04-30)
>> 
>> * Added explanation README for running specific tests [Miguel Casqueira]

>> ### balena-supervisor-11.1.11
>> #### (2020-04-28)
>> 
>> * Remove coverage running and modules [Cameron Diver]

>> ### balena-supervisor-11.1.10
>> #### (2020-04-27)
>> 
>> * Update balena-register-device to fix provisioning [Cameron Diver]

>> ### balena-supervisor-11.1.9
>> #### (2020-04-22)
>> 
>> * Added protocol to semver.org link [Miguel Casqueira]

>> ### balena-supervisor-11.1.8
>> #### (2020-04-21)
>> 
>> * Actually remove dbus-native dependency [Cameron Diver]

>> ### balena-supervisor-11.1.7
>> #### (2020-04-21)
>> 
>> * Fix livepush predicate for POSIX sh in entry.sh [Cameron Diver]

>> ### balena-supervisor-11.1.6
>> #### (2020-04-21)
>> 
>> * Remove double printing of API status error [Cameron Diver]

>> ### balena-supervisor-11.1.5
>> #### (2020-04-15)
>> 
>> * ⤴️ Upgrade migrations to work with knex [Cameron Diver]
>> * 📄 Upgrade knex to avoid CVE-2019-10757 [Cameron Diver]

>> ### balena-supervisor-11.1.4
>> #### (2020-04-14)
>> 
>> * 🔎 Also watch js files during livepush [Cameron Diver]
>> * Clear changed files after successful livepush invocation [Cameron Diver]
>> * Use livepush commands for copying and running dev specific steps [Cameron Diver]

>> ### balena-supervisor-11.1.3
>> #### (2020-04-13)
>> 
>> * 🚀 Update supervisor to node12 [Cameron Diver]

>> ### balena-supervisor-11.1.2
>> #### (2020-04-13)
>> 
>> * Move from dbus-native to dbus [Cameron Diver]

>> ### balena-supervisor-11.1.1
>> #### (2020-04-10)
>> 
>> * Update copy-webpack-plugin [Pagan Gazzard]
>> * Update ts-loader to 6.x [Pagan Gazzard]
>> * Update fork-ts-checker-webpack-plugin to 4.x [Pagan Gazzard]

>> ### balena-supervisor-11.1.0
>> #### (2020-04-09)
>> 
>> * Support matching on device type within contracts [Cameron Diver]

>> ### balena-supervisor-11.0.9
>> #### (2020-04-08)
>> 
>> * Workaround a circular dependency [Pagan Gazzard]

>> ### balena-supervisor-11.0.8
>> #### (2020-04-08)
>> 
>> * Link sqlite with a system sqlite for quicker builds [Cameron Diver]

>> ### balena-supervisor-11.0.7
>> #### (2020-04-08)
>> 
>> * Convert application-manager.coffee to javascript [Pagan Gazzard]

>> ### balena-supervisor-11.0.6
>> #### (2020-04-08)
>> 
>> * Don't sync test files with livepush [Cameron Diver]

>> ### balena-supervisor-11.0.5
>> #### (2020-04-07)
>> 
>> * Add newTargetState event and use it for backup loading [Cameron Diver]

>> ### balena-supervisor-11.0.4
>> #### (2020-04-07)
>> 
>> * Don't wrap UpdatesLockedErrors with a detailed error [Cameron Diver]

>> ### balena-supervisor-11.0.3
>> #### (2020-04-07)
>> 
>> * Allow spaces in volume definitions [Cameron Diver]

>> ### balena-supervisor-11.0.2
>> #### (2020-04-06)
>> 
>> * Update to balena-register-device 6.0.1 [Pagan Gazzard]

>> ### balena-supervisor-11.0.1
>> #### (2020-04-06)
>> 
>> * Don't mangle names when minimising with webpack [Cameron Diver]

>> ### balena-supervisor-11.0.0
>> #### (2020-04-06)
>> 
>> * ⚡ Update synchronisation scripts for supervisor development [Cameron Diver]
>> * 🔧 Move to an alpine base image and drop i386-nlp support [Cameron Diver]

>> ### balena-supervisor-10.11.3
>> #### (2020-04-02)
>> 
>> * Convert test/18-startup.coffee to typescript [Pagan Gazzard]
>> * Convert test/19-compose-utils.coffee to javascript [Pagan Gazzard]
>> * Convert test/18-compose-network.coffee to javascript [Pagan Gazzard]
>> * Convert test/17-config-utils.spec.coffee to javascript [Pagan Gazzard]
>> * Convert test/16-ports.spec.coffee to typescript [Pagan Gazzard]
>> * Convert test/15-conversions.spec.coffee to javascript [Pagan Gazzard]
>> * Convert test/12-logger.spec.coffee to javascript [Pagan Gazzard]

>> ### balena-supervisor-10.11.2
>> #### (2020-03-31)
>> 
>> * Pass in deviceId when fetching device tags [Cameron Diver]

>> ### balena-supervisor-10.11.1
>> #### (2020-03-30)
>> 
>> * 🔧 Update resin-lint -> balena-lint in lintstaged [Cameron Diver]
</details>

> 
> 
<details>
<summary> Update os-config from 1.1.1 to 1.1.3 [Zubair Lutfullah Kakakhel] </summary>

>> ### os-config-1.1.3
>> #### (2020-03-24)
>> 
>> * Reorder module dependencies [Zahari Petkov]
>> * Pin serde version to v1.0.94 [Zahari Petkov]

>> ### os-config-1.1.2
>> #### (2020-02-04)
>> 
>> * Block on random until success [Zahari Petkov]
>> * Use parse_filters instead of parse [Zubair Lutfullah Kakakhel]
</details>

> 

> ## meta-balena-2.49.0
> ### (2020-05-01)
> 
> * balena-host: Ignore environment file if it does not exist [Alex Gonzalez]
> * Bump balena-engine to 18.09.17 [Robert Günzler]
> * networkmanager: Use absolute path in drop-in [Sven Schwermer]
> * Update ModemManager to v1.12.8 [Michal Toman]
> * Update balena-engine to 18.09.16 [Robert Günzler]
> * Add support for using udev by-state links in balenaOS [Alex Gonzalez]
> * Add initramfs module to regenerate default filesystem UUIDs [Alex Gonzalez]
> * Create udev state symlinks for all partitions [Alex Gonzalez]
> * initramfs-framework: Add os-helpers to module prepare [Alex Gonzalez]
> * Fix initramfs fsck warnings for the boot partition [Andrei Gherzan]
> * Switch to built-in FAT kernel configs [Andrei Gherzan]
> 
<details>
<summary> Update balena-supervisor from v10.8.0 to v10.11.0 [Cameron Diver] </summary>

>> ### balena-supervisor-10.11.0
>> #### (2020-03-30)
>> 
>> * Add BALENA_DEVICE_ARCH environment variable for containers [Cameron Diver]

>> ### balena-supervisor-10.10.15
>> #### (2020-03-30)
>> 
>> * Don't throw an error when getting an unhealthy state [Cameron Diver]

>> ### balena-supervisor-10.10.14
>> #### (2020-03-28)
>> 
>> * Convert src/device-api/common.coffee to javascript [Pagan Gazzard]

>> ### balena-supervisor-10.10.13
>> #### (2020-03-27)
>> 
>> * Switch to mz for the proxyvisor [Pagan Gazzard]
>> * Convert proxyvisor to javascript [Pagan Gazzard]

>> ### balena-supervisor-10.10.12
>> #### (2020-03-26)
>> 
>> * Remove unnecessary code from application-manager [Pagan Gazzard]
>> * Switch to a named export for application-manager [Pagan Gazzard]

>> ### balena-supervisor-10.10.11
>> #### (2020-03-25)
>> 
>> * Convert device-api/v1 to javascript [Pagan Gazzard]

>> ### balena-supervisor-10.10.10
>> #### (2020-03-24)
>> 
>> * Update livepush [Cameron Diver]

>> ### balena-supervisor-10.10.9
>> #### (2020-03-24)
>> 
>> * Add type checking for javascript files [Pagan Gazzard]

>> ### balena-supervisor-10.10.8
>> #### (2020-03-24)
>> 
>> * Pin resin-cli-visuals to avoid build error of lzma-native [Cameron Diver]
>> * Update dependencies [Cameron Diver]

>> ### balena-supervisor-10.10.7
>> #### (2020-03-24)
>> 
>> * Avoid any transpilation of node_modules [Pagan Gazzard]

>> ### balena-supervisor-10.10.6
>> #### (2020-03-24)
>> 
>> * Add transpilation for javascript files to ease node 6 compatibility [Pagan Gazzard]
>> * Add a precheck that linting/tests work on node 10 [Pagan Gazzard]
>> * Update to balena-lint and enable javascript linting [Pagan Gazzard]

>> ### balena-supervisor-10.10.5
>> #### (2020-03-23)
>> 
>> * Tests: Add missing await [Pagan Gazzard]

>> ### balena-supervisor-10.10.4
>> #### (2020-03-16)
>> 
>> * docs: Clarify update locks for multicontainer applications [Gareth Davies]

>> ### balena-supervisor-10.10.3
>> #### (2020-03-16)
>> 
>> * logging: fix up some typos [Matthew McGinn]

>> ### balena-supervisor-10.10.2
>> #### (2020-03-16)
>> 
>> * Bump acorn from 5.7.3 to 5.7.4 [dependabot[bot]]

>> ### balena-supervisor-10.10.1
>> #### (2020-03-13)
>> 
>> * Update dependencies [Pagan Gazzard]

>> ### balena-supervisor-10.10.0
>> #### (2020-03-06)
>> 
>> * Allow semver comparison on l4t versions in contracts [Cameron Diver]
>> * Allow l4t versions with three numbers as well as two [Cameron Diver]

>> ### balena-supervisor-10.9.2
>> #### (2020-03-05)
>> 
>> * config: Support loading SSDT via ConfigFS [Rich Bayliss]

>> ### balena-supervisor-10.9.1
>> #### (2020-02-25)
>> 
>> * Convert device-state module to typescript [Cameron Diver]
>> * Improve application-manager typings [Cameron Diver]
>> * Improve and extend internal typings [Cameron Diver]

>> ### balena-supervisor-10.9.0
>> #### (2020-02-24)
>> 
>> * Add a containerId request parameter for journal-logs api endpoint, and pass it along to journalctl process options. [Ivan]
</details>

> 
</details>

# v2.48.0+rev6
## (2020-05-12)

* Added overlays/waveshare-sim7600.dtbo to layer.conf [Martijn Mellema]
* Add the device tree overlay for the Waveshare SIM7600 modem [Martijn Mellema]

# v2.48.0+rev5
## (2020-05-12)

* Set private to false in .coffee files for the public device types [Florin Sarbu]

# v2.48.0+rev4
## (2020-04-24)

* Use compressed kernel images to boot the RaspberryPi4-64 [Alex Gonzalez]

# v2.48.0+rev3
## (2020-04-16)

* Enable Kvaser's USB CAN driver as a module. [Adolfo E. García Castro]

# v2.48.0+rev2
## (2020-03-27)

* u-boot: Fix FAT WRITE issue for bootcount [Alexandru Costache]

# v2.48.0+rev1
## (2020-03-23)

* u-boot: Prevent blocking writes to serial console [Alexandru Costache]

<details>
<summary> Update meta-balena from v2.47.1 to v2.48.0 [Florin Sarbu] </summary>

> ## meta-balena-2.48.0
> ### (2020-03-20)
> 
> * Add the linux-firmware recipe from the Poky zeus-22.0.1 release and package various iwlwifi firmware separately [Florin Sarbu]
> * Add regulatory.db (Wireless Central Regulatory Domain Database) to rootfs so kernel versions >= v4.15 can load it (for Poky Thud and Warrior based board) [Florin Sarbu]
> * Do not send SIGKILL directly to user containers (set KillMode=process in balena.service) [Florin Sarbu]
> * Update balena-supervisor from  to v10.8.0 [Cameron Diver]
> * Update config.json documentation for disabling NM connectivity checks [Gareth Davies]
> * Fix a typo in a NetworkManager plugin path [Zubair Lutfullah Kakakhel]
> * Remove unnecessary openvpn v2.4.4 recipe in meta-resin-pyro. [Zubair Lutfullah Kakakhel]
> * Use a weak default assignment in a recipe for customer trying to override a variable in his layer [Zubair Lutfullah Kakakhel]
</details>

# v2.47.1+rev2
## (2020-03-09)

* Add a 3 second delay for loading the mlan kernel driver in order to avoid wifi crash at start-up for the Balena Fin [Florin Sarbu]

# v2.47.1+rev1
## (2020-02-29)

* Update balena-yocto-scripts to v1.5.6 [Florin Sarbu]
* Add new recipe for sd8887-mrvl wifi/bt prebuilt binaries [Florin Sarbu]
* Update sd8887-mrvl to releases 15.68.19.p33 for wlan and 15.26.19.p33 for bt [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.47.0 to v2.47.1 [Florin Sarbu] </summary>

> ## meta-balena-2.47.1
> ### (2020-02-13)
> 
> * Affects 2.45+ on all devices. Fix dangling sshd services on failed connections that would grow and cause cpu load to keep rising. See issue 1837 in meta-balena for more detail. [Zubair Lutfullah Kakakhel]
</details>

# v2.47.0+rev9
## (2020-02-28)

* Update steps to power device during flashing for Fin versions. [Gareth Davies]
* Update links to getting started guide from resin.io to balena.io [Gareth Davies]

# v2.47.0+rev8
## (2020-02-27)

* Update the boot firmware to 20200220 drop so we fix a rpi4 kernel issue when doing video playback in a continuous loop [Florin Sarbu]

# v2.47.0+rev7
## (2020-02-25)

* Update BSP to latest warrior so we now have kernel 4.19.75 [Florin Sarbu]

# v2.47.0+rev6
## (2020-02-10)

* Update meta-rust to include 1.36 [Zubair Lutfullah Kakakhel]

# v2.47.0+rev5
## (2020-02-06)

* Add the uart2 to uart5 overlays to rootfs [Florin Sarbu]

# v2.47.0+rev4
## (2020-02-06)

* Update balena-yocto-scripts to v1.5.4 [Florin Sarbu]

# v2.47.0+rev3
## (2020-02-06)

* Update meta-rust to include 1.36 [Zubair Lutfullah Kakakhel]

# v2.47.0+rev2
## (2020-02-05)

* Update links to getting started guide from resin.io to balena.io [Gareth Davies]

# v2.47.0+rev1
## (2020-01-31)

* Add to rootfs the gpio-ir-tx overlay [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.46.1 to v2.47.0 [Florin Sarbu] </summary>

> ## meta-balena-2.47.0
> ### (2020-01-29)
> 
> * Update usb-modeswitch-data to version 20191128 [Florin Sarbu]
> * Update usb-modeswitch to version 2.5.2 [Florin Sarbu]
> * Update to ModemManager v1.12.4 [Florin Sarbu]
> * Update libmbim to version 1.22.0 [Florin Sarbu]
> * Update libqmi to version 1.24.4 [Florin Sarbu]
> * Add periodic vacuuming of journald log files [Alex Gonzalez]
> * No user impact. Increase limit for maximum initramfs size from 12MB to 32MB. This helps reduce unnecessary overrides in integration layers. [Zubair Lutfullah Kakakhel]
> * Match licenses with license files. [Alex Gonzalez]
> * Enable sixaxis support in bluez5 [Alexis Svinartchouk]
> * Addressing review comments [Gareth Davies]
> * Update config.json documentation [Gareth Davies]
> * Increase DNS clients timeout to 15 seconds [Alex Gonzalez]
> * Fix supervisor nested changelogs [Zubair Lutfullah Kakakhel]
> * Enable memory overcommit [Alex Gonzalez]
> * Add uinput kernel module [Florin Sarbu]
> * Make sure to add in rootfs the wifi firmware for wl18xx [Florin Sarbu]
> * Add supported USB WiFi dongle [Vicentiu Galanopulo]

> ## meta-balena-2.46.2
> ### (2020-01-17)
> 
> * Americanize the README.md [Matthew McGinn]
</details>

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
