#!/bin/sh

theme='common.rasi'

if pgrep -x rofi; then
  pkill -x rofi
else
  cliphist list | rofi -dmenu -theme ${theme} -sorting-method fzf -sort -matching fuzzy | cliphist decode | wl-copy
  # rofi -normal-window -show drun
fi
