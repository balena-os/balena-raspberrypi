deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberrypi400-64'
	aliases: [ 'raspberrypi400-64' ]
	name: 'Raspberry Pi 400'
	arch: 'aarch64'
	state: 'new'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberrypi400/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberrypi400/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberrypi400/nodejs/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi400-64'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-honister'
		deployArtifact: 'balena-image-raspberrypi400-64.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
