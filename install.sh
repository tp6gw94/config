#!/bin/bash

brew install neovim asdf gnu-sed tmux lazygit zoxide fzf ripgrep starship
brew install --cask font-jetbrains-mono-nerd-font raycast
brew install yazi ffmpegthumbnailer sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font
brew install helix
brew install gh

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -y

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cargo install --locked zellij

npm install -g graphql-language-service pnpm yarn typescript-language-server typescript vscode-langservers-extracted prettier

