deviceTypesCommon = require 'resin-device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	slug: 'raspberry-pi'
	aliases: [ 'raspberrypi' ]
	name: 'Raspberry Pi (v1 and Zero)'
	arch: 'rpi'
	state: 'released'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-jethro'
		deployArtifact: 'resin-image-raspberrypi.resin-sdcard'
		compressed: true

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: commonImg.initialization
