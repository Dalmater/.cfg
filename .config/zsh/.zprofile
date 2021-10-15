# ls colors
autoload -Uz colors && colors

# Enable ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# source ~/.exacolors

if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# XDG Path
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export TMP_CACHE=$PREFIX/tmp/zsh_tmp_cache

# Keydelay + disable right prompt indent
export KEYTIMEOUT=100 # 1sec
ZLE_RPROMPT_INDENT=0

# Allow GnuPG to use console for authentication
export GPG_TTY="$(tty)"
export USERNAME
export GITHUB_USER=Dalmater
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /$PREFIX/bin/lesspipe ] && eval "$(SHELL=$PREFIX/bin/sh lesspipe)"

export LESSCOLORIZER=highlight
export LESSHISTFILE="-"
# export LESSOPEN='|/data/data/com.termux/files/usr/bin/lesspipe.sh %s'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=UTF-8
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1
# export TMUX_TMPDIR="$PREFIX/var/run"
# export FZF_TMPDIR="$PREFIX/var/run"
export HISTIGNORE="&:l:ls *:ll:la:cd *"
export BAT_THEME="gruvbox-dark"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/.wgetrc"

# Job Control
# setopt auto_resume
# setopt auto_continue
# setopt long_list_jobs
setopt no_bg_nice

# Completion, expansion and globbing
# setopt always_to_end
setopt dot_glob
setopt extended_glob
setopt glob_complete
setopt glob_star_short
setopt hash_list_all
setopt hash_all
setopt list_packed
setopt list_rows_first
setopt mark_dirs
# setopt no_nomatch
# setopt no_menu_complete
setopt no_beep
setopt rc_quotes
setopt transient_rprompt
