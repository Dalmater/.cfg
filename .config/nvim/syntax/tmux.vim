" Vim syntax file
" Language: tmux(1) configuration file
" URL:      https://github.com/tmux-plugins/vim-tmux
"
" Header from the original author
" --------------------------------------------------
" Creator: Tiago Cunha <me@tiagocunha.org>
" Last Change By The Creator: $Date: 2012-10-23 12:23:55 $
" License: This file is placed in the public domain.

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=-
syntax case match

syn keyword tmuxAction  any current none
syn keyword tmuxBoolean off on
syn keyword tmuxOptionValue
      \ top bottom left right top-left top-right
      \ bottom-left bottom-right centre
      \ vi emacs copy
      \ bash zsh fish
syn keyword tmuxLayoutOptionValue even-horizontal even-vertical main-horizontal
syn keyword tmuxLayoutOptionValue main-vertical tiled

syn keyword tmuxClientSessionCmds
      \ attach[-session] detach[-client] has[-session] find[-session]
      \ kill-server kill-session lsc list-clients lscm
      \ list-commands ls list-sessions lockc lock-client
      \ locks lock-session new[-session] refresh[-client]
      \ rename[-session] showmsgs show-messages
      \ source[-file] start[-server] suspendc
      \ suspend-client switchc switch-client

syn keyword tmuxWindowPaneCmds
      \ copy-mode copy-mode-vi breakp break-pane capturep capture-pane
      \ choose-client choose-session choose-tree
      \ choose-window displayp display-panes findw
      \ find-window joinp join-pane killp kill-pane
      \ killw kill-window lastp last-pane last[-window]
      \ linkw link-window lsp list-panes lsw list-windows
      \ movep move-pane movew move-window neww new-window
      \ nextl next-layout next[-window] pipep pipe-pane
      \ prevl previous-layout prev[ious-window] renamew
      \ rename-window resizep resize-pane respawnp
      \ respawn-pane respawnw respawn-window rotatew
      \ rotate-window selectl select-layout selectp
      \ select-pane selectw select-window splitw
      \ split-window swapp swap-pane swapw swap-window
      \ unlinkw unlink-window MouseDragEnd1Pane

syn keyword tmuxBindingCmds lsk list-keys send[-keys] send-prefix

syn keyword tmuxEnvironmentCmds setenv set-environment showenv show-environment

syn keyword tmuxStatusLineCmds command-prompt confirm[-before] display[-message]

syn keyword tmuxBufferCmds
      \ choose-buffer clearhist clear-history deleteb
      \ delete-buffer lsb list-buffers loadb load-buffer
      \ pasteb paste-buffer saveb save-buffer setb set-buffer
      \ showb show-buffer

syn keyword tmuxMiscCmds clock-mode if[-shell] lock[-server] wait[-for]
" obsolete (not in manpage anymore)
syn keyword tmuxMiscCmds info server-info

syn keyword tmuxOptsSet
      \ prefix prefix2 status status-fg status-bg bell-action
      \ default-command history-limit status-left status-right
      \ status-interval set-titles display-time buffer-limit
      \ status-left-length status-right-length status-position
      \ message-command-bg message-bg lock-after-time default-path
      \ message-command-attr message-attr status-attr set-remain-on-exit
      \ status-utf8 default-terminal visual-activity repeat-time
      \ visual-bell visual-content status-justify status-keys
      \ terminal-overrides status-left-attr status-left-bg
      \ status-left-fg status-right-attr status-right-bg
      \ status-right-fg update-environment base-index
      \ display-panes-colour display-panes-time default-shell
      \ set-titles-string lock-command lock-server
      \ mouse-select-pane message-limit quiet escape-time
      \ pane-active-border-bg pane-active-border-fg history-file
      \ pane-border-bg pane-border-fg message-command-fg message-fg
      \ pane-border-status pane-border-format status-left-style status-right-style status-style
      \ display-panes-active-colour alternate-screen pane-active-border-style pane-border-style
      \ detach-on-destroy word-separators
      \ destroy-unattached exit-unattached focus-events set-clipboard
      \ bell-on-alert mouse-select-window mouse-utf8
      \ mouse-resize-pane mouse
      \ renumber-windows visual-silence
      \ show[-options] showw show-window-options message-command-style message-style

syn match tmuxUserOptsSet /@[[:alnum:]_-]\+/ display

