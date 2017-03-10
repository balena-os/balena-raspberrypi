Change log
-----------

* Load the i2c-dev kernel module at startup [Michal]

# v2.0.0-beta13.rev3 - 2017-03-03

* Deploy all available overlay dt files for Raspberry Pi [Michal]

# v2.0.0-beta13.rev2 - 2017-03-01

* Include linux-firmware-bcm43430 for all RaspberryPi boards [Andrei]

# v2.0.0-beta13.rev1 - 2017-02-28

* Update to Morty [Michal]

# v2.0.0-beta12.rev1 - 2017-02-27

* Bump resin-yocto-scripts to current HEAD [Andrei]
* Update meta-resin to v2.0.0-beta.12 [Andrei]
* Don't load audio module (snd_bcm2835) automatically [Andrei]

# v2.0.0-beta11.rev1 - 2017-02-15

* Update meta-resin to v2.0.0-beta.11 [Andrei]

# v2.0.0-beta10.rev1 - 2017-02-14

* Update meta-resin to v2.0.0-beta.10 [Andrei]

# v2.0.0-beta.9 - 2017-02-08

* Update meta-resin to v2.0-beta.9 [Andrei]

# v2.0.0-beta.8 - 2017-01-29

* Update meta-resin to v2.0-beta.8 [Andrei]
* Update resin-yocto-scripts to HEAD of the master branch [Florin]
* Update the bootloader to the latest version, this adds support for rpi2 rev1.2 [Michal]

# v2.0.0-beta.7 - 2016-12-05

* Update meta-resin to v2.0-beta.7 [Florin]

# v2.0.0-beta.6 - 2016-12-05

* Update meta-resin to v2.0-beta.6 [Andrei]

# v2.0.0-beta.5 - 2016-11-30

* Update meta-resin to v2.0-beta.5 [Andrei]
* Autoload the rpi watchdog kernel module (bcm2708_wdog) [Florin]

# v2.0.0-beta.3 - 2016-11-07

* Update meta-resin to v2.0-beta.3 [Andrei]
* Cleanup docker-resin-supervisor-disk of unneeded variables [Andrei]
* Update resin-yocto-scripts to fix logging in container builds

# v2.0.0-beta.2 - 2016-11-01

* Update meta-resin to v2.0-beta.2 [Florin]
* Don't compress kernel modules [Michal]

# v2.0.0-beta.1 - 2016-10-11

* Update meta-resin to v2.0-beta.1 [Andrei]
* Add meta-filesystem as we need aufs-utils [Andrei]
* Add build support for resinos [Andrei]
* Update resin-yocto-script to include changes in our image types [Theodor]
* Replace the concept of a debug image with a development image [Theodor]
* Update meta-resin to include avahi [Florin]
* Update resin-yocto-scripts to include kernel headers handling as gzip [Florin]

# v1.16.1 - 2016-10-01

* Update meta-resin to include supervisor v2.5.0 [Pablo]

# v1.16.0 - 2016-09-27

* Update meta-resin to v1.16 [Florin]

# v1.15.0 - 2016-09-24

* Update meta-resin to v1.15 [Florin]

# v1.14.0 - 2016-09-23

* Update meta-resin to v1.14 [Florin]

# v1.13.0 - 2016-09-23

* Update meta-resin to v1.13 [Florin]

# v1.12.0 - 2016-09-21

* Update meta-resin to v1.12 [Florin]
* Update resin-yocto-scripts to include resinhup upload to dockerhub [Florin]
* Update meta-resin [Florin]
* Change .coffee to announce partition 1 now holds config.json and also introduce versioning (v1) [Florin]

# v1.11.0 - 2016-08-31

* Update meta-resin to v1.11 [Florin]

# v1.10.0 - 2016-08-24

* Update meta-resin to v1.10 [Florin]

# v1.9.0 - 2016-08-24

* Update meta-resin to v1.9 [Florin]
* Update resin-yocto-scripts for including kernel modules headers deploy [Florin]
* Update yocto-resin-scripts for host nodejs detection improvements [Florin]

# v1.8.0 - 2016-08-02

* Bump meta-resin to v1.8 [Andrei]
* Disable firmware splash and firmware related warnings [Theodor]
* Fix kernel log messages over HDMI (i.e. device connected to tty1) [Theodor]
* Bump resin-device-types to include partial manifest support [Andrei]
* No more debug images in staging

# v1.7.0 - 2016-07-14

* Update meta-resin to v1.7

# v1.6.0 - 2016-07-06

* Update meta-resin to v1.6 [Florin]

# v1.5.0 - 2016-07-04

* Update meta-resin to v1.5 [Florin]

# v1.5.0rc4 - 2016-06-29

* Update meta-resin to include supervisor update to v1.11.6 [Florin]

# v1.5.0rc3 - 2016-06-29

* Update meta-resin to include openvpn-resin.service refactoring [Florin]

# v1.5.0rc2 - 2016-06-28

* Update meta-resin to include docker key.json fix [Florin]
* Update meta-resin to include flasher fixes [Florin]

# v1.4.0 - 2016-06-27

* Update meta-resin to v1.4 [Florin]
* Update meta-resin to allow let error out [Florin]
* Update meta-resin to allow patching of kernel-modules-headers [Florin]
* Bump meta-resin to fix various issues [Andrei]
* Fix a small syntax error in meta-resin [Andrei]
* Fix automation fix for debug image [Andrei]
* Replace RESIN_STAGING_BUILD by DEBUG_IMAGE [Andrei]

# v1.3.0 - 2016-06-24

* Update meta-resin to v1.3 [Florin]
* Update meta-resin to include kernel modules compress support [Andrei]
* Compress kernel modules [Andrei]
* Replace SUPERVISOR_TAG by TARGET_TAG [Andrei]
* Custom docker images in connectable builds [Andrei]
* Bump meta-resin to include connectable builds [Andrei]
* Remove RPI_FIX_VCHIQ workaround as fix is included in our base images [Andrei]
* Add support for optional supervisor image [Andrei]

# v1.2.1 - 2016-06-18

# v1.2.0 - 2016-06-10

* Mask brcm43438.service [Florin]
* Update meta-resin to v1.2 [Andrei]
* Bump meta-resin to HEAD [Andrei]
* Bump yocto-resin-scripts to bring in improvements for in-docker builds [Andrei]
* Configure builds with RM_OLD_IMAGE [Theodor]
* Bump meta-raspberypi to include bluetooth support for raspberypi3 [Andrei]
* Bump meta-resin to include switch from rce to docker [Andrei]
* Update meta-raspberrypi BSP layer to pick up changes and set console=tty1 in production [Andrei]

# v1.1.4 - 2016-04-16

* Be able to workaround the issues with egl apps in containers using RPI_FIX_VCHIQ [Andrei]

# v1.1.1 - 2016-03-16

* Add support for Raspberrypi 3 [Theodor]
* Change revision of meta-raspberrypi to the current HEAD of the jethro branch [Theodor]
* Transition from fido -> jethro [Theodor]
