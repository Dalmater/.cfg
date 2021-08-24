export PATH=$HOME/bin:$HOME/.local/bin:$PATH
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# XDG Path
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# export USERNAME=Dalmater
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/.wgetrc"
export GITHUB_USER=Dalmater
export GITHUB_PASSWORD=GHrasta24-7
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
export GITHUB_TOKEN=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
GIT_DISCOVERY_ACROSS_FILESYSTEM=true
# Allow GnuPG to use console for authentication
GPG_TTY=$(tty)
export GPG_TTY="$(tty)"

# Path to your oh-my-zsh installation.

export ZSH="/data/data/com.termux/files/home/.zsh"

# custom prompt + colors
# bildin zsh prompt
autoload colors -Uz && colors
setopt prompt_subst
# autoload -U promptinit
# promptinit
# prompt astro-z
# ENABLE_COMMAND_TIP=true

# oh-my-zsh settings
DISABLE_AUTO_UPDATE="true"
DISABLE_COMPFIX="true"
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$HOME/.zsh/custom"
ZSH_CACHE_DIR="$HOME/.cache/zsh"
# ZDOTDIR=$HOME/.config/zsh

# Plugins
plugins=(extract nice-exit-code colored-man-pages
gitfast python zsh-hist colorize zsh-autopair
dotbare fzf fzf-tab you-should-use pip
#ssh-agent keychain gpg-agent
# youtube-dl web-search
# git npm nvm node
# zsh-lazyload
# zsnapshot
# zhooks
title
# evalcache
zsh-completions
zsh-autosuggestions
fast-syntax-highlighting
# zui zbrowse
)

source $ZSH/oh-my-zsh.sh
_dotbare_completion_cmd dot
_comp_options+=(globdots)

# Plugin settings
ZSH_COLORIZE_STYLE="gruvbox-dark"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"
ZSH_AUTOSUGGEST_USE_ASYNC=true

export YSU_MODE=ALL
export YSU_MESSAGE_POSITION=after
export YSU_IGNORED_ALIASES=( "g" "gc" "iaf" )
export YSU_MESSAGE_FORMAT="${BOLD}${YELLOW}\
Found %alias_type for ${PURPLE}\"%command\"${YELLOW}. \
You should use: ${PURPLE}\"%alias\"${NONE}"

FORGIT_COPY_CMD='termux-clipboard-set'

eval "$(lua5.3 ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once)"
export _ZL_EXCLUDE_DIRS="~/.cfg.git,.cache,buffers,_*,.git"
#export _ZL_NO_PROMPT_COMMAND=1

# User configuration
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /$PREFIX/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
LESSCOLORIZER=pygmentize

export EDITOR=nvim
export VISUAL="nvim"
export PAGER="bat -p --paging=always"
export BROWSER="lynx"
# export FILE="vifm"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=UTF-8
export CLICOLORS=true
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1
# export TMUX_TMPDIR="$PREFIX/var/run"
# export FZF_TMPDIR="$PREFIX/var/run"
export LESSHISTFILE="-"
export HISTIGNORE="&:l:ls:ll:la"
export BAT_THEME="gruvbox-dark"
export DOTBARE_DIR="$HOME/.cfg.git"
export DOTBARE_TREE="$HOME"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window=down:50%"
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
alias dotbare="$HOME/.zsh/custom/plugins/dotbare/dotbare"

# export MANPATH="data/data/com.termux/usr/share/doc/man
export MANPATH="$HOME/.fzf/man":$MANPATH
# Keydelay + disable right prompt indent
export KEYTIMEOUT=3000
ZLE_RPROMPT_INDENT=0

# For a full list of active aliases, run `alias`
# Example aliases
# alias ohmyzsh="vim ~/.oh-my-zsh"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

source ~/.aliases

# Correction
#setopt correctall
setopt correct

# Misc
# > and >> work as expected
setopt clobber

# Enable piping to multiple outputs
setopt multios

# Enable comments in interactive mode
setopt interactivecomments

# Safe rm. Wait 10 seconds before executing "rm *"
setopt rm_star_wait
unsetopt rm_star_silent

# Directories
setopt autocd # change directory without cd
setopt cdable_vars
setopt pushdtohome
setopt pushd_silent

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
setopt globdots
setopt caseglob
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

PROMPT_TITLE="%~ | ${COLUMNS}x${LINES} | %! | %? | %y |"

