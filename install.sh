#!/bin/bash

brew bundle install --file=~/.config/Brewfile

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

brew services start borders

mise install

cargo install taplo-cli --locked
curl -fsSL https://tombi-toml.github.io/tombi/install.sh | sh

npm install -g typescript-language-server typescript vscode-langservers-extracted @tailwindcss/language-server @vue/typescript-plugin @vue/language-server 