syn keyword tmuxOptsSetw
      \ monitor-activity aggressive-resize force-width
      \ force-height remain-on-exit mode-fg mode-bg
      \ mode-keys clock-mode-colour clock-mode-style
      \ xterm-keys mode-attr window-status-attr monitor-bell
      \ window-status-bg window-status-fg automatic-rename
      \ main-pane-width main-pane-height monitor-content
      \ window-status-current-attr window-status-current-bg
      \ window-status-current-fg mode-mouse synchronize-panes
      \ window-status-format window-status-current-format
      \ window-status-activity-attr window-status-activity-style window-status-style
      \ window-status-activity-bg window-status-activity-fg
      \ window-status-bell-attr
      \ window-status-bell-bg window-status-bell-fg
      \ window-status-content-attr
      \ window-status-content-bg window-status-content-fg
      \ window-status-separator window-status-last-attr
      \ window-status-last-fg window-status-last-bg
      \ pane-base-index other-pane-height other-pane-width
      \ allow-rename c0-change-interval c0-change-trigger
      \ layout-history-limit monitor-silence utf8 wrap-search

" keywords for vi/emacs edit, choice and copy modes
syn keyword tmuxModeCmds
      \ append-selection back-to-indentation backspace
      \ begin-selection bottom-line cancel choose clear-selection
      \ complete copy-end-of-line copy-pipe copy-selection copy-pipe-and-cancel
      \ cursor-down cursor-left cursor-right cursor-up delete
      \ delete-end-of-line delete-line delete-word down
      \ end-of-line end-of-list enter goto-line halfpage-down
      \ halfpage-up history-bottom history-down history-top
      \ history-up jump-again jump-backward jump-forward
      \ jump-reverse jump-to-backward jump-to-forward middle-line
      \ next-space next-space-end next-word next-word-end other-end
      \ page-down page-up paste previous-space previous-word
      \ rectangle-toggle scroll-down scroll-up search-again
      \ search-backward search-forward search-reverse
      \ start-named-buffer start-number-prefix start-of-line
      \ start-of-list switch-mode switch-mode-append
      \ switch-mode-append-line switch-mode-begin-line
      \ switch-mode-change-line switch-mode-substitute
      \ switch-mode-substitute-line top-line transpose-chars
      \ tree-collapse tree-collapse-all tree-expand
      \ tree-expand-all tree-toggle up

" These keys can be used for the 'bind' command
syn keyword tmuxKeySymbol
      \ Enter Escape Space BSpace Home End Tab BTab DC IC
      \ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
      \ NPage PageDown PgDn PPage PageUp PgUp
      \ Up Down Left Right

" these commands are special when at the beginning of the line
syn match tmuxMiscCmds        /run\(-shell\)\?/ display
syn match tmuxSpecialCmds /^\s*run\(-shell\)\?/ display

syn match tmuxBindingCmds     /bind\(-key\)\?/ display
syn match tmuxSpecialCmds /^\s*bind\(-key\)\?/ display

syn match tmuxBindingCmds     /unbind\(-key\)\?/ display
syn match tmuxSpecialCmds /^\s*unbind\(-key\)\?/ display

syn match tmuxOptsSet         /set\(-option\)\?/ display
syn match tmuxSpecialCmds /^\s*set\(-option\)\?/ display

syn match tmuxOptsSetw        /\(setw\|set-window-option\)/ display
syn match tmuxSpecialCmds /^\s*\(setw\|set-window-option\)/ display

syn region tmuxComment start=/#/ end=/$/ contains=tmuxTodo,tmuxURL,@Spell display oneline

syn keyword tmuxTodo FIXME NOTE TODO XXX todo contained
syn match tmuxURL `\v<(((https?|ftp|gopher)://|(mailto|file|news):)[^'  <>"]+|(www|web|w3)[a-z0-9_-]*\.[a-z0-9._-]+\.[^'  <>"]+)[a-zA-Z0-9/]` contained

