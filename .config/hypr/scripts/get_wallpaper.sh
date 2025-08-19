#!/bin/sh
case "$1" in
  1)
    swww query | rg -oe '.*image: (.*)' -r '$1' | tail -1
    ;;
  2)
    swww query | rg -oe '.*image: (.*)' -r '$1' | head -1
    ;;
  *)
    exit 1
    ;;
esac
