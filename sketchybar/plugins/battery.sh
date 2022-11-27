#!/usr/bin/env bash

#
# Show battery state (charging or not) and percentage
#

# Get battery status
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

ICON_HL=off

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
    [8-9][0-9]|7[6-9]|100)
        ICON="􀛨"
        ;;
    [6-7][0-9]|5[6-9])
        ICON="􀺸"
        ;;
    [3-5][0-9]|2[6-9])
        ICON="􀺶"
        ;;
    [1-2][0-9])
        ICON="􀛩"
        ;;
    *)
        ICON="􀛪"
        ICON_HL=on
        ICON_HL_COLOR=$BATTERY_LOW
esac

if [[ $CHARGING != "" ]]; then
    ICON="􀢋"
    ICON_HL=on
    ICON_HL_COLOR=$BATTERY_CHARGING
fi

sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%" icon.highlight=$ICON_HL icon.highlight_color=$ICON_HL_COLOR
