deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'nebra-hnt'
	name: 'Nebra HNT'
	arch: 'aarch64'
	state: 'new'
	community: true

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
		machine: 'nebra-hnt'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-dunfell'
		deployArtifact: 'resin-image-nebra-hnt.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
