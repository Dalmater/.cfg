# fixme - the load process here seems a bit bizarre
zmodload -i zsh/complist

WORDCHARS=''

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# Use caching so that commands are useble
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $HOME/.cache/zsh

# should this be in keybindings?
bindkey -M menuselect '^z' accept-and-infer-next-history
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description 'specify: %d'

# this will include newly installed programs into tab completion
# _force_rehash() { (( CURRENT == 1 )) && rehash return 1 }
# zstyle    ':completion:*' completers _force_rehash

#LISTMAX=0       # only ask if completion should be shown if it is larger than our screen
# this will not complete dotfiles in ~, unless you provide at least .<tab>8
zstyle -e ':completion:*' ignored-patterns 'if [[ $PWD = ~ ]] && [[ ! $words[-1] == .* ]]; then reply=(.*); fi'
# Don't complete backup files (e.g. 'bin/foo~') as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

zstyle ':completion:*' list-colors ''

# case insensitive (all), partial-word and substring completion
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# List of completers to use
zstyle ':completion:*' completer \
  _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' rehash true

# Complete . and .. special directories
#zstyle ':completion:*' special-dirs true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Don't complete uninteresting users
# zstyle ':completion:*:*:*:users' ignored-patterns \
        # adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        # clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        # gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        # ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        # named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        # operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        # rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        # usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# fzf setup
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

if [[ $COMPLETION_WAITING_DOTS = true ]]; then
  expand-or-complete-with-dots() {
    print -Pn "%F{red}…%f"
    zle expand-or-complete
    zle redisplay
  }
  zle -N expand-or-complete-with-dots
  # Set the function as the default tab completion widget
  bindkey -M emacs "^I" expand-or-complete-with-dots
  bindkey -M viins "^I" expand-or-complete-with-dots
  bindkey -M vicmd "^I" expand-or-complete-with-dots
fi

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

