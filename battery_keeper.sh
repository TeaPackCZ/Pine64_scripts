#!/bin/bash

BATTERY_PRESENT=$(cat /sys/class/power_supply/battery/present)
while [ "$BATTERY_PRESENT" -eq "1" ] ; do
	sleep 30
	BATTERYVOLTAGE=$(cat /sys/class/power_supply/battery/voltage_now)

	if [ "3200000" -gt "$BATTERYVOLTAGE" ];
	then
		if [ "$(cat /sys/class/power_supply/battery/status)" -eq "Discharging" ];
		then
			echo "VOLTAGE: $BATTERYVOLTAGE - too low, shutting down." | wall
			sleep 5
			shutdown -h now
		fi
	else
		echo "VOLTAGE: $BATTERYVOLTAGE - OK"
	fi
done

exit 0
