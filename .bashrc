# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac
# [[ $TERM != screen* ]] && exec tmux

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# export HISTTIMEFORMAT="%d/%m/%y %T "
HISTSIZE=10000
HISTFILESIZE=20000

# append to the history file, don't overwrite it, verify.
shopt -s histappend
shopt -s histverify

# enable comments in command line
shopt -s interactive_comments

# case insensitive matching
shopt -s nocasematch

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Turn on the extended pattern matching features
shopt -s dotglob
shopt -s extglob

# Allow autocd into directory quietly
shopt -q -s autocd

# Correct dir spellings
shopt -q -s dirspell
shopt -q -s cdspell

# Enable vi-mode and key-bindings
set -o vi
# bind -m vi-insert
bind -m emacs

# Diasable flow-controll
stty -ixon

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname) | $(pwd | cut -d "/" -f 6-40)\a"'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="bat -p --paging=always"
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1
export BAT_THEME="gruvbox-dark"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/.wgetrc"

# Starship prompt
export STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship/starship.toml"
eval "$(starship init bash)"

function set_win_title(){
  echo -ne "\033]0; $PWD \007"
}
starship_precmd_user_func="set_win_title"

source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"
source /sdcard/Termux/launch-completion.bash
source ~/.config/ranger/shell_automatic_cd.sh

eval "$(lua5.3 ~/.config/zsh/plugins/z.lua/z.lua --init bash enhanced once fzf)"
export _ZL_EXCLUDE_DIRS="buffers,.git,node_modules"
export _ZL_DATA="~/.local/share/zsh/.zlua"
# export _ZL_ADD_ONCE=1
# export _ZL_MATCH_MODE=1

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x $PREFIX/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls -la --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

alias \
  apt='apt' \
  cp='cp -i -v' \
  dir='dir --color=auto' \
  man='man' \
  md='mkdir -pv' \
  mkd='mkdir -pv' \
  mkdir='mkdir -pv' \
  mv='mv -i -v' \
  rm='rm -I -v' \
  pkg='pkg'

alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'
alias -- -='cd -'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
if ! shopt -oq posix; then
  if [ -f /data/data/com.termux/files/usr/share/bash-completion/bash_completion ]; then
    . /data/data/com.termux/files/usr/share/bash-completion/bash_completion
  elif [ -f /data/data/com.termux/files/usr/etc/bash_completion ]; then
    . /data/data/com.termux/files/usr/etc/bash_completion
  fi
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == */data/data/com.termux/files/home/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/data/data/com.termux/files/home/.fzf/bin"
fi

# fzf-bash completions
# --------------------
# [[ $- == *i* ]] && source "/data/data/com.termux/files/home/.fzf/shell/completion.bash" 2> /dev/null
source ~/.config/plugins/fzf-obc/bin/fzf-obc.bash

# Key bindings

bind -x '"\ei": "interactive_fzf"'
bind -x '"\C-fg": "fzf_git"'
bind -x '"\C-fn": "live_search_notes"'
bind -x '"\er": "rgf"'
bind -x '"\C-fc": "dotf"'
bind -x '"\C-ff": "fuz"'
bind -x '"\el": "ls"'
bind -x '"\eR": "ranger_cd"'
bind -x '"\eV": "vifm_cd"'

# ------------
source "/data/data/com.termux/files/home/.fzf/shell/key-bindings.bash"
source ~/.config/fzf/fzf.sh
source ~/.config/zsh/plugins/dotbare/dotbare.plugin.bash

export DOTBARE_DIR="$HOME/.cfg.git"
export DOTBARE_TREE="$HOME"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window 'down,70%' --keep-right --ansi \
--history=$XDG_DATA_HOME/fzf-history/dotfiles"
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
export DOTBARE_KEY="--bind=change:first,alt-j:jump,alt-w:toggle-preview-wrap"
_dotbare_completion_cmd cfg
bind -x '"\C-fd":"dotbare fedit"'

# fzf function example
# - CTRL-O to open with `open` command,
# - CTRL-E or Enter key to open with the $EDITOR
fo() {
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && termux-open --chooser "$file" || ${EDITOR:-vim} "$file"
  fi
}
