deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberrypi5'
	name: 'Secure boot enabled Raspberry Pi CM5 IO board'
	arch: 'aarch64'
	state: 'released'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberrypi5/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberrypi5/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberrypi5/nodejs/'

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi5'
		image: 'balena-image-flasher'
		fstype: 'balenaos-img'
		version: 'yocto-kirkstone'
		deployArtifact: 'balena-image-flasher-raspberrypi5.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
