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
export COMPOSER_TOKEN=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

source $ZSH/oh-my-zsh.sh

# Example aliases
alias sf="symfony"
alias tf="terraform"
alias vim="nvim"
# alias php="symfony php"
alias ls="exa"
alias dot-reload="~/.dotfiles/bin/install.sh"
alias dot-edit="nvim ~/.dotfiles"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mac-MMISSO27/workspace/t/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mac-MMISSO27/workspace/t/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mac-MMISSO27/workspace/t/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mac-MMISSO27/workspace/t/google-cloud-sdk/completion.zsh.inc'; fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
