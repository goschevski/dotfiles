#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors
MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  sketchybar --set $NAME icon= icon.color=$RED label="Off"
elif [[ $MIC_VOLUME -gt 0 ]]; then
  sketchybar --set $NAME icon= icon.color=$GREEN label="On"
fi
