
#----------------- FZF & GIT -------------------

vf() { fzf | xargs -r -I % $EDITOR % ;}

# search for configs and scripts
se() { du -a ~/scripts/* ~/.config/* | awk '{print $2}' | fzf --keep-right | xargs -r $EDITOR ;}

# Use fd and fzf to get the args to a command.
# Works only with zsh
# Examples:
# f mv # To move files. You can write the destination after selecting the files.
# f 'echo Selected:'
# f 'echo Selected music:' --extention mp3
# fm rm # To rm files in current directory
f() {
  sels=( "${(@f)$(fd -H "${fd_default[@]}" "${@:2}"| fzf -m)}" )
  test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}

# Like f, but not recursive.
fm() f "$@" --max-depth 1

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1) - Exit if there's no match (--exit-0)
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && termux-open --chooser "$file" || ${EDITOR:-vim} "$file"
  fi
}

# search for all scripts and dotfiles, then open them with editor of choice
files=(~/.aliases ~/.bashrc ~/.zshenv ~/.gitconfig ~/.dircolors ~/.gemrc
  ~/.config/{bat,configstore,ctags,fd,git,glow,htop,lynx,mpv,neofetch,npm,nvim,pip,pulse,ranger,starship,vifm,w3m,wget,zsh}
  ~/.config/micro/bindings.json ~/.config/micro/settings.json ~/.config/tmux/tmux.conf
  ~/.lynxrc ~/scripts/* ~/.local/bin/* ~/documents/*
  $PREFIX/etc/{bash.bashrc,inputrc,nanorc,profile,tmux.conf,zshrc})

dotf() {
  find $files -type f |
    fzf --keep-right --preview 'bat --color=always --line-range :200 {}' --bind=alt-t:toggle-preview | xargs -r "$EDITOR"
 }

# search for all notes and open selected one in editor
notes() {
  rg --files "$HOME"/*ocuments/notes |
    fzf --keep-right --preview 'bat --color=always --line-range :100 {}' --bind=alt-t:toggle-preview | xargs -r "$EDITOR"
  }

# cd into note dir, live grep the contents of notes, then open in editor
live_search_notes() {
  cd "$HOME"/*ocuments/notes && interactive_fzf
}

# search for all git repos in folders I care, then cd into selected one.
all_git() {
  dir=$(find ~/{.zsh,gitrepos,documents} -type d -name .git | sed 's/\/.git//' |
    fzf --keep-right --cycle --preview 'tree -C {} | head -50'
      ) && cd $dir && git status
    }

# fd - cd into any hidden directory of the current folder
fcd() {
  dir=$(find "${1:-.}" -type d 2>/dev/null | fzf --ansi +m) && "$dir" || exit
}

# cdf - cd into the directory of the selected file
cdf() {
  file=$(find "${1:-.}" -type f | fzf +m -q "$1") && dir=$(dirname "$file") && "$dir" || exit
}

# man-find() {
# f=$(fd . $MANPATH/man${1:-1} -t f -x echo {/.} | fzf) && man $f
# }

# fman() {
#   man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
# }

# with previews and works correctly with man pages in different sections.
# function fman() {
#   man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
# }

# ALT-k - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
local selected
if selected=$(locate / | fzf --keep-right -q "$LBUFFER"); then
  LBUFFER=$selected
fi
zle redisplay
}
zle     -N    fzf-locate-widget
bindkey '\ek' fzf-locate-widget

# GIT --bare functions
# source:
# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md#ripgrep-integration
is_in_git_repo() {
    git rev-parse HEAD >/dev/null 2>&1
}

is_in_dot_repo() {
    dot rev-parse HEAD >/dev/null 2>&1
}

fzf-down() {
fzf --height 80% --min-height 18 --border --preview-window=down,60%,border "$@"
}

fzf_gf() {
  is_in_dot_repo || return
  dot -c color.status=always status --short |
    fzf-down -m --ansi --nth 2..,.. \
    --preview '(git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME diff --color=always -- {-1} | sed 1,4d; cat {-1})' |
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
    fzf-down --multi --preview-window right:70%:nohidden \
    --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME show --color=always {}'
  }

fzf_gh() {
  is_in_dot_repo || return
  dot log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
    fzf-down --ansi --no-sort --reverse --multi --bind 'alt-s:toggle-sort' \
    --header 'Press ALT-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME show --color=always' |
    grep -o "[a-f0-9]\{7,\}"
  }

fzf_gr() {
  is_in_dot_repo || return
  dot remote -v | awk '{print $1 "\t" $2}' | uniq |
    fzf-down --tac \
    --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
    cut -d$'\t' -f1
  }

fzf_gs() {
  is_in_dot_repo || return
  dot stash list | fzf-down --reverse -d: --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME show --color=always {1}' |
    cut -d: -f1
  }

# Git dot Keybindings

join-lines() {
local item
while read item; do
    echo -n "${(q)item} "
done
}

bind-git-helper() {
local c
for c in $@; do
    eval "fzf-h$c-widget() { local result=\$(fzf_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-h$c-widget"
    eval "bindkey '^h$c' fzf-h$c-widget"
done
}
bind-git-helper f b t h r s
unset -f bind-git-helper

# GIT heart FZF
# -------------

_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
    fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' |
    cut -c4- | sed 's/.* -> //'
  }

_gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
    fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
    sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/##'
  }

_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
    fzf-down --multi --preview-window right:70%:nohidden \
    --preview 'git show --color=always {}'
  }

_gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
    fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
    grep -o "[a-f0-9]\{7,\}"
  }

_gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
    fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
    cut -d$'\t' -f1
  }

_gs() {
  is_in_git_repo || return
  git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1}' |
    cut -d: -f1
}
join-line() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-help() {
  local c
  for c in $@; do
    eval "fzf-g$c-widgets() { local result=\$(_g$c | join-line); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widgets"
    eval "bindkey '^g^$c' fzf-g$c-widgets"
  done
}
bind-git-help f b t r h s
unset -f bind-git-help
