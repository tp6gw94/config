#!/usr/bin/env bash

lazygit
echo -e ":rla\r" | wezterm cli send-text --pane-id $helix_pane --no-paste
wezterm cli send-text --pane-id $helix_pane --no-paste $'\003'
wezterm cli zoom-pane --pane-id $helix_pane --zoom
