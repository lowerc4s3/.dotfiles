#!/usr/bin/env sh

#
# Show current wi-fi connection name or "Not connected" if not connected
#

# Deprecated
# wifi=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | sed -n 's/^.*SSID: \(.*\)$/\1/p')

wifi=$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')
icon='􀷗' # 􀙇

if [ -z "$wifi" ]; then
    wifi='Not connected'
    icon='􀷖' # 􀙈
fi

sketchybar --set $NAME icon="$icon" label="$wifi"
