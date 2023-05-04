deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'raspberrypi4-superhub'
	name: 'SuperHub'
	arch: 'aarch64'
	state: 'new'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberrypi4/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberrypi4/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberrypi4/nodejs/'

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi4-superhub'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-kirkstone'
		deployArtifact: 'balena-image-raspberrypi4-superhub.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
