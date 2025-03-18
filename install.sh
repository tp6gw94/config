#!/bin/bash

brew install neovim gnu-sed lazygit zoxide fzf ripgrep starship jq poppler fs imagemagic font-symbols-only-nerd-font
brew install --cask font-jetbrains-mono-nerd-font raycast wezterm
brew install yazi --HEAD

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -y

curl https://get.volta.sh | bash
volta install node

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/helix-editor/helix ~/.config/helix/helix
cd ~/.config/helix/helix
cargo install --path helix-term --locked

