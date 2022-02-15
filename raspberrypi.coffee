deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberry-pi'
	aliases: [ 'raspberrypi' ]
	name: 'Raspberry Pi (v1 / Zero / Zero W)'
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
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberry-pi/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberry-pi/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberry-pi/nodejs/'

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-honister'
		deployArtifact: 'balena-image-raspberrypi.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
