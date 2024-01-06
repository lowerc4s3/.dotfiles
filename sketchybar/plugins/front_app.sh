#!/usr/bin/env sh

#
# Show selected app's name
#

# WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.title')
# WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.title' | cut -c 1-50)
# if [[ ${#WINDOW_TITLE} -gt 75 ]]; then
#     WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-75)…
# fi

sketchybar --set $NAME label="$INFO"
