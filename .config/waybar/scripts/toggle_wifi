#!/bin/bash

# Get the current Wi-Fi state (enabled or disabled)
wifi_state=$(nmcli radio wifi)

if [ "$wifi_state" = "enabled" ]; then
    echo "Wi-Fi is currently ON. Turning it OFF..."
    nmcli radio wifi off
else
    echo "Wi-Fi is currently OFF. Turning it ON..."
    nmcli radio wifi on
fi
