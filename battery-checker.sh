#!/bin/bash

while true; do
    battery_info=$(acpi -b)
    battery_percent=$(echo "$battery_info" | grep -oP '\d+(?=%)')

    if [[ $battery_percent -lt 20 ]]; then
        notify-send "Battery Low" "Battery is at $battery_percent%. Please charge your laptop."
    fi

    sleep 300 # sleep 5 mins 
done

