eval "$(/usr/local/bin/brew shellenv)"

source "$HOME/.local/share/zap/zap.zsh"
source "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"
eval "$(zoxide init zsh)"

plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "esc/conda-zsh-completion"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="~/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Documents/game porting toolkit:$PATH"
export PATH="$HOME/.config/tmux/plugins/tmux-session-wizard/bin:$PATH"
export PATH="$HOME/.asdf/shims:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

alias pn="pnpm"
alias lg="lazygit"

