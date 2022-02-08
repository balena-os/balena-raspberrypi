deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

UNPACK_IMAGE = 'Unzip the image downloaded from the dashboard.'
CM4IOB_WRITE_SD="If using a CM4 Lite: write the OS file you downloaded to your SD card. We recommend using <a href=\"http://www.etcher.io/\">Etcher</a>. After flashing, insert the freshly burnt SD card into the IO Board"
CM4IOB_WRITE_EMMC="If using a CM4 eMMC: fit jumper to disable eMMC boot on J2 and connect the IO Board's microUSB port to your PC. Power the board and use <a href=\"https://github.com/raspberrypi/usbboot\">usbboot</a> to put the eMMC in mass storage mode. Write the OS file you downloaded to mass storage device."
CM4IOB_WRITE_BOOT="Disconnect the power source and eMMC boot jumper if using the CM4 eMMC. Connect the CM4 IO Board to the internet, then power it up."

module.exports =
	version: 1
	slug: 'raspberrypicm4-ioboard'
	aliases: [ 'raspberrypicm4-ioboard' ]
	name: 'Raspberry Pi CM4 IO Board'
	arch: 'aarch64'
	state: 'new'

	instructions: [
		UNPACK_IMAGE
		CM4IOB_WRITE_SD
		CM4IOB_WRITE_EMMC
		CM4IOB_WRITE_BOOT
	]
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/raspberrypicm4-ioboard/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/raspberrypicm4-ioboard/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/raspberrypicm4-ioboard/nodejs/'

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypicm4-ioboard'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-honister'
		deployArtifact: 'balena-image-raspberrypicm4-ioboard.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
