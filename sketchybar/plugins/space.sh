#!/usr/bin/env bash

#
# Highlight selected space
#

# wip
# create_icons() {
#     args=(--animate sin 10)
#     
#     space="$(echo "$INFO" | jq -r '.space')"
#     apps="$(echo "$INFO" | jq -r '.apps | keys[]')"
#     
#     icon_strip=" "
#     if [ "${apps}" != "" ]; then
#         while read -r app
#         do
#             icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
#         done <<< "${apps}"
#     else
#         icon_strip=" —"
#     fi
#     args+=(--set space.$space label="$icon_strip")
#     
#     sketchybar -m "${args[@]}"
# }

if [ "$(yabai -m query --windows --space "$SID")" == "[]" ]; then
    ICON_COLOR="$TEXT"
else
    ICON_COLOR="$SPACE_OCCUPIED_FG"
fi

sketchybar --set $NAME icon.color=$ICON_COLOR background.drawing=$SELECTED icon.highlight=$SELECTED
