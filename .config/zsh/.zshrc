[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path to your oh-my-zsh installation.
export ZSH="/data/data/com.termux/files/home/.zsh"

# custom prompt + colors
# bildin zsh prompt
# autoload colors -Uz && colors
# setopt prompt_subst
# autoload -U promptinit
# promptinit
# prompt astro-z
# ENABLE_COMMAND_TIP=true

# oh-my-zsh settings
DISABLE_AUTO_UPDATE="true"
# DISABLE_COMPFIX="true"
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$HOME/.zsh/custom"
ZSH_CACHE_DIR="$HOME/.cache/zsh"
# FAST_WORK_DIR=XDG

# Plugins
plugins=(colorize nice-exit-code colored-man-pages pip
extract gitfast python zsh-hist zsh-autopair title
z.lua dotbare fzf-tab you-should-use fd ag
#ssh-agent keychain gpg-agent
# git npm nvm node
# zsh-lazyload
# zsnapshot
# zhooks
# evalcache
zsh-completions
zsh-autosuggestions
fast-syntax-highlighting
# zui zbrowse
)

source $ZSH/oh-my-zsh.sh

# Plugin configuration
ZSH_COLORIZE_STYLE="gruvbox-dark"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"
ZSH_AUTOSUGGEST_USE_ASYNC=true

export YSU_MODE=ALL
export YSU_MESSAGE_POSITION=after
export YSU_IGNORED_ALIASES=( "g" "gc" "iaf" "cfg" )
export YSU_MESSAGE_FORMAT="${BOLD}${YELLOW}\
Found %alias_type for ${PURPLE}\"%command\"${YELLOW}. \
You should use: ${PURPLE}\"%alias\"${NONE}"

FORGIT_COPY_CMD='termux-clipboard-set'

# eval "$(lua5.3 ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once)"
export _ZL_EXCLUDE_DIRS="buffers,_*,.git,node_modules"
# export _ZL_NO_PROMPT_COMMAND=1
export _ZL_DATA="~/.cache/zsh/.zlua"
export _ZL_ADD_ONCE=1
export _ZL_MATCH_MODE=1
# export _ZL_NO_CHECK=1

# User configuration
export DOTBARE_DIR="$HOME/.cfg.git"
export DOTBARE_TREE="$HOME"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window=down:60% --keep-right"
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
# alias dotbare="$HOME/.zsh/custom/plugins/dotbare/dotbare"
bindkey -s '^Xx' 'dotbare fedit \n'
_dotbare_completion_cmd #dotbare

export MANPATH=$PREFIX/share/man
export MANPATH=$HOME/.fzf/man:$MANPATH

# Keydelay + disable right prompt indent
export KEYTIMEOUT=100 # 1sec
ZLE_RPROMPT_INDENT=0

# For a full list of active aliases, run `alias`
# Example aliases
alias ohmyzsh="vim ~/.zsh/oh-my-zsh.sh"

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
# setopt autolist
setopt complete_in_word
setopt always_to_end
setopt menucomplete
setopt listpacked
setopt glob_dots
setopt case_glob
setopt globcomplete
# setopt complete_aliases
# setopt extended_glob
setopt glob_star_short
#setopt numeric_glob_sort
setopt mark_dirs
# setopt nomatch
#setopt rc_quotes
#setopt rec_exact
setopt autoparamslash
setopt noautoremoveslash
# setopt transient_rprompt
setopt hash_all
setopt hash_list_all
setopt hash_cmds
setopt hash_dirs
setopt bang_hist

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
bindkey -s '^[V' 'vifm \n'
# bindkey '^[B' zbrowse
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1;3C' kill-word
bindkey '^[[1;3D' backward-kill-word
bindkey '^[v' vi-cmd-mode
# bindkey '^[' vi-cmd-mode

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
bindkey '^s' sticky-note

############# >FZF Base< #############

bindkey -s '^[i' 'interactive_fzf \n'
bindkey -s '^nn' 'notes \n'
bindkey -s '^fd' 'dotf \n'
bindkey -s '^fn' 'live_search_notes \n'
bindkey -s '^ff' 'fuz \n'
bindkey    '^ft' 'toggle-fzf-tab'
# bindkey '^R' fzf-history-widget

source "/data/data/com.termux/files/home/.fzf/shell/key-bindings.zsh"

export FZF_BASE='~/.fzf'
#export FZF_BASE='$PREFIX/share/fzf'
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .cache'
export FZF_DEFAULT_COMMAND='ag --hidden --color -S -U -g ""'
export FZF_DEFAULT_OPTS="--height 90% --color=bg:-1,bg+:236,fg:015,fg+:7:bold \
    --color=gutter:-1,info:136,border:001,spinner:108,hl:001,hl+:076 --cycle \
    --color=header:148,pointer:124,prompt:4,marker:010 --marker='✓' --border \
    --layout=reverse --info=inline --ansi --preview-window=down,50%,border-top,+{2}+3/3,hidden,wrap \
    --bind change:first --bind=alt-t:toggle-preview --bind 'alt-s:toggle-sort' \
    --bind 'ctrl-d:reload(fd --type d . --color=always --hidden),ctrl-f:reload($FZF_DEFAULT_COMMAND)' \
    --bind 'ctrl-l:execute(less -f {}),ctrl-y:execute-silent(echo {+} | termux-clipboard-set)+abort' \
    --bind 'ctrl-e:execute(echo {+} | xargs -o $EDITOR)' -0 \
    --preview '([[ -f {} ]] && (bat --style=numbers --color=always --line-range :200 {} || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'" #|| ([[ -c {} ]] && eval eval echo {$word} )'"
export FZF_ALT_C_COMMAND='fd --type d . -a --color=always --hidden -L --no-ignore-vcs --base-directory /data/data/com.termux/files'
export FZF_ALT_C_OPTS="--ansi --preview 'tree -U -l -C -L 3 {}' --preview-window=right,50%:hidden \
  --bind=alt-t:toggle-preview --keep-right --bind change:first"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--ansi --preview 'bat --color=always --line-range :200 {}' \
  --preview-window 'down,50%,border-top,+{2}+3/3,hidden' \
  --bind=alt-t:toggle-preview --bind change:first"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=down,3,hidden,wrap,border --bind 'alt-t:toggle-preview'"
# export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_TMUX_OPTS="-d 60% --preview-window 'down,40%:hidden:wrap'"
export FZF_TMUX=1
export FZF_COMPLETION_OPTS="--border --info=inline --preview 'eval eval echo {+}' --preview-window=down,3,hidden,wrap,border"

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
# unalias z 2> /dev/null
# unalias zz 2> /dev/null

# j() {
#     [ $# -gt 0 ] && _zlua "$*" && return
#     "$(_zlua -l 2>&1 | fzf --keep-right --height 85% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
# }

j() {
    if [[ -z "$*" ]]; then
        cd "$(_zlua -l 2>&1 | fzf --keep-right +s --tac | sed 's/^[0-9,.]* *//')"
    else
        _last_z_args="$@"
        _zlua "$@"
    fi
}

jj() {
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

# eliminates duplicates in *paths
# typeset -gU cdpath fpath path
