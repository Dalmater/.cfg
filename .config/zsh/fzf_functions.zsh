# ~/scripts/fzf_functions.zsh
#----------------- FZF & GIT -------------------
# nf() { fzf --keep-right -m | xargs -r -I % $EDITOR % ;}

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 --keep-right -m)"})

  if [[ -n $files ]]
  then
    vim -p -- $files
    print -l $files[1]
  fi
}

# fuzzy grep open via ag
va() {
  local file

  file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1}')"

  if [[ -n $file ]]
  then
    vim $file
  fi
}

# fuzzy grep open via ag with line number
vg() {
  local file
  local line

  read -r file line <<<"$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
    vim $file +$line
  fi
}

# search for configs and scripts
se() { du ~/.aliases ~/.bashrc ~/*ignore ~/scripts/* ~/.config/*/* ~/.zshenv ~/.termux/* ~/*colors \
  --exclude='*complet*' --exclude='plug*' --exclude='font*' --exclude='.config/colors/*' \
  | awk '{print $2}' | fzf -m --bind change:first,alt-j:jump-accept \
  --keep-right | xargs -r $EDITOR -p ;}

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
  [[ -n "$files" ]] && ${EDITOR:-vim} -p "${files[@]}"
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
    zle reset-prompt
    }
  zle -N dotf
  bindkey '^Fc' dotf

# search for all notes and open selected one in editor
notes() {
  zle -I
  rg --files ~/*ocuments/notes |
    fzf --keep-right --preview-window 'nohidden' \
    --bind change:first,alt-j:jump-accept \
    --preview 'bat --color=always --line-range :400 {}' | xargs -r "$EDITOR"
    zle reset-prompt
  }
zle -N notes
bindkey '^Gn' notes

# cd into note dir, live grep the contents of notes, then open in editor
live_search_notes() {
  cd "$HOME"/*ocuments/notes && interactive_fzf
  cd -
}
bindkey -s '^Fn' 'live_search_notes \n'

# fcd - fuzzy cd from anywhere via fd result
# ex: fcd word (even part of a dir name)
fcd() {
  local dir
  dir="$(fd -HL -td "$1" | fzf --query="$*" -1 -0 +m --no-sort)" && "${dir}" || return 1
}

# find - cd into any directory of the current folder
# fcd() {
#   local dir
#   dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
# }

# cdf - cd into the directory of the selected file
cdf() {
  file=$(find ${1:-*} \( -path .cache -o -path .cfg.git -o -path .git -o -path *undo \) \
    -prune -o -path '*/\.*' -prune -o -type f -print 2> /dev/null \
    | fzf --bind change:first,alt-j:jump-accept +m \
    -q "$1") && dir=$(dirname "$file") && cd "$dir" || return
  }

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview-window=nohidden \
    --bind change:first,alt-j:jump-accept \
    --preview "highlight -O ansi -l sh {} 2> /dev/null | rg --colors 'match:bg:11' --ignore-case --pretty --context 10 '$1' {} \
    || rg --ignore-case --pretty --context 10 '$1' {}"
  }

# Man without options will use fzf to select a page
# function fzf-man() {
#   MAN="/usr/bin/man"
#   if [ -n "$1" ]; then
#     $MAN "$@"
#     return $?
#   else
#     $MAN -k . | fzf --reverse --preview="echo {1,2} | sed 's/ (/./' | sed -E 's/\)\s*$//' | xargs $MAN" | awk '{print $1 "." $2}' | tr -d '()' | xargs -r $MAN
#     return $?
#   fi
# }
 
# with previews and works correctly with man pages in different sections.
# function fman() {
#   man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
# }

