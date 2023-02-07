# tmux only for the first session
# case $- in *i*)
#   if [[ ! "$(tmux ls)" ]] 2>/dev/null; then 
#     exec tmux new -s 1
#   elif [[ "$(tmux ls)" ]] 2>/dev/null; then
#     tmux attach-session
#   fi
# esac

# source fzf + completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path to oh-my-zsh installation.
export ZSH="$HOME/.zsh"

HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$ZDOTDIR"
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump-${ZSH_VERSION}"

# export HISTIGNORE="&:l:ls:ll:la:cd"
HISTFILE="${XDG_DATA_HOME}/zsh/.zsh_history"
HISTSIZE=120000
SAVEHIST=30000

# Plugins
plugins=(
  # zsh-edit
  # zsh-hist
  # zsh-autopair
  # title
  # dotbare
  # fzf-tab
  # you-should-use
  # ssh-agent gpg-agent
  # zsh-handy-helpers
  # zsh-lazyload
  # evalcache
  # zsnapshot
  # zhooks
  # zsh-autosuggestions
  # fast-syntax-highlighting
  # zui zbrowse zzcomplete
)

# zstyle :omz:plugins:ssh-agent agent-forwarding on
# zstyle :omz:plugins:ssh-agent identities
# zstyle :omz:plugins:ssh-agent lazy yes

# zstyle ':hist:*' expand-aliases yes
# zstyle ':hist:*' auto-format no

source $ZDOTDIR/plugins/evalcache/evalcache.plugin.zsh
source $ZDOTDIR/plugins/zsh-lazyload/zsh-lazyload.zsh
source $ZDOTDIR/plugins/you-should-use/you-should-use.plugin.zsh

source $ZSH/oh-my-zsh.sh

# source $ZDOTDIR/plugins/title/title.plugin.zsh
source $ZDOTDIR/plugins/zsh-autopair/autopair.zsh
source $ZDOTDIR/plugins/zsh-hist/zsh-hist.plugin.zsh
source $ZDOTDIR/plugins/fzf-tab/fzf-tab.zsh

ZSH_EVALCACHE_DIR="$HOME/.cache/evalcache"

# Plugin configurations
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="50"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"
ZSH_AUTOSUGGEST_USE_ASYNC="true"

export YSU_MODE=ALL
export YSU_MESSAGE_POSITION=after
export YSU_IGNORED_ALIASES=( "l" "gc" "iaf" "cfg" "py" )
export YSU_MESSAGE_FORMAT="$fg_bold[yellow]\
Found %alias_type for $fg[magenta]"%command"$fg[yellow] \
\nYou should use $fg[green]=> $fg[red]"%alias"${reset_color}"

# eval "$(lua ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once)"
_evalcache lua ~/.config/zsh/plugins/z.lua/z.lua --init zsh enhanced once
export RANGER_ZLUA="$HOME/.config/zsh/plugins/z.lua/z.lua"
export _ZL_EXCLUDE_DIRS="undo,buffers,.git,'_*','*_'"
export _ZL_DATA="${XDG_DATA_HOME:-$HOME/.config}/zsh/.zlua"
export _ZL_ADD_ONCE=1
# export _ZL_MATCH_MODE=1
export _ZL_NO_CHECK=1

# User configuration

export EDITOR="nvim"
export VISUAL="nvim"
# export PAGER="less -R"
# export PAGER="bat -p --paging=always"
# colored pager
env_default 'PAGER' 'less'
env_default 'LESS' '-R'

# colored man pages
export MANPAGER="most"
# or use less termcap variables
# export LESS_TERMCAP_mb=$'\e[1;34m'
# export LESS_TERMCAP_md=$'\e[1;31m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_so=$'\e[7;33;40m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[1;4;32m'

### Setopts: Misc ### {{{
# Correction
setopt correct
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
# setopt hist_find_no_dups
setopt hist_ignore_all_dups
# setopt inc_append_history
unsetopt hist_reduce_blanks
# Job Control
# setopt auto_resume
setopt long_list_jobs # (set by ohmyzsh/misc)
# setopt no_bg_nice
# Completion, expansion and globbing
# setopt always_to_end # (set by ohmyzsh)
# setopt complete_in_word # (set by ohmyzsh)
setopt glob_star_short
# setopt extended_glob
setopt glob_complete
setopt dot_glob
setopt no_beep
# Prompt
# setopt transient_rprompt
### }}}

