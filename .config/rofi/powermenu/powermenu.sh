#!/usr/bin/env bash

## Applets : Power Menu

# Import Current Theme
# source "$HOME"/.config/rofi/applets/shared/theme.bash
# theme="$type/$style"

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
theme="$SCRIPT_DIR/powermenu.rasi"


option_1="󰌾 Lock"
option_2="󰍃 Logout"
option_3="󰒲 Suspend"
option_5="󰜉 Reboot"
option_6="󰐥 Shutdown"
yes=' Yes'
no=' No'


# Rofi CMD
rofi_cmd() {
  rofi -dmenu -theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$option_1\n$option_2\n$option_3\n$option_5\n$option_6" | rofi_cmd
}

# Confirmation CMD
confirm_cmd() {
  rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
    -theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 2; lines: 1;}' \
    -theme-str 'element-text {horizontal-align: 0.5;}' \
    -theme-str 'textbox {horizontal-align: 0.5;}' \
    -dmenu \
    -p 'Confirmation' \
    -mesg 'Are you Sure?' \
    -theme ${theme}
}

# Ask for confirmation
confirm_exit() {
  echo -e "$yes\n$no" | confirm_cmd
}

# Confirm and execute
confirm_run() {
  selected="$(confirm_exit)"
  if [[ "$selected" == "$yes" ]]; then
    ${1} && ${2} && ${3}
  else
    exit
  fi
}

# Execute Command
run_cmd() {
  if [[ "$1" == '--opt1' ]]; then
    loginctl lock-session
  elif [[ "$1" == '--opt2' ]]; then
    loginctl terminate-user $USER
  elif [[ "$1" == '--opt3' ]]; then
    systemctl suspend
    # (
    #   sleep 0.5
    #   systemctl suspend
    # ) &
    # loginctl lock-session
  elif [[ "$1" == '--opt5' ]]; then
    confirm_run 'systemctl reboot'
  elif [[ "$1" == '--opt6' ]]; then
    confirm_run 'systemctl poweroff'
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1)
  run_cmd --opt1
  ;;
$option_2)
  run_cmd --opt2
  ;;
$option_3)
  run_cmd --opt3
  ;;
$option_5)
  run_cmd --opt5
  ;;
$option_6)
  run_cmd --opt6
  ;;
esac
