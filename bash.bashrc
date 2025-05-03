# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# timer function to calc duration
function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  duration=$(($SECONDS - $timer))
  if (( $duration > 3600 )) ; then
    let "hours=$duration/3600"
    let "minutes=($duration%3600)/60"
    let "seconds=($duration%3600)%60"
    timer_show="[${hours}h ${minutes}m ${seconds}s]"
  elif (( $duration > 60 )) ; then
    let "minutes=($duration%3600)/60"
    let "seconds=($duration%3600)%60"
    timer_show="[${minutes}m ${seconds}s]"
  elif (( $duration > 1 )) ; then
    timer_show="[${duration}s]"
  else
    timer_show=""
  fi
  unset timer
}

trap 'timer_start' DEBUG

# set a fancy prompt
PROMPT_COMMAND='PS1EXIT=$?; timer_stop'
PS1='${timer_show}'
PS1+='$(if [ $PS1EXIT -ne 0 ]; then echo -n "[\[\033[01;31m\]$PS1EXIT\[\033[00m\]]"; fi)'
PS1+='[\[\033[01;33m\]\t\[\033[00m\]] '
PS1+='\[\033[01;32m\]\u\[\033[00m\]@'
PS1+='\[\033[01;36m\]\h\[\033[00m\]:'
PS1+='\[\033[01;34m\]\w\[\033[00m\]'
PS1+='\[\033[01;35m\]$(__git_ps1 " (%s)")\[\033[00m\]'
PS1+='\$ '

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
case $TERM in
    xterm*)
        PS1+='\[\033]0;\u@\h: \w\007\]'
        ;;
    *)
        ;;
esac

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

# add PATHS
# add go path
if command -v go >/dev/null 2>&1; then
  GOPATH_BIN=$(go env GOPATH)/bin
  if [ -d "$GOPATH_BIN" ]; then
    export PATH="$PATH:$GOPATH_BIN"
  fi
fi
# add esp path
ESP_PATH=$HOME/esp/xtensa-esp32-elf/bin
if [ -d "$ESP_PATH" ]; then
  export PATH="$PATH:$ESP_PATH"
fi
ESP_IDF_PATH=$HOME/esp/esp-idf
if [ -d "$ESP_PATH" ]; then
  export IDF_PATH=$ESP_IDF_PATH
fi

# export varaiblen
export EDITOR=$(which vim)
export VISUAL=$(which vim)

# load /etc/environment
while IFS='=' read -r key value; do
  if [[ -n "$key" && ! "$key" =~ ^# ]]; then
    export "$key=$(echo "$value" | sed 's/^"\(.*\)"$/\1/')"
  fi
done < /etc/environment

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Allow aliases to be with sudo
alias sudo="sudo "

alias l="ls -lA"
alias ll='ls -l'
alias lt="ls -lt"
alias la="ls -la"
alias lh="ls -lh"
alias lat="ls -AGFoth"

alias motd="cat /etc/motd"
