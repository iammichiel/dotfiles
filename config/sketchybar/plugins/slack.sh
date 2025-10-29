#!/usr/bin/env sh

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Slack")
ICON="󰒱"

if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

    if [[ -z "$LABEL" ]]; then
        ICON_COLOR="0xffffffff"   # White if no label
        LABEL_ARG=""              # No label
    elif [[ "$LABEL" == "•" ]]; then
        ICON_COLOR="0xff00ff00"   # Green if "."
        LABEL_ARG=""              # No label
    elif [[ "$LABEL" =~ ^[0-9]+$ ]]; then
        ICON_COLOR="0xffff0000"   # Red if label is a number
        LABEL_ARG="label=${LABEL}"  # Set the label
    else
        exit 0
    fi
else
    exit 0
fi

sketchybar --set "$NAME" icon="$ICON" ${LABEL_ARG} icon.color="$ICON_COLOR"

