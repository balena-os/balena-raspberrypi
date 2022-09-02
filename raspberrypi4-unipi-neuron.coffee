deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberrypi4-unipi-neuron'
	name: 'UniPi Neuron (Raspberry Pi 4)'
	arch: 'aarch64'
	state: 'new'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberrypi4/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberrypi4/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberrypi4/nodejs/'

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi4-unipi-neuron'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-honister'
		deployArtifact: 'balena-image-raspberrypi4-unipi-neuron.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
