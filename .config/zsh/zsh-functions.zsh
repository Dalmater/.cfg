#
# Functions
#

#Get IP
ip-addr() {
    wget -qO- http://ipecho.net/plain
    echo
}

# Time ZSH startup
zsh-time() {
    time zsh -i -c exit
}

# uncompress depending on extension...
alias x=extrakt

extrakt() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)
                tar xvjf $1;;
            *.tar.gz)
                tar xvzf $1;;
            *.bz2)
                bunzip2 $1;;
            *.rar)
                unrar x $1;;
            *.gz)
                gunzip $1;;
            *.tar)
                tar xvf $1;;
            *.tbz2)
                tar xvjf $1;;
            *.tgz)
                tar xvzf $1;;
            *.zip)
                unzip $1;;
            *.Z)
                uncompress $1;;
            *.7z)
                7z x $1;;
            *)
                echo "'$1' cannot be extracted via >extrakt<";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Make a dir and cd into it
# mkcd() {
#     mkdir -p $1
#     cd $1
# }

# Make directories if it doesn't exist and touch the file
mktouch() {
    mkdir -p `dirname $1`
    touch $1
}

# Rename a file and keep it in the same location
rename() {
    if [ "$#" -ne 2 ]; then
        echo "usage: $0 path/to/file/old_name new_name"
        return
    fi

    mv $1 `dirname $1`/$2
}

# Duplicate a file to a new name in the same location
dup() {
    if [ "$#" -ne 2 ]; then
        echo "usage: $0 path/to/file/file copied_file"
        return
    fi

    cp $1 `dirname $1`/$2
}

# Zsh math function
autoload -U zcalc
function __calc_plugin {
    zcalc -f -e "$*"
}
aliases[calc]='noglob __calc_plugin'
aliases[=]='noglob __calc_plugin'


# Usage: palette
palette() {
  local -a colors
  for i in {000..255}; do
    colors+=("%F{$i}$i%f")
  done
  print -cP $colors
}


# Usage: printc COLOR_CODE
printc() {
  local color="%F{$1}"
  echo -E ${(qqqq)${(%)color}}
}

# Usage: command(Ctrl-X Ctrl-S)
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^S' history-beginning-search-menu

# ALT-k - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
local selected
if selected=$(locate / | fzf --keep-right -q "$LBUFFER"); then
  LBUFFER=$selected
fi
zle redisplay
}
zle     -N    fzf-locate-widget
bindkey '\ek' fzf-locate-widget

# sticky notes
autoload -Uz sticky-note
    zle -N sticky-note
zstyle :sticky-note notefile $HOME/documents/notes/notes
zstyle :sticky-note maxnotes 500
zstyle :sticky-note theme \
    bg black \
    fg $fg_bold[yellow]
bindkey '^s' sticky-note

autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^S' history-beginning-search-menu

fzf-history-widget-accept() {
    fzf-history-widget
    zle accept-line
}
zle -N fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

