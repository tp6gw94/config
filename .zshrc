eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source "$HOME/.local/share/zap/zap.zsh"
source "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"

plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "esc/conda-zsh-completion"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/tmux/plugins/tmux-session-wizard/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

alias pn="pnpm"
alias lg="lazygit"

# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source "$HOME/.local/share/zap/zap.zsh"
source "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"

plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "esc/conda-zsh-completion"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/tmux/plugins/tmux-session-wizard/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="hx"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

alias pn="pnpm"
alias lg="lazygit"
alias yazi="yz"

# bun completions
[ -s "/Users/chenshengtai/.bun/_bun" ] && source "/Users/chenshengtai/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
