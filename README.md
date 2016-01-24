#  resin-raspberrypi repository

## Clone/Initialize the repository

There are two ways of initializing this repository:
* Clone this repository with "git clone --recursive".

or

* Run "git clone" and then "git submodule update --init --recursive". This will bring in all the needed dependencies.

## Build information

### Build flags

* Consult layers/meta-resin/README.md for info on various build flags.
(setting up serial console support for example). Build flags can be set by using the build script (barys).
See below for using the build script.

### Build this repository

* Run the build script:
  ./resin-yocto-scripts/build/barys

* You can also run barys with the -h switch to inspect the available options