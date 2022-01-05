deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

FIN_DEBUG = "While not having the Fin board powered, connect your system to the board's DBG/PRG port via a micro-USB cable. Note for the Fin v1.1, only power the Fin from the PRG port for flashing."
FIN_POWER = "Only for the Fin v1.0, power on the Fin by attaching power to either the Barrel or the Phoenix connector."
FIN_WRITE = "Write the OS to the internal MMC storage device. We recommend using <a href=http://www.etcher.io/>Etcher</a>."
FIN_POWEROFF = "When flashing is complete, power off the board by detaching the power if connected, and unplug the DGB micro-USB cable."

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
		windows: 'https://www.balena.io/docs/learn/getting-started/fincm3/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/fincm3/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/fincm3/nodejs/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'fincm3'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-honister'
		deployArtifact: 'balena-image-fincm3.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
