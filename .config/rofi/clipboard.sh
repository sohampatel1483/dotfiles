#!/bin/sh

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
theme="$SCRIPT_DIR/common.rasi"

if pgrep -x rofi; then
  pkill -x rofi
else
  cliphist list | rofi -dmenu -theme ${theme} -sorting-method fzf -sort -matching fuzzy | cliphist decode | wl-copy
  # rofi -normal-window -show drun
fi
