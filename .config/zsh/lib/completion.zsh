zmodload -i zsh/complist

WORDCHARS='|'

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history

# only ask if completion is larger than screen
LISTMAX=0

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

zstyle ':completion:*' menu yes select
zstyle ':completion:*' rehash true
zstyle ':acceptline:*' rehash true
zstyle ':completion:*' verbose true
zstyle ':completion:*' glob true
zstyle ':completion:*' dotglob true
zstyle ':completion:*' list-grouped false
zstyle ':completion:*' list-separator ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*' complete-options yes
zstyle ':completion:*' auto-description '%d'

zstyle ':completion:*:jobs' verbose true
zstyle ':completion:*:jobs' numbers true

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zstyle ':completion:*:expand:*' keep-prefix no
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:options' description yes
zstyle ':completion:*:parameters' extra-verbose yes
zstyle ':completion:*:corrections:*' ignored-patterns '_*'

# set descriptions format to enable group support
zstyle ':completion:*:options' format '[%d]'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:corrections' format '%F{yellow}%B%d (errors: %e)%b'
zstyle ':completion:*:messages' format '%F{cyan}%B%d %f'
zstyle ':completion:*:warnings' format '%F{red}%BNo matches found for: %d %f'

# zstyle ':completion:*' list-prompt $'\e[01;94m%SAt %p: Hit TAB for more; Character to insert%s \e[00;00m'
zstyle ':completion:*' select-prompt $'\e[01;34m%SScrolling active: Match %M  at: %P \e[00;00m'

# case insensitive (all) completion
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# List of completers to use
zstyle ':completion:*' completer \
  _oldlist _expand _complete _ignored _match _correct _approximate _prefix

# Complete . and .. special directories
# zstyle ':completion:*' special-dirs ..
# zstyle ':completion:*' sort false
zstyle ':completion:*:*:(ls|exa|mv|cp|rm|cd|pushd|vi|nvim|-command-|autocd):*' special-dirs ..
zstyle ':completion:*:*:(ls|exa|mv|cp|rm|cd|pushd|vi|nvim|-command-|autocd):*' sort false
zstyle ':completion:*:(cd|mv|cp):*' ignore-parents parent pwd

zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other true

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*:complete:dpkg:option--status-1:*' packageset avail

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# rm: advanced completion (e.g. bakup files first)
# zstyle ':completion:*:rm:*:*' file-patterns '*.o:object-files:object\ file *(~|.(out|old|bak|BAK)):backup-files:backup\ files *~*(~|.(o|old|bak|BAK)):all-files:all\ files'
# zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# fzf-tab zstyle setup
# zstyle ':fzf-tab:*' show-group full
# zstyle ':fzf-tab:*' default-color $'\033[37m'
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:complete:*' fzf-flags --height 90% --no-border --preview-window=border-top:down:50%:wrap
zstyle ':fzf-tab:complete:*' fzf-preview 'bat $realpath 2> /dev/null || exa -1a -T -L 4 -I=.git $realpath'
#2> /dev/null || echo $word 2> /dev/null || echo ${(P)word}'

# fzf-tab man completion
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'

# preview commands with fzf-tab
zstyle ':fzf-tab:complete:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1a --icons --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-flags --height 90% --keep-right --preview-window=border:right:60%:nohidden

zstyle ':fzf-tab:complete:exa:*' fzf-preview 'exa -1a --icons --color=always $realpath'
zstyle ':fzf-tab:complete:exa:*' fzf-flags --height 90% --keep-right --preview-window=border:right:60%:nohidden

zstyle ':fzf-tab:complete:ls:*' fzf-preview 'exa -1a --icons --color=always $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-flags --height 90% --keep-right --preview-window=border:right:60%:nohidden

zstyle ':fzf-tab:complete:\\ls:*' fzf-preview 'exa -1a --icons --color=always $realpath'
zstyle ':fzf-tab:complete:\\ls:*' fzf-flags --height 90% --keep-right --preview-window=border:right:60%:nohidden

# use input as query string when completing zlua
zstyle ':fzf-tab:complete:z:*' query-string input
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:_zlua:*' fzf-preview 'echo ${word}'
zstyle ':fzf-tab:complete:_zlua:*' fzf-flags --height 90% --keep-right --no-border \
  --preview-window=border:3:wrap

zstyle ':fzf-tab:complete:*:(vi|vim|nvim):*' fzf-preview 'bat --color=always $realpath 2> /dev/null || exa -1a -T -L 4 -I=.git $realpath'
zstyle ':fzf-tab:complete:*:(vi|vim|nvim):*' fzf-flags --height 90% \
  --preview-window=border-top:down:50%

zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
  'git diff $word | delta' |
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
  'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
  'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
  'case "$group" in
  "commit tag") git show --color=always $word ;;
  *) git show --color=always $word | delta ;;
esac'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-flags --height 90% --min-height 15 --no-border --preview-window=down:50%:border-top

zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
  'case "$group" in
  "modified file") git diff $word | delta || git --git-dir="$HOME/.cfg.git/" --work-tree="$HOME" diff $word | delta;;
  "recent commit object name") git show --color=always $word | delta ;;
  *) git log --color=always $word || dot log $word;;
  esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-flags --height 80% --min-height 15 --no-border --preview-window=down:50%:border-top

# preview a `git status` when completing git add
# zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'

# if other subcommand to git is given, show a git diff or git log
# zstyle ':completion::*:git::*,[a-z]*' fzf-completion-opts --preview='eval set -- {+1} for arg in "$@"; do { git diff --color=always -- "$arg" | git log --color=always "$arg" } 2>/dev/null done'

zstyle ':fzf-tab:complete:(-command-|autocd):*' fzf-preview 'bat --color=always $realpath 2> /dev/null || exa -1a -T -L 4 -I=.git $realpath'
zstyle ':fzf-tab:complete:(-command-|autocd):*' fzf-flags --height 90% \
  --preview-window=border-left:right:70%

# preview when completing env vars (note: only works for exported variables)
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
  fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
  fzf-flags --height 90% --min-height 10 --preview-window=down:5:wrap

# give a preview of commandline arguments when completing `kill`
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):*' fzf-flags --height 80% --min-height 10 \
  --preview-window=down:4:border:nohidden:wrap

### fzf-tab key bindings ###
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
# zstyle ':fzf-tab:*' accept-line enter
# zstyle ':fzf-tab:*' continuous-trigger '/'
zstyle ':fzf-tab:complete:*' fzf-bindings 'tab:toggle+down' 'alt-bs:+toggle+up' \
  'alt-y:execute-silent(printf {+} | termux-clipboard-set)'

# Group colors
FZF_TAB_GROUP_COLORS=(
  $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;33m' $'\033[96m' \
    $'\033[38;5;208m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;112m'
  )
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit
