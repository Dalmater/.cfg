export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PATH=$PATH:/storage/emulated/0/bin:/storage/40E6-DFFD/bin
export USERNAME
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export LESSHISTFILE="-"

# custom zsh prompt + colors
autoload colors -Uz && colors
#export CLICOLORS=1
export TERM="xterm-256color"
setopt prompt_subst
autoload -Uz promptinit
promptinit
prompt kali

PROMPT_TITLE="%~ | ${COLUMNS}x${LINES} | %! | %? | %y |\007"

# Path to your oh-my-zsh installation.
export ZSH="/data/data/com.termux/files/home/.zsh"

##### >FZF Base<
export FZF_BASE='$PREFIX/share/fzf'
export FZF_DEFAULT_COMMAND='ag --hidden --color --follow --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--height 80% --color='bg:000,bg+:236,info:136,border:88,spinner:108,hl:65,fg:250,header:65,fg+:252,pointer:124,marker:168,prompt:136,hl+:108' --layout=reverse --border --info=inline --bind=alt-T:toggle"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=13
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"
# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_COMPFIX="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

ZSH_CUSTOM="$HOME/.zsh/custom"

ZSH_CACHE_DIR="$HOME/.cache/zsh"

#ZDOTDIR=$HOME/.config

# Which plugins would you like to load?
# Add wisely, as too many plugins slow down shell startup.
plugins=(common-aliases extract nice-exit-code
colored-man-pages fd fzf fzf-tab z.lua title
gitfast python pip zsh-hist colorize
#keychain gpg-agent ssh-agent gpg-crypt
# nmap handy-helpers zsh-pentest
# youtube-dl web-search
# npm nvm node
# zsnapshot
# zsh_reload
# zsh-lazyload
# evalcache
zhooks
# dotbare
#zsh-hooks
you-should-use
zsh-autosuggestions
fast-syntax-highlighting
zsh-history-substring-search
history-search-multi-word
zui zbrowse
)

zstyle ":plugin:history-search-multi-word" clear-on-cancel "no"
zstyle ":history-search-multi-word" page-size "20"

ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

ZSH_COLORIZE_STYLE="vim"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"

FAST_WORK_DIR=XDG

eval "$(lua5.3 ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once fzf)"

source $ZSH/oh-my-zsh.sh

# User configuration

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export EDITOR=micro
export LANG=en_US.UTF-8

# export MANPATH="data/data/com.termux/usr/share/doc/man

# For a full list of active aliases, run `alias`
source ~/.aliases
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
export NNN_OPENER=nuke

source ~/.config/ranger/shell_*.sh

# Correction
#setopt correctall
setopt correct
# Misc
setopt clobber              # > and >> work as expected
setopt multios              # Enable piping to multiple outputs
setopt interactivecomments  # Enable comments in interactive mode
# Safe rm
setopt rm_star_wait         # Wait 10 seconds before executing "rm *"
unsetopt rm_star_silent
# Directory Changing
setopt autocd           # change directory without cd
setopt autopushd        # Use "pushd" instead of "cd", enabling use of "popd"
setopt pushdsilent      # Make "popd" be less verbose (like cd)
setopt pushdignoredups  # Don't record the same directory as multiple entries
setopt pushdtohome
setopt cdable_vars
# Job Control
setopt notify
# setopt long_list_jobs
# setopt no_hup
setopt autoresume
setopt autocontinue
unsetopt bg_nice
# Completion, expansion and globbing
setopt automenu
setopt autolist
setopt complete_in_word
setopt always_to_end
# setopt menucomplete
setopt listpacked
setopt globdots
setopt extendedglob
setopt markdirs
# setopt nomatch
# setopt numeric_glob_sort
setopt rc_quotes
setopt rec_exact
# unsetopt autoparamslash
setopt noautoremoveslash
setopt hash_cmds
setopt hash_dirs

# edit command line
# bindkey -e
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '^x^e' edit-command-line

# keybindings
# bindkey "^R" history-search-multi-word
bindkey '^[[1;5A' history-substring-search-up
# bindkey  '^[[A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down
# bindkey  '^[[B' history-substring-search-down
bindkey '^[t' fzf-file-widget
bindkey "^[r" fzf-history-widget
bindkey -s "^[R" "ranger_cd \n"
# bindkey '^[B' zbrowse
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"

source /sdcard/Termux/launch-completion.bash

# sticky notes
autoload -Uz sticky-note
    zle -N sticky-note

zstyle :sticky-note theme \
    bg red \
    fg $fg_bold[black]
