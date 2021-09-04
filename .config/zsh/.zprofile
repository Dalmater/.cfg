
# XDG Path
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export USERNAME
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/.wgetrc"
export GITHUB_USER=Dalmater
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
# Allow GnuPG to use console for authentication
export GPG_TTY="$(tty)"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /$PREFIX/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
LESSOPEN="|lesspipe.sh %s "; export LESSOPEN
export LESSCOLORIZER=highlight
# export LESSOPEN="| $PREFIX/bin/highlight -O ansi %s 2>/dev/null"
export LESSHISTFILE="-"
export EDITOR=nvim
export VISUAL="nvim"
export PAGER="bat -p --paging=always"
export BROWSER="lynx"
export FILE="vifm"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=UTF-8
export CLICOLORS=true
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1
export TMUX_TMPDIR="$PREFIX/var/run"
# export FZF_TMPDIR="$PREFIX/var/run"
export HISTIGNORE="&:l:ls *:ll:la:cd *"
export BAT_THEME="gruvbox-dark"
