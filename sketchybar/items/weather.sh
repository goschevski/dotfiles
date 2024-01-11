#!/bin/bash
#
sketchybar --add item weather right \
           --set weather icon= \
                         icon.color=$BLUE \
                         icon.font="$FONT:Bold:15.0" \
                         update_freq=1800 \
                         script="$PLUGIN_DIR/weather.sh" \
           --subscribe weather system_woke
