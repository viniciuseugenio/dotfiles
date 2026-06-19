#!/bin/bash

MONITOR="HDMI-A-1"
SCALE_1="0.67"
SCALE_2="1.00"

CURRENT_SCALE=$(hyprctl -j monitors | jq -r '.[] | select(.name == "'$MONITOR'") | .scale')

if [ "$CURRENT_SCALE" == "null" ]; then
  echo "Monitor $MONITOR not found"
  exit 1
fi

if [ "$CURRENT_SCALE" == "$SCALE_1" ]; then
  echo "Switching to scale $SCALE_2"
  hyprctl eval "hl.monitor({ output = \"HDMI-A-1\", mode = \"1366x768\", position = \"0x0\", scale = $SCALE_2 })"
else
  echo "Switching to scale $SCALE_1"
  hyprctl eval "hl.monitor({ output = \"HDMI-A-1\", mode = \"1366x768\", position = \"0x0\", scale = $SCALE_1 })"
fi
