# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR=vim
export ANDROID_HOME=$(brew --prefix android)

# Enable ^, see https://github.com/robbyrussell/oh-my-zsh/issues/449
unsetopt nomatch

# git aliases

alias ip="ifconfig | grep inet\ "
alias gsp="git smart-pull"
alias gp="git push"
alias gaa="git add -A"
alias gs="git status --short"

alias tmux="tmux -2"
alias tma="tmux attach -t"
alias npmr="npm run"

BASE16_SCHEME="ocean"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

if which rbenv &>/dev/null ; then
  eval "$(rbenv init -)"
fi

if which direnv &>/dev/null ; then
  eval "$(direnv hook zsh)"
fi
# source /usr/local/opt/autoenv/activate.sh

# load z
source `brew --prefix`/etc/profile.d/z.sh

# add hub
# eval "$(hub alias -s)"
#
autoload -Uz promptinit
promptinit
prompt pure

function focus {
  if [[ $# -eq 0 ]]; then
    open focus://focus
  else
    open focus://focus?minutes=$1
  fi
}

function unfocus {
  open focus://unfocus
}

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
alias fuck='$(thefuck $(fc -ln -1))'
source ~/.iterm2_shell_integration.zsh
export PATH=$PATH:"$(brew --prefix node)/bin"
