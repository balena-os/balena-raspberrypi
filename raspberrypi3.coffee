deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	slug: 'raspberrypi3'
	aliases: [ 'raspberrypi3' ]
	name: 'Raspberry Pi 3'
	arch: 'armv7hf'
	state: 'released'
	isDefault: true

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi3'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-jethro'
		deployArtifact: 'resin-image-raspberrypi3.resin-sdcard'
		compressed: true

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: commonImg.initialization
