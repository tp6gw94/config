#!/usr/bin/env bash

paths=$(yazi --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)

if [[ -n "$paths" ]]; then
  echo -e ":open $paths\r" | wezterm cli send-text --pane-id $helix_pane --no-paste
  echo -e ":rla\r" | wezterm cli send-text --pane-id $helix_pane --no-paste
  wezterm cli send-text --pane-id $helix_pane --no-paste $'\003'
fi
wezterm cli send-text --pane-id $helix_pane --no-paste $'\003'
