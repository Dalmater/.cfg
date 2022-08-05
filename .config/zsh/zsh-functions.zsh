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

zsh-times() {
  for i in $(seq 1 10)
  do
    time zsh -i -c exit
  done
}

# Make a dir and cd into it
# mkcd() {
#   mkdir -p $1
#   cd $1
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

# cd with vifm_cd
vifm_cd()
{
  local dst="$(command vifm --choose-dir - "$@")"
  if [ -z "$dst" ]; then
    echo 'Directory picking cancelled/failed'
    return 1
  fi
  cd "$dst"
}

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

duckduckgo() {
  lynx -vikeys -accept_all_cookies "https://lite.duckduckgo.com/lite/?q=$@"
}

wikipedia() {
  lynx -vikeys -accept_all_cookies "https://en.wikipedia.org/wiki?search=$@"
}

# Zsh math function
autoload -U zcalc
function __calc_plugin {
  zcalc -f -e "$*"
}
aliases[calc]='noglob __calc_plugin'
aliases[=]='noglob __calc_plugin'

# sticky notes
autoload -Uz sticky-note
zle -N sticky-note
zstyle :sticky-note notefile $HOME/documents/notes/.zsticky
zstyle :sticky-note maxnotes 500
# zstyle :sticky-note theme \
#   bg black \
#   fg $fg_bold[yellow]
bindkey '^s' sticky-note

# history search. Usage: command(Ctrl-X Ctrl-S)
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^S' history-beginning-search-menu

# history accept
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle -N fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

change-first-word() {
  zle beginning-of-line -N
  zle kill-word
}
zle -N change-first-word
bindkey -M emacs "\ea" change-first-word

# vim-surround for vi-cmd-mode
autoload -Uz surround
zle -N change-surround surround
zle -N delete-surround surround
zle -N add-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# make e.g. ci' work in vi-cmd-mode
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# make e.g. ci( work in vi-cmd-mode
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# pipe into command line
# autoload -Uz vi-pipe
# zle -N vi-pipe
# bindkey -a '!' vi-pipe

autoload -U select-word-match
zle -N select-in-camel select-word-match
bindkey -M viopp ic select-in-camel
zstyle ':zle:*-camel' word-style normal-subword

autoload -Uz select-word-style
select-word-style default
autoload -Uz forward-word-match
zle -N forward-word forward-word-match
autoload -Uz backward-word-match
zle -N backward-word backward-word-match
autoload -Uz backward-kill-word-match
zle -N backward-kill-word backward-kill-word-match

autoload -Uz smart-insert-last-word
zle -N insert-last-word smart-insert-last-word

# autoload -Uz bracketed-paste-url-magic
# zle -N bracketed-paste bracketed-paste-url-magic

# --------- autoload my functions ---------

# fpath=( ~/scripts/myfunc "${fpath[@]}" )
fpath=( ~/.config/zsh/myfunc "${fpath[@]}" )
autoload -U $fpath[1]/*(.:t)
# autoload -Uz fzf_locate_widget
zle -N fzf_locate_widget
bindkey '\ek' fzf_locate_widget
bindkey '\eK' fzf_locate_widget
# autoload -Uz fzf_git_repos
zle -N fzf_git_repos
bindkey '^Fg' fzf_git_repos
# autoload -Uz insert-space-and-accept
zle -N insert-space-and-accept
bindkey '^[ ' insert-space-and-accept
