deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberry-pi'
	aliases: [ 'raspberrypi' ]
	name: 'Raspberry Pi (v1 / Zero / Zero W)'
	arch: 'rpi'
	state: 'released'
	private: false

	imageDownloadAlerts: [
		{
			type: 'warning'
			message: 'The Raspberry Pi Zero W is not capable of connecting to 5GHz WiFi networks unless you use an external WiFi adapter that supports it.'
		}
	]

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberry-pi/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberry-pi/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberry-pi/nodejs/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-warrior'
		deployArtifact: 'resin-image-raspberrypi.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
