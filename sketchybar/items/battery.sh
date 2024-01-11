#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         background.color=$BACKGROUND_1 \
                         script="$PLUGIN_DIR/battery.sh" \
                         icon.padding_left=10 \
                         label.padding_right=10 \
           --subscribe battery system_woke power_source_change
