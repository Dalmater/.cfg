
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path to oh-my-zsh installation.
export ZSH="$HOME/.zsh"

# custom prompt
# bildin zsh prompt
# autoload -U promptinit
# promptinit
# prompt -s astro-z
# ENABLE_COMMAND_TIP=true

# oh-my-zsh settings
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$ZDOTDIR"
ZSH_CACHE_DIR="$HOME/.cache/zsh"
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump-${ZSH_VERSION}"

ZSH_EVALCACHE_DIR="$HOME/.cache/evalcache"
HISTFILE="$HOME/.cache/zsh/.zsh_history"

# Plugins
plugins=(
  # colorize
  colored-man-pages
  zsh-hist
  zsh-autopair
  title
  # dotbare
  fzf-tab
  # you-should-use
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

# _evalcache dircolors -b ~/.dircolors
# Plugin configuration
# export ZSH_COLORIZE_STYLE="gruvbox-dark"
# export ZSH_COLORIZE_TOOL="pygmentize"
# export ZSH_COLORIZE_FORMATTER="terminal256"
# export ZSH_COLORIZE_CHROMA_FORMATTER="terminal256"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="50"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"
ZSH_AUTOSUGGEST_USE_ASYNC="true"

source $ZDOTDIR/plugins/you-should-use/you-should-use.plugin.zsh
export YSU_MODE=ALL
export YSU_MESSAGE_POSITION=after
export YSU_IGNORED_ALIASES=( "g" "gc" "iaf" "cfg" )
export YSU_MESSAGE_FORMAT="${BOLD}${YELLOW}\
Found %alias_type for ${PURPLE}"%command"${YELLOW} \
\nYou should use: ${RED}"%alias"${NONE}"

# eval "$(lua5.3 ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once)"
_evalcache lua5.3 ~/.config/zsh/plugins/z.lua/z.lua --init zsh
export _ZL_EXCLUDE_DIRS="buffers,.git,node_modules,'_*','*_'"
export _ZL_DATA="~/.cache/zsh/.zlua"
export _ZL_ADD_ONCE=1
export _ZL_MATCH_MODE=1
# export _ZL_NO_CHECK=1

# User configuration

export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="bat -p --paging=always"
export MANPAGER="bat -p --paging=always"
export MANPATH=$PREFIX/share/man
export MANPATH=$HOME/.fzf/man:$MANPATH
export OPENER="xdg-open"
export BROWSER="lynx"
export WWW_HOME="duckduckgo.com"
export FILE="vifm"
export BAT_THEME="gruvbox"

# For a full list of active aliases, run `alias`
# Example aliases
alias ohmyzsh="nvim ~/.zsh/oh-my-zsh.sh"

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
# setopt rm_star_wait
setopt no_rm_star_silent

# Directories
setopt auto_cd # change directory without cd
setopt cd_silent
# setopt auto_pushd
setopt pushd_to_home
setopt pushd_silent
# setopt pushd_minus
# setopt pushd_ignore_dups
# setopt cdable_vars

# History
setopt hist_append
setopt hist_expand
setopt hist_no_store
setopt hist_lex_words
setopt hist_save_no_dups
setopt inc_append_history
setopt hist_ignore_all_dups
setopt no_hist_reduce_blanks
setopt inc_append_history_time

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
  *)          echo -ne '\e[3 q';;
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
bindkey          '^[b' backward-kill-word
bindkey -M viins '^[b' backward-kill-word
bindkey -M vicmd '^[b' backward-kill-word

# source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"
lazyload launch -- 'source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"'

source /sdcard/Termux/launch-completion.bash

# source ~/.config/ranger/shell_automatic_cd.sh
lazyload ranger_cd -- 'source "${HOME}/.config/ranger/shell_automatic_cd.sh"'

############# >FZF Base< #############

bindkey -s '^[i' 'interactive_fzf \n'
bindkey -s '^Gn' 'notes \n'
bindkey -s '^fc' 'dotf \n'
bindkey -s '^fg' 'fzf_git \n'
bindkey -s '^fn' 'live_search_notes \n'
bindkey -s '^ff' 'fuz \n'
bindkey    '^ft' 'toggle-fzf-tab'
bindkey -s '^[r' 'rg-fzf \n'
bindkey    '^X,' 'toggle-fzf-tab'
bindkey -s '^fo' 'file="$(fzf --height 40% --reverse)" && [ -f "$file" ] && xdg-open "$file --chooser" \n'

