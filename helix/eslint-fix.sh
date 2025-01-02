#!/usr/bin/env bash

# Run the ESLint fix command
git diff --name-only | grep -E "\.(js|jsx|ts|tsx)" | xargs -I {} eslint {} --fix

echo -e ":rla\r" | wezterm cli send-text --pane-id $helix_pane --no-paste
wezterm cli send-text --pane-id $helix_pane --no-paste $'\003'
wezterm cli zoom-pane --pane-id $helix_pane --zoom

echo -e "\nPress any key to close..."
read -n 1 -s
