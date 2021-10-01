# only ask if completion is larger than screen
LISTMAX=0

zstyle ':completion:*' menu yes select
zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose true
zstyle ':completion:*' glob true
zstyle ':completion:*' dotglob true
zstyle ':completion:*' list-grouped false
zstyle ':completion:*' list-separator ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*' complete-options yes
zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' insert-unambiguous yes
# zstyle ':autocomplete:*' insert-unambiguous yes
# zstyle ':autocomplete:*' fzf-completion yes

# zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*:users' ignored-patterns '_*'
zstyle ':completion:*:expand:*' keep-prefix no
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:options' format '[%d]'
zstyle ':completion:*:options' description yes
# zstyle ':completion:*:parameters' extra-verbose yes
# case insensitive (all), partial-word and substring completion
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# List of completers to use
zstyle ':completion:*' completer \
  _oldlist _expand _complete _ignored _match _correct _approximate _prefix

zstyle ':completion:*:jobs' verbose true
zstyle ':completion:*:jobs' numbers true

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:cd' ignore-parents parent pwd

zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:corrections' format '%F{yellow}%B%d (errors: %e) %b'
zstyle ':completion:*:messages' format '%F{purple}%d'
zstyle ':completion:*:warnings' format '%F{red}%BNo matches for: %d %f'

zstyle ':completion:*' list-prompt $'\e[01;94m%SAt %p: Hit TAB for more; Character to insert%s \e[00;00m'
zstyle ':completion:*' select-prompt $'\e[01;34m%SScrolling active: Match %M  at: %P \e[00;00m'

# Ignore multiple entries.
zstyle ':completion:*:(cp|mv|rm|vi|kill|diff):*' ignore-line other true

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

zstyle ':completion:*:complete:dpkg:option--status-1:*' packageset avail

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# fzf zstyle setup
zstyle ':fzf-tab:*' show-group full
zstyle ':fzf-tab:*' fzf-flags --height 80% --min-height 20 --preview-window=border:wrap

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1a --icons --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-flags --keep-right --preview-window=border:right:45%:nohidden
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0

zstyle ':fzf-tab:complete:exa:*' fzf-preview 'exa -1a --icons --color=always $realpath'
zstyle ':fzf-tab:complete:exa:*' fzf-flags --keep-right --preview-window=border:right:45%:nohidden

zstyle ':fzf-tab:complete:\\ls:*' fzf-preview 'exa -1a --icons --color=always $realpath'
zstyle ':fzf-tab:complete:\\ls:*' fzf-flags --keep-right --preview-window=border:right:45%:nohidden

# rm: advanced fzf-tab-completion (e.g. bak files first)
zstyle ':fzf-tab:complete:*:rm:*:*' file-patterns '*.o:object-files:object\ file *(~|.(old|bak|BAK)):backup-files:backup*\ files *~*(~|.(o|old|bak|BAK)):all-files:all\ files'

# use input as query string when completing zlua
zstyle ':fzf-tab:complete:z:*' query-string input
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:_zlua:*' fzf-flags --keep-right --preview-window=border:3:wrap

# preview when completing env vars (note: only works for exported variables)
# eval twice, first to unescape the string, second to expand the $variable
zstyle ':completion::*:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-completion-opts --preview='eval eval echo {1}'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
  fzf-flags --preview-window=border:hidden:down:3:wrap

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:4:border:nohidden:wrap
# Add colors to processes for kill completion
zstyle ':fzf-tab:complete:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'

# preview a `git status` when completing git add
# zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'

zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'|
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac' \
    fzf-flags --preview-window=border:hidden:down:50%:wrap


zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac' \
    fzf-flags --preview-window=border:hidden:down:50%:wrap

# if other subcommand to git is given, show a git diff or git log
# zstyle ':completion::*:git::*,[a-z]*' fzf-completion-opts --preview='eval set -- {+1} for arg in "$@"; do { git diff --color=always -- "$arg" | git log --color=always "$arg" } 2>/dev/null done'

# only for git
# zstyle ':completion:*:*:git:*' fzf-search-display true
# or for everything
zstyle ':completion:*' fzf-search-display true

# zstyle ':fzf-tab:user-expand:*' fzf-preview 'less ${(Q)word}'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${realpath}'

# zstyle ':completion:*:expand:*' fzf-preview 'echo ${word}'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'echo ${word}'
zstyle ':fzf-tab:*:*' fzf-flags --preview-window=border:hidden:down:4:wrap

### key bindings ###
# switch group using `1` and `2`
zstyle ':fzf-tab:*' switch-group '1' '2'
# zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
# zstyle ':fzf-tab:*' accept-line enter
zstyle ':fzf-tab:*' continuous-trigger '/'
# zstyle ':fzf-tab:complete:*' fzf-bindings \
  # 'ctrl-o:execute-silent({_FTB_INIT_}nvim& "$realpath")'
