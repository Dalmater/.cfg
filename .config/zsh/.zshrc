[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path to oh-my-zsh installation.
export ZSH="$HOME/.zsh"

# custom prompt
# bildin zsh prompt
# setopt prompt_subst
# autoload -U promptinit
# promptinit
# prompt -s astro-z
# ENABLE_COMMAND_TIP=true

# oh-my-zsh settings
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$HOME/.zsh/custom"
ZSH_CACHE_DIR="$HOME/.cache/zsh"
ZSH_EVALCACHE_DIR="$HOME/.cache/evalcache"
HISTFILE="$HOME/.cache/zsh/.zsh_history"
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump-${ZSH_VERSION}"

# Plugins
plugins=(
  colorize
  colored-man-pages
  zsh-hist
  zsh-autopair
  title
  dotbare
  fzf-tab
  you-should-use
  # ssh-agent gpg-agent zsh-handy-helpers
  # keychain
  zsh-lazyload
  evalcache
  # zsnapshot
  # zhooks
  # zsh-autosuggestions
  # fast-syntax-highlighting
  # zui zbrowse zzcomplete
)

# zstyle :omz:plugins:ssh-agent agent-forwarding on
# zstyle :omz:plugins:keychain agents gpg,ssh
# zstyle :omz:plugins:ssh-agent identities
# zstyle :omz:plugins:ssh-agent lazy yes

source $ZSH/oh-my-zsh.sh

# Plugin configuration
ZSH_COLORIZE_STYLE="gruvbox-dark"
# ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"
ZSH_AUTOSUGGEST_USE_ASYNC=true

export YSU_MODE=ALL
export YSU_MESSAGE_POSITION=after
export YSU_IGNORED_ALIASES=( "g" "gc" "iaf" "cfg" )
export YSU_MESSAGE_FORMAT="${BOLD}${YELLOW}\
Found %alias_type for ${PURPLE}"%command"${YELLOW}. \
\nYou should use: ${RED}"%alias"${NONE}"

FORGIT_COPY_CMD='termux-clipboard-set'

# eval "$(lua5.3 ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once)"
_evalcache lua5.3 ~/.zsh/custom/plugins/z.lua/z.lua --init zsh
export _ZL_EXCLUDE_DIRS="buffers,.git,node_modules,'_*','*_'"
export _ZL_DATA="~/.cache/zsh/.zlua"
export _ZL_ADD_ONCE=1
export _ZL_MATCH_MODE=1
export _ZL_NO_CHECK=1

# User configuration

export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="bat -p --paging=always"
export MANPATH=$PREFIX/share/man
# export MANPATH=$HOME/.fzf/man:$MANPATH
# export MANPAGER="nvim -R -c 'set ft=man' -"
export OPENER="xdg-open"
export BROWSER="lynx"
export WWW_HOME="duckduckgo.com"
# export FILE="vifm"

# For a full list of active aliases, run `alias`
# Example aliases
alias ohmyzsh="vim ~/.zsh/oh-my-zsh.sh"

source ~/.aliases

# Correction
setopt correct

# Misc
# > and >> work as expected
setopt clobber
# Enable piping to multiple outputs
setopt multios
# Enable comments in interactive mode
setopt interactive_comments
# Safe rm. Wait 10 seconds before executing "rm *"
setopt rm_star_wait
setopt no_rm_star_silent

# Directories
setopt auto_cd # change directory without cd
setopt cd_silent
# setopt auto_pushd
setopt pushd_to_home
setopt pushd_silent
# setopt pushd_minus
# setopt pushd_ignore_dups

# History
setopt hist_append
setopt hist_expand
setopt hist_ignore_all_dups
setopt hist_lex_words
select hist_save_no_dups
setopt inc_append_history
setopt no_hist_reduce_blanks

export PROMPT_TITLE='%~ | ${COLUMNS}x${LINES} | %! | %? | %y |'

# Change cursor shape for different vi modes.
function zle-keymap-select () {
case $KEYMAP in
  viins|main) echo -ne '\e[5 q';; # beam
  vicmd)      echo -ne '\e[1 q';; # block
  visual)     echo -ne '\e[1 q';;
  viopp)      echo -ne '\e[3 q';; # line
  isearch)    echo -ne '\e[3 q';;
  command)    echo -ne '\e[4 q';;
  *)          echo -ne '\e[0 q';;
esac
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' }

# Starship prompt
# eval "$(starship init zsh)"
_evalcache starship init zsh

export STARSHIP_CONFIG=~/.config/starship/starship.toml

# keybindings
bindkey -s '^[R' 'ranger_cd \n'
bindkey -s '^[V' 'vifm \n'
bindkey    '^Z'   list-choices
bindkey    '^[[H' beginning-of-line
bindkey    '^[[F' end-of-line
bindkey    '^[[1;3C' kill-word
bindkey    '^[[1;3D' backward-kill-word
bindkey    '^[v'  vi-cmd-mode

# source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"
lazyload launch -- 'source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"'

source /sdcard/Termux/launch-completion.bash

