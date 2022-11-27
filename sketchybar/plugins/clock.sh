#!/usr/bin/env sh

#
# Show current time
#

sketchybar --set $NAME label="$(date '+%d|%m|%y %H:%M')" # '+%d/%m %H:%M'
