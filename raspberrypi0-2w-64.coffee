deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberrypi0-2w-64'
	name: 'Raspberry Pi Zero 2 Wifi (64bit)'
	arch: 'aarch64'
	state: 'released'
	isDefault: true

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberrypi0-2w-64/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberrypi0-2w-64/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberrypi0-2w-64/nodejs/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi0-2w-64'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-dunfell'
		deployArtifact: 'balena-image-raspberrypi0-2w-64.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
