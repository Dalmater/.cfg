# source fzf + completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path to oh-my-zsh installation.
export ZSH="$HOME/.zsh"

# custom prompt
# bildin zsh prompt
# autoload -U promptinit
# promptinit
# prompt -s astro-z
ENABLE_COMMAND_TIP=true

# oh-my-zsh settings
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$ZDOTDIR"
ZSH_CACHE_DIR="$HOME/.cache/zsh"
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump-${ZSH_VERSION}"

ZSH_EVALCACHE_DIR="$HOME/.cache/evalcache"
HISTFILE="$HOME/.cache/zsh/.zsh_history"
HISTSIZE=120000
SAVEHIST=30000

# Plugins
plugins=(
  colored-man-pages
  zsh-hist
  zsh-autopair
  title
  # dotbare
  fzf-tab
  # you-should-use
  # ssh-agent gpg-agent
  # zsh-handy-helpers
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

# zstyle ':hist:*' expand-aliases yes

source $ZSH/oh-my-zsh.sh

# Plugin configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="50"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"
ZSH_AUTOSUGGEST_USE_ASYNC="true"

source $ZDOTDIR/plugins/you-should-use/you-should-use.plugin.zsh
# export YSU_MODE=ALL
export YSU_MESSAGE_POSITION=after
export YSU_IGNORED_ALIASES=( "g" "gc" "iaf" "cfg" "py" )
export YSU_MESSAGE_FORMAT="${BOLD}${YELLOW}\
Found %alias_type for ${PURPLE}"%command"${YELLOW} \
\nYou should use ${GREEN}=> ${RED}"%alias"${NONE}"

# eval "$(lua ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once)"
_evalcache lua ~/.config/zsh/plugins/z.lua/z.lua --init zsh enhanced once
export _ZL_EXCLUDE_DIRS="buffers,.git,'_*','*_'"
export _ZL_DATA="$HOME/.cache/zsh/.zlua"
export _ZL_ADD_ONCE=1
# export _ZL_MATCH_MODE=1
# export _ZL_NO_CHECK=1

# User configuration

export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="bat -p --paging=always"
# export MANPAGER="bat -p --paging=always"
export MANPATH=$PREFIX/share/man
export MANPATH=$HOME/.fzf/man:$MANPATH
# export OPENER="xdg-open"
# export BROWSER="lynx"
# export WWW_HOME="duckduckgo.com"
# export FILE="vifm"
export BAT_THEME="gruvbox"

# For a full list of active aliases, run `alias`
# Example aliases
alias ohmyzsh="${EDITOR} ~/.zsh/oh-my-zsh.sh"

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Correction
setopt correct

# Misc
# > and >> work as expected (default)
# setopt clobber
# Enable piping to multiple outputs (default)
# setopt multios
# Enable comments in interactive mode
setopt interactive_comments
# Safe rm. Wait 10 seconds before executing "rm *"
# setopt rm_star_wait
setopt no_rm_star_silent

# Directories
setopt auto_cd # change directory without cd
setopt cd_silent
# setopt auto_pushd # (set by ohmyzsh)
setopt pushd_to_home
setopt pushd_silent
# setopt pushd_minus # (set by ohmyzsh)
# setopt pushd_ignore_dups # (set by ohmyzsh)
setopt cdable_vars

# History
# setopt hist_append # (default)
# setopt hist_expand
# setopt share_history # (set by ohmyzsh)
setopt hist_lex_words
setopt hist_save_no_dups
setopt hist_find_no_dups
# setopt hist_ignore_all_dups
# setopt inc_append_history
unsetopt hist_reduce_blanks

export PROMPT_TITLE='%~ | ${COLUMNS}x${LINES} | %! | %? | %y |'

# Change cursor shape for different vi modes.
function zle-keymap-select () {
case $KEYMAP in
  viins|main) echo -ne '\e[5 q';; # beam
  vicmd)      echo -ne '\e[1 q';; # block
  command)    echo -ne '\e[4 q';;
  *)          echo -ne '\e[3 q';; # line
esac
}
zle -N zle-keymap-select
# Use beam shape cursor on startup.
# echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' }

# Starship prompt
# eval "$(starship init zsh)"
_evalcache starship init zsh
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# custom keybindings
bindkey -s       '^[R' 'ranger_cd \n'
bindkey -s       '^[V' 'vifm \n'
bindkey          '^[v'  vi-cmd-mode
bindkey       '^[[1;3C' kill-word
bindkey       '^[[1;3D' backward-kill-word
bindkey          '^[[H' beginning-of-line
bindkey -M vicmd '^[[H' beginning-of-line
bindkey          '^[[F' end-of-line
bindkey -M vicmd '^[[F' end-of-line
bindkey          '^[b'  backward-kill-word

# source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"
lazyload launch -- 'source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"'

source /sdcard/Termux/launch-completion.bash

# source ~/.config/ranger/shell_automatic_cd.sh
lazyload ranger_cd -- 'source "${HOME}/.config/ranger/shell_automatic_cd.sh"'

############# >FZF Base< #############

