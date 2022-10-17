#!/usr/bin/env sh

#
# Show current keyboard input source
#

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.ABC') LABEL='EN' ;;
'com.apple.keylayout.RussianWin') LABEL='RU' ;;
*) LABEL='?'
esac

sketchybar --set $NAME label="$LABEL" icon='􀇳'
