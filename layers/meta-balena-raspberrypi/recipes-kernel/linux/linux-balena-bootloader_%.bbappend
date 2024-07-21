# Enable the dwc2 driver
BALENA_CONFIGS:append:raspberrypicm4-ioboard-sb = " dwc2"
BALENA_CONFIGS[dwc2] = "CONFIG_USB_DWC2=y"
