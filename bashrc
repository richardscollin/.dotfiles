[[ $- == *i* ]] || return # If not running interactively, don't do anything
_sourceif () { for arg in "$@"; do [[ -r "$arg" ]] && source "$arg"; done ; }

__git_ps1 () { PS1="$1$2"; } # fallback if not sourced
_sourceif /usr/lib/git-core/git-sh-prompt
PROMPT_COMMAND="__ps1"
__ps1() { # modified from github.com/rwxrob/dot
  # K - black, Y - yellow, B - blue, M - magenta, Z - reset
  local K='\[\e[30m\]' Y='\[\e[33m\]' B='\[\e[34m\]' M='\[\e[35m\]' Z='\[\e[0m\]'
  local dir="${PWD##*/}"
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  GIT_PS1_SHOWCOLORHINTS=1 \
  GIT_PS1_SHOWDIRTYSTATE=1 \
  GIT_PS1_SHOWSTASHSTATE=1 \
  GIT_PS1_SHOWUNTRACKEDFILES=1 \
  __git_ps1 "$K╔ $Y\u$K@$B\h$K:$M$dir$Z" "\n$K╚ $B\$$Z "
}

shopt -s histappend # append to the history file, don't overwrite it
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTFILE=~/.local/state/bash_history # move history file outside of home
HISTFILESIZE=-1 # don't truncate history file
HISTSIZE=-1 # only load last n lines into bash history; -1 load all
HISTTIMEFORMAT="%s" # include command unix timestamp in history

eval "$(dircolors -b ~/.config/bash/dircolors)"

_sourceif \
    ~/.config/bash/environments \
    ~/.config/bash/aliases \
    /usr/share/bash-completion/bash_completion

[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use # --no-use speeds up opening new terminals, see: https://github.com/nvm-sh/nvm/issues/539
_sourceif "$NVM_DIR/bash_completion"

export PATH=$PATH:$HOME/bin
motd
times
