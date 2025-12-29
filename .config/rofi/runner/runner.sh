#!/bin/sh
theme="./common.rasi"
pkill -x rofi || rofi -show drun -theme ${theme} -sorting-method fzf -sort -matching fuzzy
