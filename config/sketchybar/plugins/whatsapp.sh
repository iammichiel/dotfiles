
#!/bin/bash

NAME="whatsapp"  # Set this to your SketchyBar item name
ICON="󰖣"

STATUS_LABEL=$(lsappinfo info -only StatusLabel "WhatsApp Web")

if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

    if [[ -z "$LABEL" ]]; then
        ICON_COLOR="0xffffffff"   # White for no messages
    elif [[ "$LABEL" =~ ^[0-9]+$ ]]; then
        ICON_COLOR="0xff00ff00"   # Green for messages
    else
        exit 0
    fi
else
    exit 0
fi

sketchybar --set "$NAME" icon="$ICON" label="$LABEL" icon.color="$ICON_COLOR"
