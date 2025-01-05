[[ $- == *i* ]] || return # If not running interactively, don't do anything

# these functions make external config files compatible with fish and bash
abbr() { alias "$1"="$2"; }
add_path() { export PATH="$PATH:$1"; }
sourceif() { [[ -r "$1" ]] && source "$@"; }

sourceif ~/.env
sourceif ~/.env.personal
sourceif ~/.env.work

sourceif ~/.aliases

__git_ps1() { PS1="$1$2"; } # fallback if not sourced
sourceif /usr/lib/git-core/git-sh-prompt
PROMPT_COMMAND="__ps1"
__ps1() {
  # https://talyian.github.io/ansicolors/
  # https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
  local BLK='\[\e[30m\]' RED='\[\e[31m\]' GRN='\[\e[32m\]' YEL='\[\e[33m\]' BLU='\[\e[34m\]' MAG='\[\e[35m\]' CYN='\[\e[36m\]' RST='\[\e[0m\]'
  GIT_PS1_SHOWCOLORHINTS=1 \
    GIT_PS1_SHOWDIRTYSTATE=1 \
    GIT_PS1_SHOWSTASHSTATE=1 \
    GIT_PS1_SHOWUNTRACKEDFILES=1 \
    __git_ps1 "$GRN\u@$RST\h $BLU\w$RST" "\n$GRN bash > $RST "
}

shopt -s histappend                  # append to the history file, don't overwrite it
HISTCONTROL=ignoreboth               # don't put duplicate lines or lines starting with space in the history.
HISTFILE=~/.local/state/bash_history # move history file outside of home
HISTFILESIZE=-1                      # don't truncate history file
HISTSIZE=-1                          # only load last n lines into bash history; -1 load all
HISTTIMEFORMAT="%s"                  # include command unix timestamp in history

sourceif /usr/share/bash-completion/bash_completion
sourceif /usr/share/bash-completion/completions/git

__git_complete g __git_main || true
complete -F _cargo c
complete -F _docker d

function command_not_found_handle {
  if [ -x /usr/lib/command-not-found ]; then
    /usr/lib/command-not-found -- "$1"
    return $?
  else
    printf "%s: command not found\n" "$1" >&2
    return 127
  fi
}

add_path "$HOME/bin"
add_path "$HOME/.local/bin"
