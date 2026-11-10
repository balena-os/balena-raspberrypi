deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'iotg-rpi5'
	name: 'CompuLab IOTG rpi5'
	arch: 'aarch64'
	state: 'released'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/iotg-rpi5/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/iotg-rpi5/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/iotg-rpi5/nodejs/'

	options: [ networkOptions.group ]

	yocto:
		machine: 'iotg-rpi5'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-kirkstone'
		deployArtifact: 'balena-image-iotg-rpi5.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
