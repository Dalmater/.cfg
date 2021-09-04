
#----------------- FZF & GIT -------------------

alias fv='nvim "$(fd -H -i -L --type f | fzf +m --keep-right)"'
vf() { fzf | xargs -r -I % $EDITOR % ;}
se() { du -a ~/.scripts/* ~/.config/* | awk '{print $2}' | fzf --keep-right | xargs -r $EDITOR ;}

# search for all scripts and dotfiles, then open them with editor of choice
files=(~/.bashrc ~/.zshrc ~/.config/{bat,configstore,git,htop,lynx,mc,micro,mpv,neofetch,npm,nvim,pip,pulse,ranger,w3m,wget,zsh}
    ~/.lynxrc ~/.scripts/* ~/bin/* ~/.local/bin/* ~/.local/share/* $PREFIX/etc/* ~/documents/*)

dotf() {
    find $files -type f --hidden |
        fzf --keep-right --preview 'bat --color=always --line-range :100 {}' --bind=alt--:toggle-preview | xargs -r "$EDITOR"
    }

 # search for all notes and open selected one in editor
 notes() {
     rg --files "$HOME"/*ocuments/notes |
         fzf --keep-right --preview 'bat --color=always --line-range :100 {}' --bind=alt--:toggle-preview | xargs -r "$EDITOR"
     }

 # cd into note dir, live grep the contents of notes, then open in editor
 live_search_notes() {
     cd "$HOME"/*ocuments/notes && interactive_fzf
 }

# search for all git repos in folders I care, then cd into selected one.
all_git() {
    dir=$(find ~/{.zsh,gitrepos,documents} -type d -name .git | sed 's/\/.git//' |
        fzf --cycle --preview 'tree -C {} | head -50'
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

# GIT
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
fzf --height 50% --min-height 20 --border --bind alt--:toggle-preview "$@"
}

_gf() {
    is_in_git_repo || is_in_dot_repo || return
    dot -c color.status=always status --short |
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
    is_in_dot_repo || return
    dot tag --sort -version:refname |
        fzf-down --multi --preview-window right:70% \
        --preview 'dot show --color=always {}'
    }

_gh() {
    is_in_dot_repo || return
    dot log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
        fzf-down --ansi --no-sort --reverse --multi --bind 'alt-s:toggle-sort' \
        --header 'Press ALT-S to toggle sort' \
        --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs dot show --color=always' |
        grep -o "[a-f0-9]\{7,\}"
    }

_gr() {
    is_in_dot_repo || return
    dot remote -v | awk '{print $1 "\t" $2}' | uniq |
        fzf-down --tac \
        --preview 'dot log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
        cut -d$'\t' -f1
    }

_gs() {
    is_in_git_repo || return
    git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1}' |
        cut -d: -f1
    }

# Git Keybindings

join-lines() {
local item
while read item; do
    echo -n "${(q)item} "
done
}

bind-git-helper() {
local c
for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^h$c' fzf-g$c-widget"
done
}
bind-git-helper f b t h r s
unset -f bind-git-helper