# Change cursor shape for different vi modes.
function zle-keymap-select () {
case $KEYMAP in
  vicmd) echo -ne '\e[1 q';;      # block
  viopp) echo -ne '\e[3 q';;      # line
  viins|main) echo -ne '\e[5 q';; # beam
esac
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' }

# Starship prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# keybindings
bindkey -s '^[R' 'ranger_cd \n'
bindkey -s '^[V' 'vifm\n'
# bindkey '^[B' zbrowse
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;3C" kill-word
bindkey "^[[1;3D" backward-kill-word
bindkey '^[v' vi-cmd-mode
bindkey '^[' vi-cmd-mode

source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"

source ~/.config/ranger/shell_*.sh

source /sdcard/Termux/launch-completion.bash

# sticky notes
autoload -Uz sticky-note
    zle -N sticky-note
zstyle :sticky-note notefile ~/documents/notes/notes
zstyle :sticky-note maxnotes 500
zstyle :sticky-note theme \
    bg red \
    fg $fg_bold[yellow]
bindkey "^s" sticky-note

############# >FZF Base< #############

bindkey -s '^[i' 'interactive_fzf \n'
bindkey -s '^nn' 'notes\n'
bindkey -s '^fd' 'dotf\n'
bindkey -s '^fn' 'live_search_notes \n'
bindkey -s '^ff' 'fuz\n'
bindkey    '^ft' 'toggle-fzf-tab'

export FZF_BASE='~/.fzf'
#export FZF_BASE='$PREFIX/share/fzf'
export FZF_DEFAULT_COMMAND='ag --hidden --color -S -U -g ""'
export FZF_DEFAULT_OPTS="--height 92% --color=bg:-1,bg+:236,fg:015,fg+:7 \
    --color=gutter:-1,info:136,border:009,spinner:108,hl:001,hl+:076 \
    --color=header:148,pointer:124,marker:5,prompt:6 \
    --layout=reverse --border --info=inline --ansi --cycle --bind change:first"
export FZF_ALT_C_COMMAND='fd --type d . -a --color=always --hidden -L --no-ignore-vcs --base-directory /data/data/com.termux/files'
export FZF_ALT_C_OPTS="--ansi --preview 'tree -U -l -C -L 3 {}' --preview-window=hidden \
  --bind=alt--:toggle-preview --keep-right --bind change:first"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--ansi --preview 'bat --color=always --line-range :200 {}' \
  --preview-window 'down,50%,border-top,+{2}+3/3,hidden' \
  --bind=alt--:toggle-preview --bind change:first"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind 'alt--:toggle-preview'"
# export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_TMUX_OPTS="-d 60%"
export FZF_TMUX=1

# FZF Function Examples

fzf-history-widget-accept() {
    fzf-history-widget
    zle accept-line
}
zle -N fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

# Auto cd with fzf
fzf_cd() { zle -I; DIR=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf --keep-right) && "$DIR" ; }; zle -N fzf_cd;
bindkey '^[j' fzf_cd

# zlua fzf integration
unalias z 2> /dev/null
unalias zz 2> /dev/null

j() {
    [ $# -gt 0 ] && _zlua "$*" && return
    "$(_zlua -l 2>&1 | fzf --keep-right --height 85% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

z() {
    if [[ -z "$*" ]]; then
        cd "$(_zlua -l 2>&1 | fzf --keep-right +s --tac | sed 's/^[0-9,.]* *//')"
    else
        _last_z_args="$@"
        _zlua "$@"
    fi
}

zz() {
    cd "$(_zlua -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf --keep-right -q "$_last_z_args")"
}

# run npm script (requires jq)
fns() {
    local script
    script=$(cat $HOME/package.json | jq -r '.scripts | keys[] ' | sort ) && npm run $(echo "$script")
}

# ftags - search ctags with preview
# only works if tags-file was generated with --excmd=number
ftags() {
    local line
    [ -e tags ] &&
        line=$(
            awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
                fzf \
                --nth=1,2 \
                --with-nth=2 \
                --preview-window="50%" \
                --preview="bat {3} --color=always | tail -n +\$(echo {4} | tr -d \";\\\"\")"
                            ) && ${EDITOR:-vim} $(cut -f3 <<< "$line") -c "set nocst" \
                                -c "silent tag $(cut -f2 <<< "$line")"
}

# see environment variables
envs() {
    # ps eww -o command | tr ' ' '\n'
    printenv | fzf -m
}