# For a full list of active aliases, run `alias`
# Example alias
alias ohmyzsh="${EDITOR} ~/.zsh/oh-my-zsh.sh"
alias -g F='| fzf' # change F to whatever you like

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Change cursor shape for different vi modes.
function zle-keymap-select () {
case $KEYMAP in
  viins|emacs|main) echo -ne '\e[5 q';; # beam
  vicmd)      echo -ne '\e[1 q';; # block
  viopp)      echo -ne '\e[4 q';; # line
  command)    echo -ne '\e[3 q';; # line
  *)          echo -ne '\e[2 q';; # block
esac
}
zle -N zle-keymap-select zle-keymap-select
# Use beam shape cursor on startup.
# echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' }
preexec_funktion+=( echo -ne '\e[5 q' )

# always in vi-mode
# zle-line-init () {
#   zle -K vicmd
# }
# zle -N zle-line-init

# Starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(starship init zsh)"
_evalcache starship init zsh

PROMPT_TITLE='%27<...<%~%<< \ \ | ${COLUMNS}x${LINES} | %! | %? | %y | %T'

_show_title(){
  print -Pn "\033]0;${PROMPT_TITLE:-"$USER@$HOST"}\007"
}
precmd_functions+=(_show_title)

# source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"
lazyload launch -- 'source "${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher"'

source /sdcard/termux/launch-completion.bash

# source ~/.config/ranger/shell_automatic_cd.sh
lazyload ranger_cd -- 'source "${HOME}/.config/ranger/shell_automatic_cd.sh"'

# ------- custom keybindings --------

bindkey -s '^[R' 'ranger_cd \n'
bindkey -s '^[V' 'vifm_cd \n'
bindkey    '^[o' autosuggest-execute

############# >FZF Base< #############

bindkey -s '^[i' 'interactive_fzf \n'
bindkey -s '^Ff' 'ffe \n'
bindkey -s '^Fz' 'fuz \n'
bindkey -s '^[r' 'rgf \n'
bindkey    '^X,' toggle-fzf-tab
bindkey -s '^Fo' 'file="$(fzf --reverse)" && [ -f "$file" ] && xdg-open "$file" --chooser'

source $ZDOTDIR/plugins/dotbare/dotbare.plugin.zsh
source $HOME/.fzf/shell/key-bindings.zsh
# source $HOME/scripts/fzf_functions.zsh

# export FZF_BASE='~/.fzf'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow -c always --exclude .git'
# export FZF_DEFAULT_COMMAND='ag -l --hidden --ignore .git -g ""' # --pointer=👉
export FZF_DEFAULT_OPTS="--height 90% --min-height 20 --color=fg:#ebdbb2,bg+:#282828 \
  --color=gutter:-1,info:#d79921,border:#c00000,hl:reverse:#fabd2f,hl+:reverse:#fe8019 \
  --color=header:#8ec07c,pointer:#cc241d,prompt:#689d6a,marker:#91970a,spinner:#fb4934 \
  --pointer='➜' --marker='√' --cycle --filepath-word --ansi --tabstop=2 \
  --layout=reverse --info=inline --preview-window=down,60%,border-top,hidden \
  --bind 'alt-0:top,alt-t:toggle-preview,alt-s:+toggle-sort,?:change-preview:echo {} || echo $word' \
  --bind '?:+change-preview-window(down,4,border,wrap|)' \
  --bind 'alt-w:toggle-preview-wrap,alt-right:+kill-word,alt-left:+backward-kill-word' \
  --bind 'backward-eof:abort,ctrl-h:delete-char/eof,alt-|:+change-preview:file {}' \
  --bind 'alt-a:+toggle-all,tab:toggle+down,btab:toggle+up,alt-u:deselect-all' \
  --bind 'ctrl-d:change-prompt(Dir> )+reload(fd -td --strip-cwd-prefix -HL -c always)' \
  --bind 'alt-j:jump,ctrl-f:change-prompt(Files> )+reload(fd -tf --strip-cwd-prefix -H -c always)' \
  --bind 'alt-y:execute-silent(printf {+} | cut -f2- | termux-clipboard-set)' \
  --bind 'alt-t:+change-preview-window(|down,3,border,wrap|down,70%,border-top|right,60%,border-left)' \
  --bind 'alt-o:execute(xdg-open --chooser {+} >/dev/tty),ctrl-e:execute(nvim -p {+} >/dev/tty)' \
  --preview '([[ -f {} ]] && (bat --color=always --line-range :500 {} || cat {})) || ([[ -d {} ]] && (exa -a1 -T -L 4 -I=.git {} || tree -a -L 4 -C {})) || echo {} 2> /dev/null'"