# source ~/.config/ranger/shell_automatic_cd.sh
lazyload ranger_cd -- 'source "${HOME}/.config/ranger/shell_automatic_cd.sh"'

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

############# >FZF Base< #############

bindkey -s '^[i' 'interactive_fzf \n'
bindkey -s '^Gn' 'notes \n'
bindkey -s '^fd' 'dotf \n'
bindkey -s '^fn' 'live_search_notes \n'
bindkey -s '^ff' 'fuz \n'
bindkey    '^ft' 'toggle-fzf-tab'
bindkey -s '^[r' 'rg-fzf \n'
bindkey    '^X,' 'toggle-fzf-tab'

source "/data/data/com.termux/files/home/.fzf/shell/key-bindings.zsh"
# source "$ZDOTDIR/fzf-cfg.zsh"
source "$HOME/scripts/fzf_functions.zsh"

export FZF_BASE='~/.fzf'
#export FZF_BASE='$PREFIX/share/fzf'
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .cache'
export FZF_DEFAULT_COMMAND='ag -l --hidden -S -U -g "" --ignore .git'
export FZF_DEFAULT_OPTS="--height 90% --min-height 25 --color=bg:-1,bg+:#32302f,fg:#dbcba2,fg+:#dbcba2 \
  --color=gutter:-1,info:#d79921,border:1,spinner:#fb4934,hl:underline:#928374,hl+:#db3924 \
  --color=header:#8ec07c,pointer:#cd241d,prompt:#689d6a,marker:#78970a \
  --pointer='❯' --marker='√' --border --cycle --filepath-word --ansi -0 \
  --layout=reverse --info=inline --preview-window=down,60%,border-top,hidden \
  --bind 'alt--:+toggle-preview,alt-s:+toggle-sort,alt-j:jump' \
  --bind 'alt-w:toggle-preview-wrap,alt-right:+kill-word,alt-left:+backward-kill-word' \
  --bind 'alt-a:+toggle-all,tab:+toggle+down,alt-bs:+toggle-up,alt-u:deselect-all' \
  --bind 'backward-eof:abort,ctrl-h:delete-char/eof,alt-t:+toggle-preview' \
  --bind 'ctrl-d:reload(fd --type d . -L --color=always --hidden),ctrl-f:reload($FZF_DEFAULT_COMMAND)' \
  --bind 'alt-l:execute(less& -f {}),alt-y:execute-silent(echo {+} | termux-clipboard-set)' \
  --bind 'alt-o:execute(echo {+} | xargs -o $EDITOR)' --bind '?:preview:echo {}' \
  --preview '([[ -f {} ]] && (bat -A --style=numbers --color=always --line-range :200 {})) || ([[ -d {} ]] && (tree -a -L 4 -C {} | less)) || echo {} 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND='fd --type d . -a -L --color=always --hidden --no-ignore-vcs --base-directory /data/data/com.termux/files'
export FZF_ALT_C_OPTS="--ansi --preview 'exa -a1 --icons {}' --preview-window=right,40%:border \
  --keep-right --bind change:first --history=$HOME/.local/share/fzf-history/alt-c-history"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow --color always --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :200 {}' \
  --preview-window 'down,60%,border-top,hidden' --bind change:first --keep-right"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=down,3,hidden,wrap,border \
  --bind change:first --exact"
# export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_COMPLETION_OPTS="--height 85% --min-height 20 --no-border --info=inline" # --preview-window=down,3,hidden,wrap,border --preview 'eval eval echo {+}'"
# export FZF_TMUX_OPTS="-d 60% --preview-window 'down,50%:hidden:wrap'"
export FZF_TMUX=1
export FZF_HISTORY_DIR='~/.local/share/fzf-history'
export DOTBARE_DIR="$HOME/.cfg.git"
export DOTBARE_TREE="$HOME"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window 'down,70%' --keep-right"
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
export DOTBARE_KEY="--bind=alt-j:jump,alt-w:toggle-preview-wrap"
# alias dotbare="$HOME/.zsh/custom/plugins/dotbare/dotbare"
bindkey -s '^Xx' 'dotbare fedit \n'
_dotbare_completion_cmd #dotbare
# _dotbare_completion_git dot

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

# z() {
#     [ $# -gt 0 ] && _zlua "$*" && return
#     "$(_zlua -l 2>&1 | fzf --keep-right --height 85% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
# }

j() {
  if [[ -z "$*" ]]; then
    cd "$(_zlua -l 2>&1 | fzf --keep-right +s --tac \
      --preview-window=border:3:wrap | sed 's/^[0-9,.]* *//')"
        else
          _last_z_args="$@"
          _zlua "$@"
  fi
}

jj() {
  cd "$(_zlua -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf --keep-right -q "$_last_z_args")"
}

# run npm script (requires jq)
# fns() {
#   local script
#   script=$(cat $HOME/package.json | jq -r '.scripts | keys[] ' | sort ) && npm run $(echo "$script")
# }

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
# typeset -gU fpath path

#Last but not least
source ~/.zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