source "$HOME/.config/zsh/plugins/dotbare/dotbare.plugin.zsh"
source "/data/data/com.termux/files/home/.fzf/shell/key-bindings.zsh"
# source "$ZDOTDIR/fzf-cfg.zsh"
source "$HOME/scripts/fzf_functions.zsh"

# export FZF_BASE='~/.fzf'
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow -c always --exclude .git'
export FZF_DEFAULT_COMMAND='ag --hidden --follow --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--height 90% --min-height 20 --color=fg:#ebdbb2 \
  --color=gutter:-1,info:#d79921,border:21,hl:underline:#928374,hl+:#fb4934 \
  --color=header:#8ec07c,pointer:#cc241d,prompt:#689d6a,marker:#91970a,spinner:#fe8019 \
  --pointer='❯' --marker='√' --cycle --filepath-word --ansi \
  --layout=reverse --info=inline --preview-window=down,60%,border-top,hidden \
  --bind 'alt-t:+toggle-preview,alt-s:+toggle-sort,alt-j:jump,?:change-preview:echo {}' \
  --bind 'alt-w:toggle-preview-wrap,alt-right:+kill-word,alt-left:+backward-kill-word' \
  --bind 'alt-a:+toggle-all,tab:+toggle+down,alt-bs:+toggle-up,alt-u:deselect-all' \
  --bind 'backward-eof:abort,ctrl-h:delete-char/eof,alt-|:+change-preview:file {}' \
  --bind 'ctrl-d:change-prompt(Directories> )+reload(fd -td -HL --color=always --exclude={.git})' \
  --bind 'ctrl-f:change-prompt(Files> )+reload(fd -tf -HL -c always --exclude={.git})' \
  --bind 'alt-l:execute(less& -f {}),alt-y:execute-silent(printf {+} | cut -f 2- | termux-clipboard-set)' \
  --preview '([[ -f {} ]] && (bat --color=always --line-range :200 {})) || ([[ -d {} ]] && (tree -a -L 4 -C {} | less)) || echo {}' \
  --bind 'alt--:change-preview-window(3,border-top,wrap|right,border-left|70%,border-top|),alt-o:execute(echo {+} | xargs -o $EDITOR),ctrl-e:execute(nvim {+} >/dev/tty)'"
export FZF_ALT_C_COMMAND='fd --type d -HLa -c always \
  --base-directory /data/data/com.termux/files --exclude={.git}'
export FZF_ALT_C_OPTS="--preview 'exa -a1 --icons {}' --preview-window=right,40%,border \
  --keep-right --bind change:first"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND='fd -tf -LH -c always --exclude={.git}'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :200 {}' \
  --preview-window 'down,60%,hidden' --keep-right --bind change:first"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=down,3,hidden,wrap,border \
  --bind change:first --exact"
# export FZF_CTRL_R_OPTS='--sort --exact'
# export FZF_COMPLETION_OPTS="--height 85% --min-height 20 --no-border --info=inline --preview-window=down,3,hidden,wrap,border-top --preview 'eval eval echo {+}'"
# export FZF_TMUX_OPTS="-p -h 80% -w 80% --preview-window 'down,50%:hidden:wrap'"
export FZF_TMUX_OPTS="-d 60%"
export FZF_TMUX=1
export FZF_HISTORY_DIR='~/.local/share/fzf-history'
export DOTBARE_DIR="$HOME/.cfg.git"
export DOTBARE_TREE="$HOME"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window 'down,70%' --keep-right --ansi"
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
export DOTBARE_KEY="--bind=alt-j:jump-accept,alt-w:toggle-preview-wrap"
# alias dotbare="$HOME/.zsh/custom/plugins/dotbare/dotbare"
bindkey -s '^Fd' 'dotbare fedit \n'
bindkey -s '^Xx' 'dotbare fedit \n'
_dotbare_completion_cmd #dotbare
# _dotbare_completion_git dot
# export FORGIT_FZF_DEFAULT_OPTS="--preview-window 'down,70%'"
# FORGIT_COPY_CMD='termux-clipboard-set'

# FZF Function Examples

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
      --preview-window=border:3:wrap:nohidden | sed 's/^[0-9,.]* *//')"
        else
          _last_z_args="$@"
          _zlua "$@"
  fi
}

jj() {
  cd "$(_zlua -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf --keep-right \
    --preview-window=border:5:wrap:nohidden -q "$_last_z_args")"
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
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# only for the first session
case $- in *i*)
  if [[ ! "$(tmux list-sessions)" ]] 2>/dev/null; then exec tmux new -s 1; fi
esac
