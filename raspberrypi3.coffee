deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberrypi3'
	aliases: [ 'raspberrypi3' ]
	name: 'Raspberry Pi 3'
	arch: 'armv7hf'
	state: 'released'
	isDefault: true

	imageDownloadAlerts: [
		{
			type: 'warning'
			message: 'The Raspberry Pi 3 is not capable of connecting to 5GHz WiFi networks unless you use an external WiFi adapter that supports it. The Raspberry Pi 3 B+ is capable of connecting to both 5GHz and 2.4GHz networks.'
		}
	]

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi3'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-rocko'
		deployArtifact: 'resin-image-raspberrypi3.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
