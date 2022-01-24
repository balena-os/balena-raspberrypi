deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberrypi3-unipi-neuron'
	name: 'UniPi Neuron (Raspberry Pi 3)'
	arch: 'armv7hf'
	state: 'new'

	imageDownloadAlerts: [
		{
			type: 'warning'
			message: 'The Raspberry Pi 3 is not capable of connecting to 5GHz WiFi networks unless you use an external WiFi adapter that supports it. The Raspberry Pi 3 B+ is capable of connecting to both 5GHz and 2.4GHz networks.'
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
		machine: 'raspberrypi3-unipi-neuron'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-honister'
		deployArtifact: 'balena-image-raspberrypi3-unipi-neuron.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
