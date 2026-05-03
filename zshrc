# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("/Users/michiel/.oh-my-zsh/custom/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END

export DOTFILES="~/workspace/dotfiles"

export STARSHIP_CONFIG=~/.config/starship/starship.toml

export EDITOR=nvim
export VISUAL=nvim
export GIT_EDITOR=nvim
export VOLTA_HOME="$HOME/.volta"
export PHP="symfony php"

# Example aliases
alias sf="symfony"
alias tf="terraform"
alias vim="nvim"
alias php="sf php"
alias lg="lazygit"
alias cd="z"
alias oc="NODE_EXTRA_CA_CERTS=~/zscaler.pem opencode"
alias wr="npx wrangler"

# ls aliases
alias ls="eza" # ls
alias ll='eza -lbF --git' # list, size, type, git
alias llm='eza -lbGd --git --sort=modified' # long list, modified date sort
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale' # all list
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='eza -1' # one column, just names
alias lt='eza --tree --level=2' # tree

# Git aliases
alias gst="git status"
alias gapa="git add -p"
alias gc="git commit"
alias gc!="git commit --amend"
alias ggpush='git push origin "$(git branch --show-current)"'
alias ggpur='git pull --rebase origin "$(git branch --show-current)"'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias gcm='git checkout main'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch --all'
alias gfo='git fetch origin'

gbda() {
  # 1. List all branches merged into the current branch.
  # 2. Filter out branches you want to keep: the current branch (*), main, master, and develop.
  # 3. Pass the remaining branches to git branch -d for deletion.
  git branch --merged | \
    grep -vE "(^\*|main|master|develop)" | \
    xargs git branch -d
}

# Aerospaces related
alias dot-aero="$DOTFILES/bin/aero.sh"
alias dot-native="$DOTFILES/bin/native.sh"

alias dot-reload="$DOTFILES/bin/install.sh"
alias dot-edit="nvim $DOTFILES"
alias dot-brew="$DOTFILES/bin/brew.sh"
alias dot-brew-clean="$DOTFILES/bin/brew-clean.sh"

alias taild="tailscaled --tun=userspace-networking --state=/Users/michiel/.tailscale-state/tailscaled.state --socket=/Users/michiel/.tailscale-state/tailscale.socket --socks5-server=localhost:1055"
alias tailup="tailscale --socket=/Users/michiel/.tailscale-state/tailscale.socket up"
alias ts="tailscale --socket=/Users/michiel/.tailscale-state/tailscale.socket"


# This has to be set first
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/tools:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/Users/michiel/.antigravity/antigravity/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"

# Copilot breaks because of Zscaler in Node.
# export NODE_EXTRA_CA_CERTS="/Users/MAC-MMISSO27/zscaler.pem"

# Android Studio - Tauri apps
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"

eval "$(starship init zsh)"
eval "$(jenv init -)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

source <(fzf --zsh)
#
# Enabling VI mode in Zsh
set -o vi

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

# This is terminal integration for VSCode.
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

