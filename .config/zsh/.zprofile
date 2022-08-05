# ls colors
autoload -Uz colors && colors

# Enable ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# replace bright aixterm color codes w/ bold ANSI codes
export EXA_COLORS="${LS_COLORS//=9/=1;3}"
# Punctuation
EXA_COLORS+="xx=37:"
# Table header row
EXA_COLORS+="hd=4;37:"
# Symlink path
EXA_COLORS+="lp=1;34:"
# Control character
EXA_COLORS+="cc=1;31:"

# change grep search highlighting
export GREP_COLORS="mt=01;31;103"

# Keydelay + disable right prompt indent
export KEYTIMEOUT=80 # 0.8 sec
ZLE_RPROMPT_INDENT=0

# Allow GnuPG to use console for authentication
export GPG_TTY="$(tty)"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true

# LESSOPEN="|/data/data/com.termux/files/home/bin/.lessfilter %s" && export LESSOPEN
LESSHISTFILE="-"

# export LANG=en_US.UTF-8 (Termux default)
# export LC_ALL=en_US.UTF-8
export COLORTERM="truecolor"
export CLICOLOR=1
export MICRO_TRUECOLOR=1
export MANPATH=$PREFIX/share/man
export MANPATH=$HOME/.fzf/man:$MANPATH
export BAT_THEME="gruvbox8"
export BROWSER="elinks"
export WGETRC=${XDG_CONFIG_HOME:-$HOME/.config}/wget/.wgetrc
export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc
export DIALOGRC=${XDG_CONFIG_HOME:-$HOME/.config}/dialog/dialogrc
export CTAGS=${XDG_CONFIG_HOME:-$HOME/.config}/ctags/cfg.ctags
NODE_REPL_HISTORY=" "
