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

# cd into note dir, live grep the contents of notes, then open in editor
live_search_notes() {
  cd "$HOME"/*ocuments/notes && interactive_fzf
}

# search for all git repos in folders I care, then cd into selected one.
fzf_git() {
  dir=$(find ~/ -type d -name .git | sed 's/\/.git//' |
    fzf --keep-right --cycle --preview 'tree -C {} | head -50'
      ) && cd $dir && git status
    }

