#!/bin/bash

brew install neovim asdf gnu-sed tmux lazygit zoxide fzf ripgrep
brew install --cask font-jetbrains-mono-nerd-font raycast

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
