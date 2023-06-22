# An ascetic bashrc
[[ $- == *i* ]] || return # If not running interactively, don't do anything
_source_if() { [[ -r "$1" ]] && source "$1"; } # conditionally source file github.com/rwxrob/dot

__git_ps1 () { PS1="$1$2"; } # fallback if not sourced
_source_if /usr/lib/git-core/git-sh-prompt
PROMPT_COMMAND="__ps1"
__ps1() {
# modified from github.com/rwxrob/dot
  local P='$' dir="${PWD##*/}" branch

  local red='\[\e[31m\]' grey='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' reset='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$red && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWCOLORHINTS=1
  __git_ps1 "$grey╔ $u\u$grey@$h\h$grey:$w$dir$reset" "\n$grey╚ $p$P$reset "
}

shopt -s histappend # append to the history file, don't overwrite it
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=-1 # only load last n lines into bash history; -1 load all
HISTFILESIZE=-1 # don't truncate history file
HISTTIMEFORMAT="%s" # include command unix timestamp in history
# append in memory history to file - history -a
# trigger reload history from file - history -r
# histsync alias does append then reload

# paths defined in this way so we can easily enable and disable sections
IFS=:
declare -A PATHS=(
[local]=~/bin
)
export PATH="$PATH:${PATHS[*]}"
unset IFS

eval "$(SHELL=/bin/sh lesspipe)" # use lesspipe(1)
# export JAVA_HOME='/usr/lib/jvm/default' # Java
# export NVM_DIR="$HOME/.nvm"
# _source_if "$NVM_DIR/nvm.sh" # load nvm
# _source_if "$NVM_DIR/bash_completion"  # load nvm bash_completion

_source_if /usr/share/bash-completion/bash_completion

eval "$(dircolors -b ~/.bash/dircolors)"
_source_if ~/.bash/aliases
_source_if ~/.bash/environments

motd
