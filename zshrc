# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="~/workspace/dotfiles"

export EDITOR=nvim
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

alias dot-reload="$DOTFILES/bin/install.sh"
alias dot-edit="nvim $DOTFILES"
alias dot-brew="$DOTFILES/bin/brew.sh"

# This has to be set first
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/tools:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
# Copilot breaks because of Zscaler in Node.
#export NODE_EXTRA_CA_CERTS="/Users/MAC-MMISSO27/.zscaler.pem"


# Android Studio - Tauri apps
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"

# Loading the OMZ plugins.
plugins=(git eza)

source $ZSH/oh-my-zsh.sh

# Jenv specific
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

eval "$(direnv hook zsh)"

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
