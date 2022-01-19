# ls colors
autoload -Uz colors && colors

# Enable ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export EXA_COLORS="${LS_COLORS//=9/=1;3}"

GREEN=$(printf '\033[32m')
BLUE=$(printf '\033[34m')
CYAN=$(printf '\033[36m')

# XDG Path
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
# export TMP_CACHE=$PREFIX/tmp/zsh_tmp_cache

# Keydelay + disable right prompt indent
export KEYTIMEOUT=100 # 1sec
ZLE_RPROMPT_INDENT=0

# Allow GnuPG to use console for authentication
export GPG_TTY="$(tty)"
# export USERNAME
# export GITHUB_USER=Dalmater
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /$PREFIX/bin/lesspipe ] && eval "$(SHELL=$PREFIX/bin/sh lesspipe)"
# export LESSOPEN='|~/.lessfilter %s'
# LESSOPEN='|/data/data/com.termux/files/usr/bin/lesspipe.sh %s' && export LESSOPEN
# LESSOPEN="|/data/data/com.termux/files/home/bin/.lessfilter %s" && export LESSOPEN
# export LESSCOLORIZER="pygmentize"
LESSHISTFILE="-"

# export LANG=en_US.UTF-8 (Termux default)
# export LC_ALL=en_US.UTF-8
# export LC_CTYPE=UTF-8
export COLORTERM="truecolor"
export CLICOLOR=1
export MICRO_TRUECOLOR=1
# export TMUX_TMPDIR="/data/data/com.termux/files/usr/var/run"
# export FZF_TMPDIR=/data/data/com.termux/files/usr/var/run
# export HISTIGNORE="&:l:ls :ll:la:cd "
export WGETRC=${XDG_CONFIG_HOME:-$HOME/.config}/wget/.wgetrc
# export PIP_DISABLE_PIP_VERSION_CHECK=1

# Job Control
# setopt auto_resume
# setopt long_list_jobs # (set by ohmyzsh)
# setopt no_bg_nice

# Completion, expansion and globbing
# setopt always_to_end # (set by ohmyzsh)
# setopt extended_glob
# setopt no_case_glob
setopt glob_complete
# setopt complete_in_word # (set by ohmyzsh)
setopt dot_glob
setopt glob_star_short
# setopt list_packed
# setopt list_rows_first
setopt no_beep
# setopt null_glob
# setopt hash_all

# Prompt
# setopt transient_rprompt
# setopt prompt_subst
