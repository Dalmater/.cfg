export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PATH=$PATH:/storage/emulated/0/bin:/storage/40E6-DFFD/bin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# XDG Path
export XDG_CONFIG_HOME=$HOME/.config
# export XDG_DATA_HOME=$HOME/.local/share

export USERNAME
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/.wgetrc"
export LESSHISTFILE="-"
export HISTIGNORE="&:l:ls:ll:la"
export GITHUB_USER=Dalmater
export GITHUB_PASSWORD=GHrasta24-7
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
export GITHUB_TOKEN=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
GIT_DISCOVERY_ACROSS_FILESYSTEM=true
# Allow GnuPG to use console for authentication
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

# Starship prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

PROMPT_TITLE="%~ | ${COLUMNS}x${LINES} | %! | %? | %y |"

# oh-my-zsh settings
DISABLE_AUTO_UPDATE="true"
DISABLE_COMPFIX="true"
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$HOME/.zsh/custom"
ZSH_CACHE_DIR="$HOME/.cache/zsh"
# ZDOTDIR=$HOME/.config/zsh

# Plugins
plugins=(extract nice-exit-code colored-man-pages
gitfast python zsh-hist colorize fzf fzf-tab
#ssh-agent keychain gpg-agent
# youtube-dl web-search
# git npm nvm node
# zsh-lazyload
# zsnapshot
# zhooks
# evalcache
zsh-autopair
you-should-use
zsh-completions
zsh-autosuggestions
fast-syntax-highlighting
title # zui zbrowse
)

ZSH_COLORIZE_STYLE="gruvbox-dark"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=58"
ZSH_AUTOSUGGEST_USE_ASYNC=true

export YSU_MODE=ALL
export YSU_MESSAGE_POSITION=after
export YSU_IGNORED_ALIASES=( "g" "gc" "iaf" )

FORGIT_COPY_CMD='termux-clipboard-set'

eval "$(lua5.3 ~/.zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once)"
export _ZL_EXCLUDE_DIRS=".cfg.git,.cache,buffers,_*"
#export _ZL_NO_PROMPT_COMMAND=1

source $ZSH/oh-my-zsh.sh

# User configuration

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /$PREFIX/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
LESSCOLORIZER=pygmentize

export EDITOR=nvim
export VISUAL="nvim"
export PAGER="bat -p --paging=always"
export BROWSER=lynx
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=UTF-8
export KEYTIMEOUT=1000
export CLICOLORS=true
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1
export TMUX_TMPDIR="$PREFIX/var/run"
export FZF_TMPDIR="$PREFIX/var/run"

# export MANPATH="data/data/com.termux/usr/share/doc/man

# Keydelay + disable right prompt indent
export KEYTIMEOUT=3000
ZLE_RPROMPT_INDENT=0

# For a full list of active aliases, run `alias`
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Safe rm
# Wait 10 seconds before executing "rm *"
setopt rm_star_wait
unsetopt rm_star_silent

# Directories
# change directory without cd
setopt autocd
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

# keybindings
bindkey -s "^[R" "ranger_cd \n"
bindkey -s '^[v' 'vifm\n'
# bindkey '^[B' zbrowse
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;3C" kill-word
bindkey "^[[1;3D" backward-kill-word

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
bindkey "^ss" sticky-note

####### >FZF Base< #######

# bindkey  '^[t'  fzf-file-widget
# bindkey  '^r'   fzf-history-widget
# bindkey  '^[c'  fzf-path-widget
bindkey -s '^[i' "interactive_fzf \n"
bindkey -s '^n'  'notes\n'
bindkey -s '^p'  'dotf\n'
bindkey -s '^e'  'live_search_notes\n'
bindkey -s '^f'  'fuz\n'
bindkey    '^ft' 'toggle-fzf-tab'

export FZF_BASE='~/.fzf'
#export FZF_BASE='$PREFIX/share/fzf'
export FZF_DEFAULT_COMMAND='ag --hidden --color -U -g ""'
export FZF_DEFAULT_OPTS="--height 92% --color=bg:-1,bg+:236,gutter:-1,info:136,border:88,spinner:108,hl:64,fg:250,header:65,fg+:252,pointer:124,marker:168,prompt:81,hl+:71 --layout=reverse --border --info=inline --ansi --cycle '--bind=ctrl-space:toggle'"
export FZF_ALT_C_COMMAND='fd --type d . --color=always --hidden --no-ignore-vcs'
export FZF_ALT_C_OPTS="--ansi --preview 'tree -U -l -C -L 3 {}' --bind=alt--:toggle-preview"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--ansi --preview 'bat --color=always --line-range :200 {}' --bind=alt--:toggle-preview"
export FZF_CTRL_R_COMMAND="--preview 'echo {}' --preview-window right:3:hidden:wrap --bind 'alt--:toggle-preview'"
export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_TMUX_OPTS="-d 60%"
export FZF_TMUX=1

# FZF Function Examples
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

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

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

fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}

# see environment variables
envs() {
 # ps eww -o command | tr ' ' '\n'
 printenv | fzf
}

# find all git repos, select one and CD to its parent dir
cdg() {
  local file
  local dir
  file=$(fd -H -g .git | \fzf -m) && dir=$(dirname "$file") && cd "$dir"
}