syn match tmuxKey               /\(C-\|M-\|\^\)\+\S\+/  display
syn match tmuxKey               /\\["']/                display
syn match tmuxNumber            /\<[+-]\?\d\+/          display
syn match tmuxSelWindowOption   /:[!+-]\?/              display
syn match tmuxOptions           /\s-\a\+/               display
syn match tmuxVariable          /\w\+=/                 display
syn match tmuxVariableExpansion /\${\=\w\+}\=/          display
syn match tmuxAdditionalCommand /\\;/ display

" concatenating flag '-t' or '-T' and table name is a valid syntax
syn match tmuxKeyTable /\s\(-t\)\?\(vi-edit\|emacs-edit\|vi-choice\|emacs-choice\|vi-copy\|emacs-copy\)/ display
syn match tmuxKeyTable /\s\(-T\)\?\(copy-mode-vi\|copy-mode\)/ display

syn match tmuxColor /\(bright\)\?\(black\|red\|green\|yellow\|blue\|magenta\|cyan\|white\)/ display
syn match tmuxColor /default/        display
syn match tmuxColor /colour\d\{1,3}/ display
syn match tmuxColor /#\x\{6}/        display

syn match tmuxStyle /\(no\)\?\(bright\|bold\|dim\|underscore\|blink\|reverse\|hidden\|italics\)/ display

syn match tmuxPromptInpol /%[[:digit:]%]/ contained

" Matching `man 3 strftime` formats
syn match tmuxDateInpol /%[0_^#-]\?[A-DF-IMR-Z+]/     contained
syn match tmuxDateInpol /%[0_^#-]\?[a-eghj-npr-z]/    contained
syn match tmuxDateInpol /%[0_^#-]\?E[cCxXyY]/         contained
syn match tmuxDateInpol /%[0_^#-]\?O[BdeHImMSuUVwWy]/ contained

" Format aliases
syn match tmuxFmtAlias /#[HhDPTSFIW#]/ contained

" Format interpolation
syn region tmuxFmtInpol matchgroup=tmuxFmtInpolDelimiter start=/#{/ skip=/#{.\{-}}/ end=/}/ contained keepend contains=tmuxFmtVariable,tmuxFmtConditional,tmuxFmtLimit
syn match  tmuxFmtVariable    /[[:alnum:]_-]\+/ contained display
syn match  tmuxFmtConditional /[?,]/            contained display
syn match  tmuxFmtLimit       /=.\{-}:/         contained display contains=tmuxNumber

" Attribute interpolation
syn region tmuxAttrInpol matchgroup=tmuxAttrInpolDelimiter start=/#\[/ skip=/#\[.\{-}]/ end=/]/ contained keepend contains=tmuxColor,tmuxAttrBgFg,tmuxAttrEquals,tmuxAttrSeparator,tmuxStyle
syn match  tmuxAttrBgFg      /[fb]g/ contained display
syn match  tmuxAttrEquals    /=/     contained display
syn match  tmuxAttrSeparator /,/     contained display

" Shell command interpolation
syn region tmuxShellInpol matchgroup=tmuxShellInpolDelimiter start=/#(/ skip=/#(.\{-})/ end=/)/ contained keepend

syn region tmuxString matchgroup=tmuxStringDelimiter start=/"/ skip=/\\./ end=/"/ contains=tmuxFmtInpol,tmuxFmtAlias,tmuxAttrInpol,tmuxShellInpol,tmuxPromptInpol,tmuxDateInpol,@Spell display keepend
syn region tmuxString matchgroup=tmuxStringDelimiter start=/'/ end=/'/            contains=tmuxFmtInpol,tmuxFmtAlias,tmuxAttrInpol,tmuxShellInpol,tmuxPromptInpol,tmuxDateInpol,@Spell display keepend

hi def link tmuxAction              Boolean
hi def link tmuxBoolean             Boolean
hi def link tmuxOptionValue         Constant
hi def link tmuxLayoutOptionValue   Constant

hi def link tmuxClientSessionCmds   Keyword
hi def link tmuxWindowPaneCmds      Keyword
hi def link tmuxBindingCmds         Keyword
hi def link tmuxEnvironmentCmds     Keyword
hi def link tmuxStatusLineCmds      Keyword
hi def link tmuxBufferCmds          Keyword
hi def link tmuxMiscCmds            Keyword

hi def link tmuxSpecialCmds         Type
hi def link tmuxComment             Comment
hi def link tmuxKey                 Special
hi def link tmuxKeySymbol           Special
hi def link tmuxNumber              Number
hi def link tmuxSelWindowOption     Number
hi def link tmuxOptions             Special
hi def link tmuxOptsSet             PreProc
hi def link tmuxUserOptsSet         Identifier
hi def link tmuxOptsSetw            PreProc
hi def link tmuxKeyTable            PreProc
hi def link tmuxModeCmds            Keyword
hi def link tmuxString              String
hi def link tmuxStringDelimiter     Delimiter
hi def link tmuxColor               Constant
hi def link tmuxStyle               Constant

hi def link tmuxPromptInpol         Special
hi def link tmuxDateInpol           Special
hi def link tmuxFmtAlias            Special
hi def link tmuxFmtVariable         Constant
hi def link tmuxFmtConditional      Conditional
hi def link tmuxFmtLimit            Operator
hi def link tmuxAttrBgFg            Constant
hi def link tmuxAttrEquals          Operator
hi def link tmuxAttrSeparator       Operator
hi def link tmuxShellInpol          String
hi def link tmuxFmtInpolDelimiter   Delimiter
hi def link tmuxAttrInpolDelimiter  Delimiter
hi def link tmuxShellInpolDelimiter Delimiter

hi def link tmuxTodo                Todo
hi def link tmuxURL                 Underlined
hi def link tmuxVariable            Identifier
hi def link tmuxVariableExpansion   Identifier
hi def link tmuxAdditionalCommand   Special

let b:current_syntax = "tmux"
