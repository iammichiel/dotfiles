#!/bin/bash

# macOS Sonoma (and Ventura/Monterey) DND status check
NAME=dnd
DND_ON=$(defaults -currentHost read com.apple.notificationcenterui doNotDisturb 2>/dev/null)

if [[ "$DND_ON" == 1 ]]; then
  #  is the font-awesome "moon" icon (or pick your preferred icon)
  ICON=""
else
  ICON=""
fi

sketchybar --set "$NAME" icon="$ICON"