export FZF_ALT_C_COMMAND='fd -td -HLap --strip-cwd-prefix --base-directory /data/data/com.termux/files'
export FZF_ALT_C_OPTS="--preview 'exa -a1 -I=.git {}' --preview-window=right,40%,border \
  --keep-right --bind change:first,alt-j:jump-accept --prompt 'Dir> '"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND='fd -tf --strip-cwd-prefix -HL -c always'
export FZF_CTRL_T_OPTS="--keep-right --bind change:first --prompt 'Files> ' \
  --bind 'focus:transform-preview-label:echo [ {} ]'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=down,3,wrap,border \
  --bind change:first,alt-j:jump-accept --sort --exact --prompt 'History> '"
# export FZF_COMPLETION_OPTS="--color=gutter:-1,info:#d79921,border:21,hl:reverse:#fabd2f,hl+:reverse:#fe8019 \
# --height 90% --min-height 20 --no-border --info=inline --preview-window=hidden,wrap,border-top"
# export FZF_TMUX_OPTS="-p -h 80% -w 80% --preview-window 'down,50%:hidden:wrap'"
# export FZF_TMUX_OPTS="-d 60%"
# export FZF_TMUX=1
export FZF_HISTORY_DIR="$XDG_DATA_HOME/fzf-history"
export FZF_HISTORY_SIZE=100

export DOTBARE_DIR="$HOME/.cfg.git"
export DOTBARE_TREE="$HOME"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window 'down,60%' --keep-right --ansi \
  --history=$XDG_DATA_HOME/fzf-history/dotfiles"
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --color-only"
export DOTBARE_KEY="--bind 'change:first,alt-j:jump-accept,alt-w:toggle-preview-wrap'"
# alias dotbare="$HOME/.config/zsh/plugins/dotbare/dotbare"
bindkey -s '^Fd' 'dotbare fedit \n'
_dotbare_completion_cmd #dotbare
# _dotbare_completion_git dot
# export FORGIT_FZF_DEFAULT_OPTS="--preview-window 'down,70%'"
FORGIT_COPY_CMD='termux-clipboard-set'

# FZF Function Examples {{{

# __fzf_comprun() {
#   local command=$1
#   shift

#   case "$command" in
#     cd)           fzf "$@" --preview 'exa -a1 -T -L 4 -I=.git {}' ;;
#     ls)           fzf "$@" --preview 'exa -a1 -T -L 4 -I=.git {}' ;;
#     exa)          fzf "$@" --preview 'exa -a1 -T -L 4 -I=.git {}' ;;
#     nvim)         fzf "$@" --preview 'bat {} 2> /dev/null || exa -a1 -T -L 4 -I=.git {}' ;;
#     glow)         fzf "$@" --preview 'echo {}' ;;
#     *)            fzf "$@" ;;
#   esac
# }

# Auto cd with fzf
fzf_cd() {
  local DIR
  zle -I
  DIR=$(find ${1:-*} \( -path .cache -o -path .cfg.git -o -path .git \) -prune -o -path '*/\.*' \
  -prune -o -type d -print 2> /dev/null | fzf +m --keep-right --bind=change:first,alt-j:jump-accept \
  --history=$XDG_DATA_HOME/fzf-history/ls \
  --preview-window=right:60%:border-left) && cd "$DIR"
  zle reset-prompt
}
zle -N fzf_cd
bindkey '^[j' fzf_cd

