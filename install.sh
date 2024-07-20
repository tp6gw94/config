#!/bin/bash

brew install neovim asdf gnu-sed tmux lazygit zoxide fzf ripgrep starship
brew install --cask font-jetbrains-mono-nerd-font raycast

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -y

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
