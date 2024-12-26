#!/usr/bin/env bash

# Run the ESLint fix command
eslint_fix_command="git diff --name-only | grep '\\.js\\|\\.jsx\\|\\.ts\\|\\.tsx$' | xargs -I {} eslint {} --fix"

# Execute the command and store the result
eval "$eslint_fix_command"

# Wait for a keypress before closing
echo -e "\nPress any key to close..."
read -n 1

# Close the floating pane
zellij action toggle-floating-panes
zellij action write 27 # send <Escape> key
zellij action write-chars ":reload-all" # reload all buffers
zellij action write 13 # send <Enter> key
