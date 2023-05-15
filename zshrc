# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git gh aliases docker macos sudo)

export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export EDITOR=nvim
export GIT_EDITOR=nvim


source $ZSH/oh-my-zsh.sh

# Example aliases
alias sf="symfony"
alias tf="terraform"
alias vim="nvim"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/michiel/workspace/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/michiel/workspace/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/michiel/workspace/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/michiel/workspace/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"


_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("/opt/homebrew/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi


export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/Users/michiel'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET


export COMPOSER_TOKEN=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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source ${HOME}/.rvm/scripts/rvm

alias ls="exa"

# export HTTP_PROXY=http://127.0.0.1:7080
# export HTTPS_PROXY=http://127.0.0.1:7080
# export NO_PROXY=localhost,example.com

export K_REVISION=test

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias dot-reload="~/.dotfiles/bin/install.sh"
