deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

FIN_DEBUG = "While not having the Fin board powered, connect your system to the board's DBG port via a micro-USB cable.."
FIN_POWER = "Power on the Fin by attaching power to either the Barrel or the Phoenix connector."
FIN_WRITE = "Write the OS to the internal MMC storage device. We recommend using <a href=http://www.etcher.io/>Etcher</a>."
FIN_POWEROFF = "When flashing is complete, power off the board by detaching the power and unplug the DGB micro-USB cable."

module.exports =
	version: 1
	slug: 'fincm3'
	aliases: [ 'fincm3' ]
	name: 'Balena Fin (CM3)'
	arch: 'armv7hf'
	state: 'released'

	instructions: [
	 	FIN_DEBUG
		FIN_POWER
		FIN_WRITE
		FIN_POWEROFF
		instructions.CONNECT_AND_BOOT
	]

	gettingStartedLink:
		windows: 'https://docs.resin.io/fincm3/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/fincm3/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/fincm3/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'fincm3'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-warrior'
		deployArtifact: 'resin-image-fincm3.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