bindkey -s '^[i' 'interactive_fzf \n'
bindkey -s '^Fc' 'dotf \n'
bindkey -s '^Ff' 'fuz \n'
bindkey -s '^[r' 'rgf \n'
bindkey    '^Ft' toggle-fzf-tab
bindkey    '^X,' toggle-fzf-tab
bindkey -s '^Fo' 'file="$(fzf --reverse)" && [ -f "$file" ] && xdg-open "$file" --chooser'

source $HOME/.config/zsh/plugins/dotbare/dotbare.plugin.zsh
source $HOME/.fzf/shell/key-bindings.zsh

source $HOME/scripts/fzf_functions.zsh

# export FZF_BASE='~/.fzf'
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow -c always --exclude .git'
export FZF_DEFAULT_COMMAND='ag --hidden --follow --ignore .git -g ""'
 # "➜"
export FZF_DEFAULT_OPTS="--height 90% --min-height 20 --color=fg:#ebdbb2 \
  --color=gutter:-1,info:#d79921,border:21,hl:underline:#928374,hl+:#fb4934 \
  --color=header:#8ec07c,pointer:#cc241d,prompt:#689d6a,marker:#91970a,spinner:#fe8019 \
  --pointer='➟' --marker='√' --cycle --filepath-word --ansi -0 \
  --layout=reverse --info=inline --preview-window=down,60%,border-top,hidden \
  --bind 'alt-0:top,alt-t:+toggle-preview,alt-s:+toggle-sort,?:change-preview:echo {}' \
  --bind 'alt-w:toggle-preview-wrap,alt-right:+kill-word,alt-left:+backward-kill-word' \
  --bind 'backward-eof:abort,ctrl-h:delete-char/eof,alt-|:+change-preview:file {}' \
  --bind 'alt-a:+toggle-all,tab:toggle+down,alt-bs:toggle+up,alt-u:deselect-all' \
  --bind 'ctrl-d:change-prompt(Directories> )+reload(fd -td -HL --color=always)' \
  --bind 'alt-j:jump,ctrl-f:change-prompt(Files> )+reload(fd -tf -HL -c always)' \
  --bind 'alt-y:execute-silent(printf {+} | cut -f2- | termux-clipboard-set)' \
  --preview '([[ -f {} ]] && (bat --color=always --line-range :200 {})) || ([[ -d {} ]] && (tree -a -L 4 -C {} | less)) || echo {}' \
  --bind 'alt-t:+change-preview-window(|3,border,wrap|70%,border-top|right,55%,border-left)' \
  --bind 'alt-o:execute(xdg-open --chooser {+} >/dev/tty),ctrl-e:execute(nvim -p {+} >/dev/tty)'"
export FZF_ALT_C_COMMAND='fd --type d -HLa -c always \
  --base-directory /data/data/com.termux/files'
export FZF_ALT_C_OPTS="--preview 'exa -a1 --icons {}' --preview-window=right,40%,border \
  --keep-right --bind change:first,alt-j:jump-accept"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND='fd -tf -LH -c always --exclude={.git}'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :200 {}' \
  --preview-window 'down,60%,hidden' --keep-right --bind change:first"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=down,3,hidden,wrap,border \
  --bind change:first,alt-j:jump-accept --exact"
# export FZF_COMPLETION_OPTS="--height 85% --min-height 20 --no-border --info=inline --preview-window=down,3,hidden,wrap,border-top"
# export FZF_TMUX_OPTS="-p -h 80% -w 80% --preview-window 'down,50%:hidden:wrap'"
# export FZF_TMUX_OPTS="-d 60%"
# export FZF_TMUX=1
export FZF_HISTORY_DIR="$XDG_DATA_HOME/fzf-history"
export DOTBARE_DIR="$HOME/.cfg.git"
export DOTBARE_TREE="$HOME"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window 'down,70%' --keep-right --ansi"
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
export DOTBARE_KEY="--bind 'alt-j:jump-accept,alt-w:toggle-preview-wrap'"
# alias dotbare="$HOME/.config/zsh/plugins/dotbare/dotbare"
bindkey -s '^Fd' 'dotbare fedit \n'
bindkey -s '^Xx' 'dotbare fedit \n'
_dotbare_completion_cmd #dotbare
# _dotbare_completion_git dot
# export FORGIT_FZF_DEFAULT_OPTS="--preview-window 'down,70%'"
# FORGIT_COPY_CMD='termux-clipboard-set'

# FZF Function Examples

# Auto cd with fzf
fzf_cd() {
  local DIR
  zle -I
  DIR=$(find ${1:-*} \( -path .cache -o -path .cfg.git -o -path .git \) -prune -o -path '*/\.*' \
    -prune -o -type d -print 2> /dev/null | fzf +m --keep-right) && cd "$DIR"
  zle reset-prompt
  }
zle -N fzf_cd
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
        --preview-window="50%,nohidden" \
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
# case $- in *i*)
#   if [[ ! "$(tmux ls)" ]] 2>/dev/null; then exec tmux new -A -s 1
#   fi
# esac
