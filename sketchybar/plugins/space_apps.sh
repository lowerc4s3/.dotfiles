#!/usr/bin/env bash

#
# Show space apps
#

source "$HOME/.config/sketchybar/plugins/icon_map.sh"

if [ "$SENDER" == "space_windows_change" ]; then
    SPACE=$(echo "$INFO" | jq -r '.space')
    APPS=$(echo "$INFO" | jq -r '[.apps | to_entries[] | .key as $k | [range(.value)| $k]] | add | .[]')

    if [ "${APPS}" != "" ]; then
        ICON_STRIP=""
        while read -r APP; do
            __icon_map "$APP"
            ICON_STRIP="$ICON_STRIP $icon_result"
        done <<< "${APPS}"
        sketchybar --set space.$SPACE label.drawing=on label="$ICON_STRIP" icon.padding_right=0
    else
        sketchybar --set space.$SPACE label.drawing=off icon.padding_right=14
    fi
fi
