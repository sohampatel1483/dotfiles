#/bin/sh

status=$(cat /sys/class/power_supply/BAT1/status)
cap=$(cat /sys/class/power_supply/BAT1/capacity)

if [ "$status" = "Charging" ]; then
  echo "󰚥 $cap%"
else
  echo "$cap%"
fi
