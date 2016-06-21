#  resin-raspberrypi repository

## Clone/Initialize the repository

There are two ways of initializing this repository:
* Clone this repository with "git clone --recursive".

or

* Run "git clone" and then "git submodule update --init --recursive". This will
bring in all the needed dependencies.

## Build information

### Build flags

* Consult layers/meta-resin/README.md for info on various build flags (setting
up serial console support for example) and build prerequisites. Build flags can
be set by using the build script (barys) or by manually modifying `local.conf`.

See below for using the build script.

### Build this repository

* Run the build script:
  `./resin-yocto-scripts/build/barys`

* You can also run barys with the -h switch to inspect the available options

### Custom build using this repository

* Run the build script in dry run mode to setup an empty `build` directory
    `./resin-yocto-scripts/build/barys --remove-build --dry-run`

* Edit the `local.conf` in the `build/conf` directory

* Prepare build's shell environment
    `source layers/poky/oe-init-build-env`

* Run bitbake (see message outputted when you sourced above for examples)
