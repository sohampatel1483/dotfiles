#!/usr/bin/env bash

## Applets : Screenshot (Wayland)

set -x  # Enable debugging

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Screenshot'
mesg="DIR: $(xdg-user-dir PICTURES)/Screenshots"

if [[ "$theme" == *'type-1'* ]]; then
	list_col='1'
	list_row='5'
	win_width='400px'
elif [[ "$theme" == *'type-3'* ]]; then
	list_col='1'
	list_row='5'
	win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
	list_col='1'
	list_row='5'
	win_width='520px'
elif [[ "$theme" == *'type-2'* || "$theme" == *'type-4'* ]]; then
	list_col='5'
	list_row='1'
	win_width='670px'
fi

# Options
layout=$(grep 'USE_ICON' ${theme} | cut -d'=' -f2)
if [[ "$layout" == 'NO' ]]; then
	option_1=" Capture Desktop"
	option_2=" Capture Area"
	option_3=" Capture Window"
	option_4=" Capture in 5s"
	option_5=" Capture in 10s"
else
	option_1=""
	option_2=""
	option_3=""
	option_4=""
	option_5=""
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: $win_width;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu -no-custom \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Screenshot
time=$(date +%Y-%m-%d-%H-%M-%S)
dir="$(xdg-user-dir PICTURES)/Screenshots"
file="$dir/Screenshot_${time}.png"

if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# Notify and view screenshot
notify_view() {
	dunstify -u low --replace=699 "Screenshot Saved: $file"
}

# Copy screenshot to clipboard
copy_shot() {
	wl-copy < "$file"
}

# Countdown
countdown() {
	for sec in $(seq $1 -1 1); do
		dunstify -t 1000 --replace=699 "Taking shot in : $sec"
		sleep 1
	done
}

# Take shots
shotnow() {
    sleep 0.5
	grim "$file" && copy_shot
	notify_view
}

shot5() {
	countdown '5'
	sleep 1 && grim "$file" && copy_shot
	notify_view
}

shot10() {
	countdown '10'
	sleep 1 && grim "$file" && copy_shot
	notify_view
}

shotwin() {
	selection=$(slurp) || exit 1
	grim -g "$selection" "$file" && copy_shot
	notify_view
}

shotarea() {
	selection=$(slurp -w 0) || exit 1
	grim -g "$selection" "$file" && copy_shot
	notify_view
}

# Execute Command
run_cmd() {
	case "$1" in
		'--opt1') shotnow ;;
		'--opt2') shotarea ;;
		'--opt3') shotwin ;;
		'--opt4') shot5 ;;
		'--opt5') shot10 ;;
	esac
}

chosen="$(run_rofi)"
case ${chosen} in
	$option_1) run_cmd --opt1 ;;
	$option_2) run_cmd --opt2 ;;
	$option_3) run_cmd --opt3 ;;
	$option_4) run_cmd --opt4 ;;
	$option_5) run_cmd --opt5 ;;
esac

