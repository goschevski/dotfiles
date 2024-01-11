#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon.color=$MAGENTA \
                          icon.font="$FONT:ExtraBold:13.0" \
                          update_freq=30 \
                          script="$PLUGIN_DIR/calendar.sh"
