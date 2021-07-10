export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PATH=$PATH:/storage/emulated/0/bin:/storage/40E6-DFFD/bin

export USERNAME
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/.wgetrc"
export LESSHISTFILE="-"
export HISTIGNORE="&:l:ls:ll:la"
export GITHUB_USER=Dalmater
export GITHUB_PASSWORD=GHrasta24-7
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
export GITHUB_TOKEN=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
GIT_DISCOVERY_ACROSS_FILESYSTEM=true

# custom zsh prompt + colors
PROMPT_TITLE="%~ | ${COLUMNS}x${LINES} | %! | %? | %y |"

autoload colors -Uz && colors
setopt prompt_subst
autoload -U promptinit
promptinit
prompt kali

ENABLE_COMMAND_TIP=true

# Path to your oh-my-zsh installation.
export ZSH="/data/data/com.termux/files/home/.zsh"

# oh-my-zsh settings
DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
DISABLE_COMPFIX="true"
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$HOME/.zsh/custom"
ZSH_CACHE_DIR="$HOME/.cache/zsh"
# ZDOTDIR=$HOME/.config

# Plugins
plugins=(common-aliases extract nice-exit-code
gitfast python pip zsh-hist colorize ripgrep
colored-man-pages fd fzf fzf-tab title ag yarn
# ssh-agent keychain gpg-agent
# youtube-dl web-search
# git npm nvm node
# zsh-lazyload
# zsh_reload
# zsnapshot
# zhooks
# evalcache
you-should-use
zsh-autosuggestions
fast-syntax-highlighting
# zui zbrowse #zsh-pkgtools
)

ZSH_COLORIZE_STYLE="vim"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"
export ZSH_AUTOSUGGEST_USE_ASYNC=true

export YSU_MODE=ALL
export YSU_MESSAGE_POSITION=after
export YSU_IGNORED_ALIASES=( "g" "gc" "iaf" )

eval "$(lua5.3 ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once)"
export _ZL_EXCLUDE_DIRS=".git,~/.cfg.git,~/.cache"
export _ZL_NO_PROMPT_COMMAND=1

source $ZSH/oh-my-zsh.sh

# User configuration

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /$PREFIX/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export EDITOR=micro
export VISUAL="nvim"
export PAGER="bat --paging=always"
export BROWSER=lynx
export LANG=en_us.UTF-8
export TERM="xterm-256color"
export CLICOLORS=true
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1
export NNN_OPENER=nuke
export NNN_PLUG='b:-bookmarks;c:cdpath;d:-diffs;f:finder;g:-_git diff;h:hexview;l:-_git log;o:fzopen;p:getplugs;t:treewiew;x:_chmod +x $nnn;z:fzz'
export NNN_FIFO="$PREFIX/tmp/nnn.fifo"
export NNN_OPTS="EHcnrx"
export NNN_ARCHIVE="\\.(7z|bz2|gz|tar|tgz|zip)$"
export NNN_COLORS='1234'(/'#0a1b2c3d'/'#0a1b2c3d;1234')
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_TRASH="n (n=1: trash-cli)"
export NNN_USE_EDITOR=1
export NNN_BMS="h:~;c:~/.config;d:~/documents;D:~/downloads;b:~/bin"
# export MANPATH="data/data/com.termux/usr/share/doc/man

# For a full list of active aliases, run `alias`
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.aliases

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
setopt long_list_jobs
setopt no_hup
setopt autoresume
setopt autocontinue
setopt no_bg_nice
# Completion, expansion and globbing
setopt automenu
setopt autolist
setopt complete_in_word
setopt always_to_end
setopt menucomplete
setopt listpacked
#setopt globdots
#setopt caseglob
setopt globcomplete
setopt extended_glob
#setopt numeric_glob_sort
setopt markdirs
setopt nomatch
#setopt rc_quotes
#setopt rec_exact
setopt autoparamslash
setopt noautoremoveslash
setopt transient_rprompt
setopt hash_all
setopt hash_cmds
setopt hash_dirs

# edit command line
# bindkey -e
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '^x^e' edit-command-line

# keybindings
bindkey -s "^[R" "ranger_cd \n"
# bindkey '^[B' zbrowse
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;3C" kill-word
bindkey "^[[1;3D" backward-kill-word

# special sources
eval "$(hub alias -s)"

source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"

source ~/.config/ranger/shell_*.sh

source /sdcard/Termux/launch-completion.bash

# sticky notes
autoload -Uz sticky-note
    zle -N sticky-note
zstyle :sticky-note notefile ~/documents/notes
zstyle :sticky-note maxnotes 500
zstyle :sticky-note theme \
    bg red \
    fg $fg_bold[yellow]
bindkey "^s" sticky-note

##### >FZF Base<
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^[t' fzf-file-widget
# bindkey "^r" fzf-history-widget
bindkey -s "^[i" "interactive_fzf \n"

export FZF_BASE='~/.fzf'
export FZF_BASE='$PREFIX/share/fzf'
export FZF_DEFAULT_COMMAND='ag --hidden --depth 3 --color --ignore-dir .git -g ""'
export FZF_DEFAULT_OPTS="--height 92% --color=bg:-1,bg+:236,gutter:-1,info:136,border:88,spinner:108,hl:64,fg:250,header:65,fg+:252,pointer:124,marker:168,prompt:81,hl+:71 --layout=reverse --border --info=inline --ansi --cycle '--bind=alt-t:toggle'"
export FZF_ALT_C_COMMAND='fd --type d . --color=always --hidden --exclude .cache --exclude .git --exclude .cfg.git --exclude .config/micro/buffers'
export FZF_ALT_C_OPTS=" --ansi --preview 'tree -C -L 3 {}' --bind=alt--:toggle-preview"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--ansi --preview 'bat --color=always --line-range :200 {}' --bind=alt--:toggle-preview"
# export FZF_CTRL_R_COMMAND=""
# export FZF_CTRL_R_OPTS=""

# FZF Function Examples
# Auto cd with fzf
fzf_cd() { zle -I; DIR=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf --keep-right) && "$DIR" ; }; zle -N fzf_cd;
bindkey '^[j' fzf_cd

# zlua integration
# unalias z 2> /dev/null
j() {
  [ $# -gt 0 ] && _zlua "$*" && return
   "$(_zlua -l 2>&1 | fzf --keep-right --height 85% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# run npm script (requires jq)
fns() {
  local script
  script=$(cat $PREFIX/lib/package.json | jq -r '.scripts | keys[] ' | sort | fzf) && npm run $(echo "$script")
}
