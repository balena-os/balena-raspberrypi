deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'rt-rpi-300'
	name: 'Rocktech-RPI-300'
	arch: 'aarch64'
	state: 'new'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberrypi4/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberrypi4/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberrypi4/nodejs/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'rt-rpi-300'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-dunfell'
		deployArtifact: 'resin-image-rt-rpi-300.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