# zlua fzf integration
# unalias z 2> /dev/null
# unalias zz 2> /dev/null
# z() {
#     [ $# -gt 0 ] && _zlua "$*" && return
#     "$(_zlua -l 2>&1 | fzf --keep-right --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
# }

j() {
  if [[ -z "$*" ]]; then
    cd "$(_zlua -l 2>&1 | fzf --keep-right +s --tac --preview-window=border:3:wrap:nohidden \
      --bind=alt-j:jump-accept,change:first | sed 's/^[0-9,.]* *//')"
        else
          _last_z_args="$@"
          _zlua "$@"
  fi
}

jj() {
  cd "$(_zlua -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf --keep-right --bind=alt-j:jump-accept,change:first \
    --preview-window=border:3:wrap:nohidden -q "$_last_z_args")"
}

# ftags - search ctags with preview
# only works if tags-file was generated with --excmd=number
ftags() {
  local line

  [[ -e 'tags' ]] || return

  line="$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags \
      | cut -c1-"$COLUMNS" \
      | fzf --nth=2 --tiebreak=begin \
        --preview="bat {3} | tail -n +\$(echo {4} | tr -d \";\\\"\")"
  )" || return

  "${EDITOR:-vim}" "$(cut -f3 <<< "$line")" \
    -c 'set nocst' \
    -c "silent tag \"$(cut -f2 <<< "$line")\""
  zle reset-prompt
}

zle -N ftags
bindkey '^Ft' ftags

# see environment variables
envs() {
  # ps eww -o command | tr ' ' '\n'
  printenv | fzf -m
}

# GIT --bare functions
is_in_dot_repo() {
  dot rev-parse HEAD >/dev/null 2>&1
}

fzf-down() {
fzf --height 90% --min-height 18 --preview-window=down,60%,border-top "$@"
}

fzf_gf() {
  is_in_dot_repo || return
  dot -c color.status=always status --short |
    fzf-down -m --ansi --nth 2..,.. \
    --preview '(git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME diff --color=always -- {-1} | delta | sed 1,4d; cat {-1})' |
    cut -c4- | sed 's/.* -> //'
  }

fzf_gb() {
  is_in_dot_repo || return
  dot branch -a --color=always | grep -v '/HEAD\s' | sort |
    fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
    sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/##'
  }

fzf_gt() {
  is_in_dot_repo || return
  dot tag --sort -version:refname |
    fzf-down --multi --preview-window right:75%:border-left:nohidden \
    --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME show --color=always {} | delta' -0
  }

fzf_gh() {
  is_in_dot_repo || return
  dot log --date=short --format="%C(bold)%C(auto)%h%d %s %C(green)(%cd) %C(bold blue)[%an]%Creset" --graph --color=always |
    fzf-down --ansi --no-sort --reverse --multi \
    --header 'Press ALT-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME show --color=always | delta' |
    grep -o "[a-f0-9]\{7,\}"
  }

fzf_gr() {
  is_in_dot_repo || return
  dot remote -v | awk '{print $1 "\t" $2}' | uniq |
    fzf-down --tac \
    --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" --color=always {1}' |
    cut -d$'\t' -f1
  }

fzf_gs() {
  is_in_dot_repo || return
  dot stash list | fzf-down --reverse -d: --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME show --color=always {1} | delta' -0 |
    cut -d: -f1
  }

# Git dot Keybindings
join-lines() {
local item
while read item; do
  echo -n "${(q)item} "
done
}

bind-dot-helper() {
local c
for c in $@; do
  eval "fzf-h$c-widget() { local result=\$(fzf_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
  eval "zle -N fzf-h$c-widget"
  eval "bindkey '^h$c' fzf-h$c-widget"
done
}
bind-dot-helper f b t h r s
unset -f bind-dot-helper
# }}}
# eliminates duplicates in *paths
# typeset -gU fpath path

#Last but not least
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(url)
# source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
