deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberrypi3-64'
	aliases: [ 'raspberrypi3-64' ]
	name: 'Raspberry Pi 3 64bits'
	arch: 'aarch64'
	state: 'experimental'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi3-64'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-morty'
		deployArtifact: 'resin-image-raspberrypi3-64.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
