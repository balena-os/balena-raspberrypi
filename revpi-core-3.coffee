deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

REVPI_DEBUG = "While not having the Revolution Pi board powered, connect your system to the board's USB port via a micro-USB cable."
REVPI_POWER = "Power on the Revolution Pi board."
REVPI_WRITE = "Write the OS to the internal MMC storage device. We recommend using <a href=http://www.etcher.io/>Etcher</a>."
REVPI_POWEROFF = "When flashing is complete, power off the board and unplug the micro-USB cable."

module.exports =
	version: 1
	slug: 'revpi-core-3'
	aliases: [ 'revpi-core-3' ]
	name: 'Revolution Pi Core 3'
	arch: 'armv7hf'
	state: 'released'
	isDefault: true

	instructions: [
		REVPI_DEBUG
		REVPI_POWER
		REVPI_WRITE
		REVPI_POWEROFF
		instructions.CONNECT_AND_BOOT
	]

	gettingStartedLink:
		windows: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'revpi-core-3'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-sumo'
		deployArtifact: 'resin-image-revpi-core-3.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
