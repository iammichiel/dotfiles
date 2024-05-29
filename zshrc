# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="~/workspace/dotfiles"

export EDITOR=nvim
export GIT_EDITOR=nvim
export VOLTA_HOME="$HOME/.volta"
export COMPOSER_TOKEN=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

export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"

# Example aliases
alias sf="symfony"
alias tf="terraform"
alias vim="nvim"
alias ls="eza --icons=always"

alias dot-reload="$DOTFILES/bin/install.sh"
alias dot-edit="nvim $DOTFILES"
alias dot-brew="$DOTFILES/bin/brew.sh"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
