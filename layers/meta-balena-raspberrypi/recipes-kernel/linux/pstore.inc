# ramoops backend for the Pi 5 crash log, reserved by the balena-ramoops overlay
#
# Injected via BALENA_CONFIGS (do_kernel_resin_injectconfig) rather than shipped
# as a fragment because it must apply only under :append:raspberrypi5.
BALENA_CONFIGS:append:raspberrypi5 = " pstore_ram"
