# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/$HOME/.local/bin:$PATH
export PATH=$PATH:/storage/emulated/0/bin:/storage/40E6-DFFD/bin

source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"


# Path to your oh-my-zsh installation.
export ZSH="/data/data/com.termux/files/home/.zsh"

PROMPT_TITLE="%~ | ${COLUMNS}x${LINES} | %! | %? | %y |\007"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$HOME/.zsh/custom

ZSH_CACHE_DIR=$HOME/.cache/zsh

#ZDOTDIR=$HOME/.config

# bindkey "^[R" history-search-multi-word

# Which plugins would you like to load?
# Add wisely, as too many plugins slow down shell startup.
plugins=(gh gitfast common-aliases colored-man-pages
extract fd fzf z.lua pip python
zsh-recycle-bin title zsh-hist colorize
#keychain gpg-agent ssh-agent gpg-crypt
youtube-dl web-search
# zsnapshot
zsh_reload
# zsh-lazyload
# evalcache
#zsh-hooks
you-should-use
zsh-autosuggestions
fast-syntax-highlighting
zsh-history-substring-search
history-search-multi-word
)

# export FZF_BASE='$PREFIX/share/fzf'
# export FZF_DEFAULT_COMMAND='ag --hidden'
export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border --inline-info --preview  --ansi --bind ctrl-t:toggle'"

zstyle ":plugin:history-search-multi-word" clear-on-cancel "yes"

ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

ZSH_COLORIZE_STYLE="vim"

bindkey -s "^[r" "ranger_cd^J"

eval "$(lua5.3 ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once fzf)"

source $ZSH/oh-my-zsh.sh

# User configuration

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export CLICOLORS=true
export TERM="xterm-256color"
export EDITOR=micro
export PAGER=less
export LANG=en_US.UTF-8

# export MANPATH="data/data/com.termux/usr/share/doc/man

# For a full list of active aliases, run `alias`
source ~/.aliases
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke

source ~/.config/ranger/shell_*.sh

# Correction
unsetopt beep
setopt correctall
setopt correct
# Misc
setopt clobber              # > and >> work as expected
setopt multios              # Enable piping to multiple outputs
setopt interactivecomments  # Enable comments in interactive mode
# Safe rm
setopt rm_star_wait         # Wait 10 seconds before executing "rm *"
unsetopt rm_star_silent
# Directory Changing
setopt autocd           # Automatically change directory
setopt autopushd        # Use "pushd" instead of "cd", enabling use of "popd"
#setopt pushdsilent      # Make "popd" be less verbose (like cd)
setopt pushdignoredups  # Don't record the same directory as multiple entries
setopt pushdtohome
setopt cdable_vars
# Job Control
setopt notify
setopt long_list_jobs
# setopt no_hup
setopt autoresume
setopt autocontinue
unsetopt bg_nice
# Completion, expansion and globbing
setopt automenu
setopt autolist
setopt complete_in_word
setopt always_to_end
setopt menucomplete
setopt listpacked
setopt globdots
setopt extendedglob
setopt markdirs
setopt nomatch
setopt numeric_glob_sort
setopt rc_quotes
setopt rec_exact
# unsetopt autoparamslash
setopt hash_cmds
# setopt hash_dirs
setopt prompt_subst

bindkey '^[[1;5A' history-substring-search-up
# bindkey '^[[A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down
# bindkey '^[[B' history-substring-search-down

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"

bindkey '^[t' fzf-file-widget


# custom zsh prompt
autoload colors && colors
autoload -U promptinit
promptinit
prompt kali

# source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"

autoload -Uz zcalc
