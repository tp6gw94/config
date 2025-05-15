#!/bin/bash

brew bundle install --file=~/.config/Brewfile

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -y

curl https://get.volta.sh | bash
volta install node

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
