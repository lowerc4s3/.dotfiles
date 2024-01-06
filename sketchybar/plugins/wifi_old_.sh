#!/usr/bin/env sh

#
# Show current wi-fi connection name or "Not connected" if not connected
# broken on sonoma
#

WIFI_NAME=${INFO:-"Not connected"}
[[ $INFO ]] && ICON='􀷗' || ICON='􀷖'

sketchybar --set $NAME icon="$ICON" label="$WIFI_NAME"
