############# >FZF Base< #############

# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow -c always --exclude .git'
export FZF_DEFAULT_COMMAND='ag --hidden --follow --ignore .git -g ""'
 # "➟"
export FZF_DEFAULT_OPTS="--height 90% --min-height 20 --color=fg:#ebdbb2 \
  --color=gutter:-1,info:#d79921,border:21,hl:underline:#928374,hl+:#fb4934 \
  --color=header:#8ec07c,pointer:#cc241d,prompt:#689d6a,marker:#91970a,spinner:#fe8019 \
  --pointer='➜' --marker='√' --cycle --filepath-word --ansi -0 \
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

# fzf functions examples
# search for configs and scripts
se() { du ~/.aliases ~/.bashrc ~/*ignore ~/scripts/* ~/.config/*/* ~/.zshenv ~/.termux/* ~/*colors \
  --exclude='*complete*' --exclude='plug*' --exclude='font*' --exclude='~/.config/colors' \
  | awk '{print $2}' | fzf -m --keep-right | xargs -r $EDITOR -p ;}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1) - Exit if there's no match (--exit-0)
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fcd - fuzzy cd from anywhere via fd result
# ex: cd word (even part of a dir name)
fcd() {
  local dir
  dir="$(fd -td -H "$1" | fzf --query="$*" -1 -0 +m --no-sort)" && cd "${dir}" || return 1
}

# find - cd into any directory of the current folder
# fcd() {
#   local dir
#   dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
# }

# cdf - cd into the directory of the selected file
cdf() {
  file=$(find "${1:-.}" -type f | fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir" || return
}

# cd-jump by zlua
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
# cd into note dir, live grep the contents of notes, then open in editor
live_search_notes() {
  cd "$HOME"/*ocuments/notes && interactive_fzf
  cd -
}

# search for all git repos in folders I care, then cd into selected one.
fzf_git() {
  local dir
  dir=$(find ~/ -type d -name .git | sed 's/\/.git//' \
    | fzf --keep-right --cycle --bind alt-j:jump-accept \
    --history="${FZF_HISTORY_DIR}/repos") \
    && cd $dir && git pull
  }

# Auto cd with fzf
fzf_cd() {
  local dir
  DIR=$(find ${1:-*} \( -path .cache -o -path .cfg.git -o -path .git \) -prune -o -path '*/\.*' \
    -prune -o -type d -print 2> /dev/null | fzf +m --keep-right) && cd "$DIR"
  }
bind -x '"\ej": "fzf_cd"'

# cd with vifm_cd
vifm_cd()
{
  local dst="$(command vifm --choose-dir - "$@")"
  if [ -z "$dst" ]; then
    echo 'Directory picking cancelled/failed'
    return 1
  fi
  cd "$dst"
}

# see environment variables
envs() {
  # ps eww -o command | tr ' ' '\n'
  printenv | fzf -m
}

# search for all scripts and dotfiles, then open them with editor of choice
dotf() {

  local files

  files=(~/.agignore ~/.aliases ~/.bashrc ~/.zshenv ~/.gitconfig ~/.dircolors ~/.gemrc
  ~/.config/{bat,ctags,fd,git,glow,htop,neofetch,npm,nvim,pip,starship,vifm,w3m,wget,zsh/*}
  ~/.config/micro/bindings.json ~/.config/micro/settings.json ~/.config/tmux/tmux.conf
  ~/bin/* ~/scripts/* ~/.local/bin/* ~/documents/*
  $PREFIX/etc/{bash.bashrc,inputrc,nanorc,profile,tmux.conf,zshrc})

  find $files -type f |
    fzf -m --bind=change:first,alt-j:jump-accept --keep-right \
    --preview 'bat --color=always --line-range :200 {}' | xargs -r "$EDITOR" -p
  }

# search for all notes and open selected one in editor
notes() {
  rg --files ~/*ocuments/notes |
    fzf --keep-right --preview-window 'nohidden' \
    --bind change:first,alt-j:jump-accept \
    --preview 'bat --color=always --line-range :400 {}' | xargs -r "$EDITOR"
  }
