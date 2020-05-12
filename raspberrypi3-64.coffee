deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberrypi3-64'
	aliases: [ 'raspberrypi3-64' ]
	name: 'Raspberry Pi 3 (using 64bit OS)'
	arch: 'aarch64'
	state: 'released'
	private: false

	imageDownloadAlerts: [
		{
			type: 'warning'
			message: 'The Raspberry Pi 3 is not capable of connecting to 5GHz WiFi networks unless you use an external WiFi adapter that supports it.'
		}
	]

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberrypi3/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberrypi3/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberrypi3/nodejs/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi3-64'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-warrior'
		deployArtifact: 'resin-image-raspberrypi3-64.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
