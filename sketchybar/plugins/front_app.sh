#!/usr/bin/env bash

#
# Show selected app's name
#

WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.title')

if [[ $WINDOW_TITLE = "" ]]; then
    WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.app')
fi

if [[ ${#WINDOW_TITLE} -gt 65 ]]; then
    WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-65)…
fi

sketchybar --set $NAME label="$WINDOW_TITLE"
