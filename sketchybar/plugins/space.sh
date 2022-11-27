#!/usr/bin/env bash

#
# Highlight selected space
#

if [ $(yabai -m query --windows --space $SID) == "[]" ]; then
    ICON_COLOR="$TEXT"
else
    ICON_COLOR="$SPACE_OCCUPIED_FG"
fi

sketchybar --set $NAME icon.color=$ICON_COLOR background.drawing=$SELECTED icon.highlight=$SELECTED
