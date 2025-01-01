#!/usr/bin/env bash

# Run the ESLint fix command
git diff --name-only | grep -E "\.(js|jsx|ts|tsx)" | xargs -I {} eslint {} --fix

echo -e "\nPress any key to close..."
read -n 1 -s