## Search list of your aliases and functions
function faf() {
  CMD=$(
    (
      (alias)
      (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
    ) | fzf | cut -d '=' -f1
  );

  eval $CMD
}
 
# GIT functions
# source:
# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
is_in_git_repo() {
  git rev-parse HEAD >/dev/null 2>&1
}

# is_in_dot_repo() {
#   dot rev-parse HEAD >/dev/null 2>&1
# }

fzf-down() {
fzf --height 80% --min-height 18 --preview-window=down,60%,border-top "$@"
}

# fzf_gf() {
#   is_in_dot_repo || return
#   dot -c color.status=always status --short |
#     fzf-down -m --ansi --nth 2..,.. \
#     --preview '(git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME diff --color=always -- {-1} | delta | sed 1,4d; cat {-1})' |
#     cut -c4- | sed 's/.* -> //'
#   }

# fzf_gb() {
#   is_in_dot_repo || return
#   dot branch -a --color=always | grep -v '/HEAD\s' | sort |
#     fzf-down --ansi --multi --tac --preview-window right:70% \
#     --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
#     sed 's/^..//' | cut -d' ' -f1 |
#     sed 's#^remotes/##'
#   }

# fzf_gt() {
#   is_in_dot_repo || return
#   dot tag --sort -version:refname |
#     fzf-down --multi --preview-window right:75%:border-left:nohidden \
#     --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME show --color=always {} | delta' -0
#   }

# fzf_gh() {
#   is_in_dot_repo || return
#   dot log --date=short --format="%C(bold)%C(auto)%h%d %s %C(green)(%cd) %C(bold blue)[%an]%Creset" --graph --color=always |
#     fzf-down --ansi --no-sort --reverse --multi \
#     --header 'Press ALT-S to toggle sort' \
#     --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME show --color=always | delta' |
#     grep -o "[a-f0-9]\{7,\}"
#   }

# fzf_gr() {
#   is_in_dot_repo || return
#   dot remote -v | awk '{print $1 "\t" $2}' | uniq |
#     fzf-down --tac \
#     --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" --color=always {1}' |
#     cut -d$'\t' -f1
#   }

# fzf_gs() {
#   is_in_dot_repo || return
#   dot stash list | fzf-down --reverse -d: --preview 'git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME show --color=always {1} | delta' -0 |
#     cut -d: -f1
#   }

# # Git dot Keybindings

# join-lines() {
# local item
# while read item; do
#   echo -n "${(q)item} "
# done
# }

# bind-dot-helper() {
# local c
# for c in $@; do
#   eval "fzf-h$c-widget() { local result=\$(fzf_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
#   eval "zle -N fzf-h$c-widget"
#   eval "bindkey '^h$c' fzf-h$c-widget"
# done
# }
# bind-dot-helper f b t h r s
# unset -f bind-dot-helper

# GIT heart FZF
# -------------

_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
    fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | delta' |
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
    fzf-down --multi --preview-window right:75%:border-left:nohidden \
    --preview 'git show --color=always {} | delta' -0
  }

_gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(bold)%C(auto)%h%d %s %C(green)(%cd) %C(bold blue)[%an]%Creset" --graph --color=always |
    fzf-down --ansi --no-sort --reverse --multi \
    --header 'Press ALT-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | delta' |
    grep -o "[a-f0-9]\{7,\}"
  }

_gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
    fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" --color=always {1}' |
    cut -d$'\t' -f1
  }

_gs() {
  is_in_git_repo || return
  git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1} | delta' -0 |
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

# search aliases & bindings
# falias () {
#   local out
#   out=$(alias | fzf --header='aliases')
#   echo -n "$(echo -n "${out}" | sed 's+=.*++g' | termux-clipboard-set)"
# }
#  | sed 's/.*[=]//'

fbind () {
  local out
  out=$(bindkey | fzf --header='main keybindings')
  echo -n "$(echo -n "${out}")" &&
  echo -n "$(echo -n "${out}" | sed 's/.*"*"//g' | termux-clipboard-set)"
}
  #  | sed 's/.*"*" //g' | termux-clipboard-set

vbind () {
  local out
  out=$(bindkey -a | fzf --header='vi-mode keybindings')
  echo -n "$(echo -n "${out}")"
}

visual () {
  local out
  out=$(bindkey -M visual | fzf --header='visual-mode bindings')
  echo -n "$(echo -n "${out}")"
}

viopp () {
  local out
  out=$(bindkey -M viopp | fzf --header='viopp bindings')
  echo -n "$(echo -n "${out}")"
}

vicmd () {
  local out
  out=$(bindkey -M vicmd | fzf --header='vicmd bindings')
  echo -n "$(echo -n "${out}")"
}
