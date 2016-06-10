# disable brcm43438.service unit; instead these operations should be handled from within the
# user container as on rpi3 uart0 can be switched with uart1, rendering this service unusable

pkg_postinst_${PN}_append_raspberrypi3 () {
	if [ -n "$D" ]; then
		OPTS="--root=$D"
	fi
	systemctl $OPTS mask brcm43438.service
}
