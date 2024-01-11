#!/bin/bash

sketchybar --add item media right \
           --set media label.color=$YELLOW \
                       label.max_chars=150 \
                       icon.padding_left=0 \
                       icon=             \
                       icon.color=$BLUE   \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
