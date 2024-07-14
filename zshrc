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

alias dot-reload="$DOTFILES/bin/install.sh"
alias dot-edit="nvim $DOTFILES"
alias dot-brew="$DOTFILES/bin/brew.sh"

# This has to be set first
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"

plugins=(git eza)

source $ZSH/oh-my-zsh.sh

# Jenv specific
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

eval "$(direnv hook zsh)"
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
