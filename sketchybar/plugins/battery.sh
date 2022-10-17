#!/usr/bin/env sh

#
# Show battery state (charging or not) and percentage
#

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
    [8-9][0-9]|7[6-9]|100) ICON="􀛨"
    ;;
    [6-7][0-9]|5[6-9]) ICON="􀺸"
    ;;
    [3-5][0-9]|2[6-9]) ICON="􀺶"
    ;;
    [1-2][0-9]) ICON="􀛩"
    ;;
    *) ICON="􀛪"
esac

if [[ $CHARGING != "" ]]; then
  ICON="􀢋"
fi

sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%"
