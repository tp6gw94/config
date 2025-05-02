#!/bin/bash

brew install neovim gnu-sed lazygit zoxide fzf ripgrep starship jq poppler fs imagemagick font-symbols-only-nerd-font
brew install --cask font-jetbrains-mono-nerd-font raycast wezterm
brew install yazi --HEAD

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -y

curl https://get.volta.sh | bash
volta install node

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

brew install --cask nikitabobko/tap/aerospace
brew tap FelixKratz/formulae
brew install borders
