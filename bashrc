[[ $- == *i* ]] || return # If not running interactively, don't do anything

abbr() { alias "$1"="$2"; }
add_path() { export PATH="$PATH:$1"; }
sourceif() { [[ -r "$1" ]] && source "$@"; }

sourceif ~/.aliases
sourceif ~/.env

__git_ps1() { PS1="$1$2"; } # fallback if not sourced
sourceif /usr/lib/git-core/git-sh-prompt
PROMPT_COMMAND="__ps1"
__ps1() { # modified from github.com/rwxrob/dot
	# K - black, Y - yellow, B - blue, M - magenta, Z - reset
	local K='\[\e[30m\]' Y='\[\e[33m\]' B='\[\e[34m\]' M='\[\e[35m\]' Z='\[\e[0m\]'
	GIT_PS1_SHOWCOLORHINTS=1 \
		GIT_PS1_SHOWDIRTYSTATE=1 \
		GIT_PS1_SHOWSTASHSTATE=1 \
		GIT_PS1_SHOWUNTRACKEDFILES=1 \
		__git_ps1 "$K╔ $Y\u$K@$B\h$K:$M\w$Z" "\n$K╚ $B\$$Z "
}

shopt -s histappend                  # append to the history file, don't overwrite it
HISTCONTROL=ignoreboth               # don't put duplicate lines or lines starting with space in the history.
HISTFILE=~/.local/state/bash_history # move history file outside of home
HISTFILESIZE=-1                      # don't truncate history file
HISTSIZE=-1                          # only load last n lines into bash history; -1 load all
HISTTIMEFORMAT="%s"                  # include command unix timestamp in history

# sourceif "$NVM_DIR/nvm.sh" --no-use # --no-use speeds up opening new terminals, see: https://github.com/nvm-sh/nvm/issues/539
# sourceif "$NVM_DIR/bash_completion"

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

motd
