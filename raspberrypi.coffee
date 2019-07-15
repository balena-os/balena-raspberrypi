deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberry-pi'
	aliases: [ 'raspberrypi' ]
	name: 'Raspberry Pi (v1 and Zero)'
	arch: 'rpi'
	state: 'released'

	imageDownloadAlerts: [
		{
			type: 'warning'
			message: 'The Raspberry Pi Zero W is not capable of connecting to 5GHz WiFi networks unless you use an external WiFi adapter that supports it.'
		}
	]

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://docs.resin.io/raspberrypi/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/raspberrypi/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/raspberrypi/nodejs/getting-started/#adding-your-first-device'
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
