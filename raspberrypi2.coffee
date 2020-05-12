deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberry-pi2'
	aliases: [ 'raspberrypi2' ]
	name: 'Raspberry Pi 2'
	arch: 'armv7hf'
	state: 'released'
	private: false

	imageDownloadAlerts: [
		{
			type: 'warning'
			message: 'The Raspberry Pi 2 is not capable of connecting to WiFi networks without an external adapter.'
		}
	]

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberry-pi2/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberry-pi2/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberry-pi2/nodejs/'
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
