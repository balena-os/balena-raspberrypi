deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberry-pi2'
	aliases: [ 'raspberrypi2' ]
	name: 'Raspberry Pi 2'
	arch: 'armv7hf'
	state: 'released'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://docs.resin.io/raspberrypi2/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/raspberrypi2/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/raspberrypi2/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi2'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-warrior'
		deployArtifact: 'resin-image-raspberrypi2.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
