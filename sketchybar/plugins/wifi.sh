#!/usr/bin/env sh

#
# Show current wi-fi connection name or "Not connected" if not connected
#

wifi=$(/Sy*/L*/Priv*/Apple8*/V*/C*/R*/airport -I | sed -n 's/^.*SSID: \(.*\)$/\1/p')
icon='􀷗' # 􀙇

if [ -z "$wifi" ]; then
    wifi='Not connected'
    icon='􀷖' # 􀙈
fi

sketchybar --set $NAME icon="$icon" label="$wifi"
