[[ $- == *i* ]] || return # If not running interactively, don't do anything
_sourceif () { for arg in "$@"; do [[ -r "$arg" ]] && source "$arg"; done ; }

__git_ps1 () { PS1="$1$2"; } # fallback if not sourced
_sourceif /usr/lib/git-core/git-sh-prompt
__ps1() { # modified from github.com/rwxrob/dot
  local black='\[\e[30m\]' yellow='\[\e[33m\]' blue='\[\e[34m\]' purple='\[\e[35m\]' reset='\[\e[0m\]'
  local dir="${PWD##*/}"
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  GIT_PS1_SHOWCOLORHINTS=1 \
  GIT_PS1_SHOWDIRTYSTATE=1 \
  GIT_PS1_SHOWSTASHSTATE=1 \
  GIT_PS1_SHOWUNTRACKEDFILES=1 \
  __git_ps1 "$black╔ $yellow\u$grey@$blue\h$black:$purple$dir$reset" "\n$black╚ $blue\$$reset "
}
PROMPT_COMMAND="__ps1"

shopt -s histappend # append to the history file, don't overwrite it
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=-1 # only load last n lines into bash history; -1 load all
HISTFILESIZE=-1 # don't truncate history file
HISTTIMEFORMAT="%s" # include command unix timestamp in history

eval "$(dircolors -b ~/.bash/dircolors)"
_sourceif ~/.bash/environments ~/.bash/aliases /usr/share/bash-completion/bash_completion
_sourceif "$NVM_DIR/nvm.sh" "$NVM_DIR/bash_completion"

motd
