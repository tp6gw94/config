#!/usr/bin/env bash

# Run the ESLint fix command
git diff --name-only | grep -E "\.(js|jsx|ts|tsx)" | xargs -I {} eslint {} --fix
echo -e "\nPress any key to close..."
read -n 1 -s
zellij action toggle-floating-panes
zellij action write 27 # send <Escape> key
zellij action write-chars ":rla"
zellij action write 13 # send <Enter> key
zellij action toggle-floating-panes
zellij action close-pane
