#!/bin/bash

sketchybar --add item mic right \
           --set mic update_freq=1 \
                     icon.font="$FONT:ExtraBold:13.0" \
                     background.color=$BACKGROUND_1 \
                     icon.padding_left=10 \
                     label.padding_right=10 \
                     script="$PLUGIN_DIR/mic.sh" \

