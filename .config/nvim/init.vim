" Set mapleader to space by default early, so all mappings by plugins are set
if !exists("mapleader")
  let mapleader = "\<Space>"
endif
  let maplocalleader = ','

  " let g:do_filetype_lua = 1
  " let g:did_load_filetypes = 0

  let g:polyglot_disabled = ['markdown', 'dircolors', 'sensible']

  set rtp+=~/.fzf
  let g:fzf_command_prefix = 'Fzf'

""----------------- " Plugins "------------------

" Install vim-plug if not found(slows down vim startup)
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin(stdpath('data').'/plugged')

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'
" Statusline:
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Convenience:
Plug 'farmergreg/vim-lastplace'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/visualrepeat'
Plug 'inkarkat/vim-ingo-library'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-scriptease', { 'for': ['vim', 'zsh',] }
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'txt', 'text', 'rst', 'liquid'] }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup'
" Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'liuchengxu/vim-which-key', {'on': ['WhichKey', 'WhichKey!'] }
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'justinmk/vim-sneak'
" Plug 'easymotion/vim-easymotion'
Plug 'romainl/vim-cool'
" Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'

" Git:
Plug 'tpope/vim-fugitive', { 'on': [] }
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'tpope/vim-rhubarb'

" Autocompletion:
Plug 'jayli/vim-easycomplete'
" Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'norcalli/snippets.nvim'
" Neovim LSP:
" Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'
" Plug 'nvim-lua/completion-nvim'

" Extras:
Plug 'vifm/vifm.vim'
Plug 'vim-utils/vim-man'
Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-dispatch'
Plug 'majutsushi/tagbar', {  'on': 'TagbarToggle' }
Plug 'junegunn/vim-peekaboo'
Plug 'Chiel92/vim-autoformat', { 'on': ['Autoformat', 'RemoveTrailingSpaces'] }
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'aymericbeaumet/vim-symlink'
Plug 'henrik/vim-indexed-search'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'luochen1990/rainbow', { 'on': 'RainbowToggle' }
Plug 'moll/vim-bbye', { 'on': ['Bdelete', 'Bwipeout'] }
" Plug 'ap/vim-css-color'
Plug 'norcalli/nvim-colorizer.lua'
" Syntax Highlighting & Colorscheme
Plug 'lifepillar/vim-gruvbox8' ", { 'commit': '1e20591' }
" Plug 'lifepillar/vim-solarized8'
" Plug 'sheerun/vim-polyglot'
Plug 'nathom/filetype.nvim'
Plug 'tweekmonster/startuptime.vim'

" Tmux:
Plug 'tmux-plugins/vim-tmux'
if exists('$TMUX')
  Plug 'christoomey/vim-tmux-navigator'
  let g:tmux_navigator_save_on_switch = 'update'
  let g:tmux_navigator_no_mappings = 1
  let g:tmux_navigator_preserve_zoom = 1

  Plug 'jpalardy/vim-slime'
  let g:slime_target = "tmux"
  let g:slime_bracketed_paste = 1
  let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
  let g:slime_paste_file = "$HOME/.config/nvim/.slime_paste"

  " Plug 'edkolev/tmuxline.vim'
  " let g:tmuxline_theme = 'lightline_insert'
  " let g:tmuxline_preset = 'minimal'
  let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
endif

call plug#end()

noremap <silent> <leader>up :PlugUpdate<cr>
noremap <silent> <leader>ud :PlugUpdate<cr>

command! Git   call LazyLoadFugitive('Git')
command! Gedit call LazyLoadFugitive('Gedit')
command! Gclog call LazyLoadFugitive('Gclog')
function! LazyLoadFugitive(cmd)
  call plug#load('vim-fugitive')
  call FugitiveDetect(expand('%:p'))
  exe a:cmd
endfunction

filetype plugin indent on " nvim default
syntax enable

" Plugin Settings: {{{

runtime! custom/0*.vim

lua require'colorizer'.setup()

  let g:plug_window = 'tabnew'

  let g:webdevicons_enable = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:webdevicons_enable_startify = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1

  " let g:AutoPairsFlyMode = 0
  let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", '<':'>'}
  nmap <silent> <F7> <plug>(matchup-hi-surround)
  " let g:matchup_matchparen_enabled = 0
  let g:matchup_matchparen_offscreen = {'scrolloff': '1'}
  let g:matchup_surround_enabled = 1
  let g:matchup_delim_noskips = 1
  let g:matchup_delim_start_plaintext = 0
  let g:matchup_matchparen_pumvisible = 0
  nmap <silent> <F7> <plug>(matchup-hi-surround)
  " let g:EditorConfig_preserve_formatoptions = 1
  " let g:EditorConfig_max_line_indicator = "none"
  " let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

  nmap <leader>ut <Cmd>UndotreeToggle<CR>
  let g:undotree_WindowLayout       = 2
  let g:undotree_ShortIndicators    = 1
  let g:undotree_SetFocusWhenToggle = 1
  " let g:pasta_paste_before_mapping  = ',P'
  " let g:pasta_paste_after_mapping   = ',p'

  let g:obsession_no_bufenter = 1
  let g:peekaboo_compact      = 1
  let g:peekaboo_prefix       = '<leader>'
  " let g:peekaboo_ins_prefix   = '<C-x>'
autocmd FileType vim,tex let b:autoformat_autoindent=0
  let g:autoformat_verbosemode = 1
  let g:autoformat_autoindent = 0
  let g:autoformat_retab = 0
  noremap <F10>      :Autoformat<CR>
  noremap <leader>af :Autoformat<CR>
  noremap <leader>rw :RemoveTrailingSpaces<CR>

  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_conceal_code_blocks = 1
  let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_new_list_item_indent = 2
  let g:markdown_syntax_conceal = 1
  let g:vim_markdown_conceal = 1

  " map <leader>M <Plug>(Man)
  map <leader>m <Plug>(Tman)
  let g:indexed_search_center = 1
  let g:indexed_search_line_info = 1
  let g:indexed_search_shortmess = 1
  let g:indexed_search_n_always_searches_forward = 1
  nnoremap <silent> <leader>ss :ShowSearchIndex<CR>
  let g:cursorhold_updatetime = 100
  " let g:rainbow_active = 0
  let g:rainbow_conf = { 'guifgs': ['darkorange', 'seagreen2', 'firebrick2', 'royalblue2'] }
  let g:cssColorVimDoNotMessMyUpdatetime = 1

  let g:agprg="--color-match=01;31;103 --column"
  let g:optionprefix_improved_warnings = 1
  let g:awk_is_gawk = 1
  " let g:zsh_fold_enable = 1
  " let g:vimsyn_folding = 'a,f,p'
" }}}
"Vim Configurations: {{{

set background=dark
" let g:gruvbox_filetype_hi_groups = 1
" let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_transp_bg = 1
" let g:gruvbox_contrast_dark = 1
colorscheme gruvbox8_hard

" Enable default theme if some other is not set
if !exists("g:colors_name")
  colorscheme default
endif

" Always use terminal background
" hi! Normal guibg=NONE
hi! Visual gui=reverse guibg=NONE
" hi! LineNr          guibg=#1d2021
" hi! SignColumn      guibg=#1d2021
" hi! CursorLine      guibg=#282828
" hi! CursorLineNr    guibg=#282828
" hi! EndOfBuffer     guifg=#504945 guibg=NONE gui=NONE
" hi! Special         gui=NONE
" hi! Pmenu           guibg=#32302f
" hi! PmenuSel        guifg=#1d2021
" hi! StartifyHeader  guifg=#fabd2f gui=bold ctermfg=221
" hi! StartifySpecial guifg=#8ec07c ctermfg=114

" highlights yanked region
augroup YankHighlight
  au!
  au TextYankPost * silent! lua vim.highlight.on_yank { higroup="Visual", timeout=300, on_visual=false, on_macro=true }
augroup END

" Set cursor style. Default: n-v-c-sm:block,i-ci:ver25-Cursor,r-cr-o:hor20
set guicursor=n-v:block-Cursor,i-c-ci-ve:ver25-iCursor,r-cr:hor20-lCursor,o:hor50-Cursor
      \,a:blinkwait700-blinkoff400-blinkon250
      \,sm:block-blinkwait175-blinkoff150-blinkon175
      \,ve:block-blinkon0

" set default cursor when leaving nvim
autocmd! VimLeave * set guicursor=a:ver25-blinkon250

" filetypes {{{2
" augroup filetypes
"   au!
"   au BufNewFile,BufRead *ignore setf gitignore
"   " au BufNewFile,BufRead *.vifm,vifmrc,*vifm/colors/* setf vifm
"   au BufNewFile,BufRead {.,}tmux*.conf set ft=tmux | compiler tmux
"   au BufNewFile,BufRead *.tmTheme setf xml
"   au BufNewFile,BufRead *.config/colors/* set ft=jproperties
" augroup END

nmap <leader>se :setfiletype<Space>
" }}}

" enable folding via marker
" augroup fold_vim
"   autocmd!
"   autocmd FileType vim,zsh setlocal foldenable foldmethod=marker
" augroup END

" Delete trailing white spaces on save(vim-autoformat)
" augroup trailing-whitespace
"   au!
"   au BufWritePre * %s/\s\+$//e
"   au BufWritePre * %s/\n\+\%$//e
"   au BufWritePre *.[ch] %s/\%$/\r/e
" augroup END

" [Spell] toggle
" nmap <leader>se :setlocal spell! spelllang=en_us<Cr>
nmap <leader>sd :setlocal spell! spelllang=de_de<Cr>
nmap <leader>sp :setlocal invspell<CR>

" Use spell correction and start in insert mode when we're editing commit messages,
" but enable spell in normal mode for text or markdown files.
if has('autocmd')
  if has('spell')
    let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
    au BufEnter * if index(spellable, &ft) < 0 | setlocal nospell | else | setlocal spell | endif
    " au BufNewFile,BufRead COMMIT_EDITMSG, setlocal spell
    au FileType help if &buftype ==# 'help' | setlocal nospell | endif
  endif
  au BufNewFile,BufRead COMMIT_EDITMSG, call feedkeys('i')
endif

" update statusline
augroup file.manager
  au!
  au FileType netrw    call lightline#update()
  au FileType startify call lightline#update()
augroup END

" fzf if passed argument is a folder
augroup folderarg
  " change working directory to passed directory
  au VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif

  " start startify (fallback if fzf is closed)
  au VimEnter * if argc() != 0 && isdirectory(argv()[0]) | Startify  | endif

  " start fzf on passed directory
  au VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'FzfFiles ' fnameescape(argv()[0]) | endif
augroup END

" Open URL under cursor
command -bar -nargs=1 OpenURL :!xdg-open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:)]*')
  echo s:uri
  if s:uri != ""
    exec "!xdg-open \"" . s:uri . "\""
  else
    echo "No URL found in line."
  endif
endfunction
map <silent> <Leader>ou  :call OpenURL()<CR>
map <silent> <Leader>gx  :call OpenURL()<CR>

function! s:RemoveLastPathComponent()
  return substitute(getcmdline(), '\%(\\ \|[\\/]\@!\f\)\+[\\/]\=$\|.$', '', '')
endfunction
cnoremap <C-t> <C-\>e(<SID>RemoveLastPathComponent())<CR>

" runtime! custom/1*.vim
" }}}
" Easycomplete: Snippets & SuperTab {{{

" set omnifunc=htmlcomplete#CompleteTags
"set omnifunc=csscomplete#CompleteCSS
"set omnifunc=javascriptcomplete#CompleteJS
set omnifunc+=syntaxcomplete#Complete

" select completion with right arrow
inoremap <expr> <Right> pumvisible() ? "\<C-Y>" : "\<Right>"
"" close insert menu with left arrow
inoremap <expr> <Left>  pumvisible() ? "<ESC>a" : "<Left>"

" Easycomplete: settings
" let g:easycomplete_tab_trigger="<c-space>"
" let g:easycomplete_scheme="dark" "rider,sharp

nnoremap <silent> <M-/> :EasyCompleteNextDiagnostic<CR>
nnoremap <silent> <M-\> :EasyCompletePreviousDiagnostic<CR>
nmap gr :EasyCompleteReference<CR>
nmap gt :EasyCompleteGotoDefinition<CR>

let g:easycomplete_diagnostics_enable = 1
let g:easycomplete_signature_enable = 1
" let g:easycomplete_tabnine_enable = 1

" au User easycomplete_custom_plugin call easycomplete#RegisterSource({
"       \ 'name':      'snips',
"       \ 'whitelist': ['*'],
"       \ 'completor': 'easycomplete#sources#snips#completor',
"       \ 'constructor': 'easycomplete#sources#snips#constructor',
"       \  })

"" Ultisnips: settings
" let g:UltiSnipsSnippetDirectories=[$HOME/.local/share/nvim/plugged/ultisnips']
" let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsSnippetsDir = ", "$HOME/.local/share/nvim/plugged/snippets.nvim" ~/.config/nvim/snips"
" let g:UltiSnipsSnippetDirectories = ["snips", "Snippets"]
let g:UltiSnipsExpandTrigger="<M-Enter>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:completion_enable_snippet = 'UltiSnips'

" SuperTab: settings
" Set default completion type
" let g:SuperTabContextDefaultCompletionType = "<c-p>"
"let g:SuperTabNoCompleteBefore =[]
" let g:SuperTabNoCompleteAfter = ['^', ',', ' ']
" let g:SuperTabClosePreviewOnPopupClose = 1
" let g:SuperTabMappingForward = "<tab>"
" let g:SuperTabMappingBackward = "<s-tab>"
" let g:SuperTabLongestEnhanced = 1
" let g:SuperTabLongestHighlight = 1
" let g:SuperTabDefaultCompletionType = 'context'

" autocmd FileType *
"       \ if &omnifunc != '' |
"       \   call SuperTabChain(&omnifunc, "<c-p>") |
"       \ endif

" let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
" let g:SuperTabContextDiscoverDiscovery =
"       \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" LSP: completion for specific language
" lua local lsp_installer = require("nvim-lsp-installer")
" lua require'lspconfig'.bashls.setup{}
" lua require'lspconfig'.jsonls.setup{}
" lua require'lspconfig'.vimls.setup{}
" lua require'lspconfig'.yamlls.setup{}
" lua require'lspconfig'.pylsp.setup{}
" lua require'lspconfig'.sumneko_lua.setup{}
" lua require'lspconfig'.jedi_language_server.setup{}

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

" imap <tab>   <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)
" }}}
" Visual Multi: {{{

" if exists(':VMTheme')
" let g:VM_theme_set_by_colorscheme = 1
"   hi VM_Extend ctermbg=178 ctermfg=235 guibg=#d79921 guifg=#1d2021 cterm=bold  gui=bold
"   hi VM_Cursor ctermbg=202 ctermfg=231 guibg=#d65d0e guifg=#ebdbb2 cterm=bold  gui=bold
"   hi VM_Insert ctermbg=114 ctermfg=235 guibg=#8ec07c guifg=#1d2021 cterm=bold  gui=bold
"   hi VM_Mono   ctermbg=031 ctermfg=231 guibg=#458588 guifg=#ebdbb2 cterm=bold  gui=none
" " silent! VMTheme gruvbox
" endif

  let g:VM_theme                    = 'gruvbox'
  let g:VM_verbose_commands         = 1
  let g:VM_use_first_cursor_in_line = 1
  let g:VM_mouse_mappings           = 1
  let g:VM_maps                     = {}
  let g:VM_leader                   = ','
  nmap  cp vip,c
  " let g:VM_leader                   = '<Space>'
  " nmap  cp vip<Space>c
  let g:VM_user_operators = ['yd', {'cs': 2}]
  let g:VM_maps["Select Operator"]  = 'gs'
  let g:VM_maps["Undo"]             = 'u'
  let g:VM_maps["Redo"]             = '<C-r>'
  let g:VM_custom_noremaps = {'==': '==', '<<': '<<', '>>': '>>'}
  let g:VM_persistent_registers     = 1
  " let g:VM_reindent_filetypes = ['zsh, vim, sh, lua, py']
  let g:VM_highlight_matches = 'hi! link Search DiffText'
  " }}}
" GitGutter: {{{

" hi GitGutterAdd    guifg=#a8b520 guibg=#1d2021
hi GitGutterChange guifg=#d79921 guibg=#1d2021
" hi GitGutterDelete guifg=#fa4934 guibg=#1d2021
" hi GitGutterChangeDelete guifg=#8ec07c guibg=#1d2021
  " let g:gitgutter_enable = 1
  " let g:gitgutter_log = 1
  let g:gitgutter_map_keys = 0
  let g:gitgutter_preview_win_floating = 1
  let g:gitgutter_close_preview_on_escape = 1
nmap <leader>gn :GitGutterLineNrHighlightsToggle<CR>
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>
nmap <leader>gs :GitGutterSignsToggle<CR>
nmap <leader>gt :GitGutterToggle<CR>
nmap <leader>gz :GitGutterFold<CR>
nmap )c   <Plug>(GitGutterNextHunk)
nmap (c   <Plug>(GitGutterPrevHunk)
nmap ghp  <Plug>(GitGutterPreviewHunk)
nmap ghs  <Plug>(GitGutterStageHunk)
nmap ghu  <Plug>(GitGutterUndoHunk)
omap ic   <Plug>(GitGutterTextObjectInnerPending)
omap ac   <Plug>(GitGutterTextObjectOuterPending)
xmap ic   <Plug>(GitGutterTextObjectInnerVisual)
xmap ac   <Plug>(GitGutterTextObjectOuterVisual)

"" Git: 'vim.fugitive'
let g:fugitive_no_maps = 1
noremap <leader>gi :Git<CR>
noremap <leader>gc :Git commit --verbose<CR>
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gr :GRemove<CR>

" noremap <silent> <leader>gh :!GIT_DIR=$HOME/.cfg.git\ GIT_WORK_TREE=$HOME
noremap <silent> <leader>gv :GV<CR>
" }}}
" Vim Sneak: {{{

  let g:sneak#label = 1
  let g:sneak#s_next = 1

hi Sneak      guifg=black guibg=#fabd2f
hi SneakScope guifg=black guibg=#fe8019

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

nmap <expr> <Enter> sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Enter>'

" smart f with motion labels
nnoremap <silent> f :<C-U>call sneak#wrap('',           1, 0, 1, 1)<CR>
nnoremap <silent> F :<C-U>call sneak#wrap('',           1, 1, 1, 1)<CR>
xnoremap <silent> f :<C-U>call sneak#wrap(visualmode(), 1, 0, 1, 1)<CR>
xnoremap <silent> F :<C-U>call sneak#wrap(visualmode(), 1, 1, 1, 1)<CR>
onoremap <silent> f :<C-U>call sneak#wrap(v:operator,   1, 0, 1, 1)<CR>
onoremap <silent> F :<C-U>call sneak#wrap(v:operator,   1, 1, 1, 1)<CR>

" smart t with motion labels
nnoremap <silent> t :<C-U>call sneak#wrap('',           1, 0, 1, 1)<CR>
nnoremap <silent> T :<C-U>call sneak#wrap('',           1, 1, 1, 1)<CR>
xnoremap <silent> t :<C-U>call sneak#wrap(visualmode(), 1, 0, 1, 1)<CR>
xnoremap <silent> T :<C-U>call sneak#wrap(visualmode(), 1, 1, 1, 1)<CR>
onoremap <silent> t :<C-U>call sneak#wrap(v:operator,   1, 0, 1, 1)<CR>
onoremap <silent> T :<C-U>call sneak#wrap(v:operator,   1, 1, 1, 1)<CR>
" }}}
" Tagbar: {{{

" map <F3>       :TagbarToggle<CR>
map <leader>tb :TagbarToggle<CR>
" autofocus on tagbar open
  let g:tagbar_autofocus = 1
  " let g:tagbar_width = max([24, winwidth(0) / 5])
  let g:tagbar_indent = 0
  let g:tagbar_show_visibility = -1
  let g:tagbar_autoshowtag = 0
  let g:no_status_line = 1
  let g:tagbar_silent = 0
  let g:tagbar_wrap = 0
  let g:tagbar_jump_lazy_scroll = 0

" Surround:

" map <leader>` ysiw`
" map <leader>" ysiw"
map <leader>' ysiw'
map <leader>( ysiw(
map <leader>{ ysiw{
map <leader>[ ysiw[
" }}}
" Mappings: {{{
" AUTOCOMPLETE
" - ^n - autocomplete suggestions (next)
" - ^p - autocomplete suggestions (previous)
" - ^x^f - for filenames
" - ^x^] - tags only

" Delete word with alt-arrows
noremap  <M-Left>  db
inoremap <M-Left>  <Esc>ldbi
noremap  <M-Right> de
inoremap <M-Right> <Esc>ldei

" Replace all is aliased to S
nnoremap <leader>S :%s///g<Left><Left><Left>

" keep the next search centered (indexed-search)
" nmap n nzzzv
" nmap N Nzzzv

" JoinLines and keep cursor in place
nnoremap J mzJ`z

" `Ctrl-U` in insert mode deletes a lot. Use `Ctrl-G` u to first break undo
if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif

if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" redefine backspace to start new undo
inoremap <C-H> <C-G>u<C-H>
" breaks undo at each linebreak(linewise undo)
inoremap <CR> <C-]><C-G>u<CR>
"" Undo breakpoints
inoremap . .<C-G>u
inoremap , ,<C-G>u
inoremap ! !<C-G>u
inoremap ? ?<C-G>u

" Jumplist mutes above 5
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Back to normal mode from insert
inoremap jk <ESC>
inoremap kj <ESC>
inoremap jj <ESC>
inoremap kk <ESC>

" diff since last save
nnoremap <silent> <leader>d :w !diff % -<CR>

" toggle ruler
noremap <silent> <leader>sn :set rnu! nu! cul!<CR>

"open terminal in new tab
" func! OpenTerminal()
"   :tabnew
"   :terminal
"   call feedkeys('i')
" endf
" noremap <silent> <leader>tz :call OpenTerminal()<CR>
noremap <silent> <leader>tz :tabnew<CR>:terminal<CR>i
noremap <silent> <leader>zz :tabnew<CR>:terminal<CR>i
noremap <silent> <leader>nt :tabnew<CR>:terminal<CR>i

" Open filepath under cursor in new tab
nnoremap gF <C-w>gF

" open quickfix and list
noremap <silent> <leader>oq  :copen<CR>
noremap <silent> <leader>ol  :lopen<CR>

" close popup
tnoremap <ESC> <C-\><C-n>

" Better tabbing
xnoremap < <gv
xnoremap > >gv

" Move line / block of text up/down
nnoremap <silent> <leader>k     :move .-2<CR>==
nnoremap <silent> <leader>j     :move .+1<CR>==
xnoremap <silent>K              :move '<-2<CR>gv-gv
xnoremap <silent>J              :move '>+1<CR>gv-gv
inoremap <silent> <leader><C-k> <ESC>:move .-2<CR>==
inoremap <silent> <leader><C-j> <ESC>:move .+1<CR>==

" Set working directory
nnoremap <silent> <leader>. :lcd %:p:h<CR>

" Opens an edit command with the path of the currently edited file filled in
noremap <leader>e  :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
noremap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Press ^F in insert mode to insert the current file
imap <C-F> <C-R>=expand("%")<CR>

" path to the edited file in command line
cnoremap <M-e>  <C-R>=expand("%:p:h") . "/" <CR>

" expand %% to path in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <expr> * getcmdline() =~ '.*\*\*$' ? '/*' : '*'
" cnoreabbr <expr> %% fnameescape(expand('%:p'))

nnoremap <leader>aa :argadd <C-r>=fnameescape(expand('%:p:h'))<CR>/*<C-d>

""highlight search off
noremap <silent> <leader><Esc> :noh<CR><ESC>

" Keep flags when repeating substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" easy caps
noremap! <M-U> <Esc>gUiw`]a
noremap! <M-u> <Esc>guiw`]a
noremap  <M-U> <Esc>gUiw`]
noremap  <M-u> <Esc>guiw`]
" inoremap <M-U> <ESC>viwUea
" inoremap <M-u> <ESC>viwuea
" nnoremap <M-U> viwUe<ESC>
" nnoremap <M-u> viwue<ESC>

" Check file in shellcheck
" nmap <leader>s :!clear && shellcheck %<CR>

"  quick edit & source init.vim & .zshrc
nnoremap <silent> <leader>i  :tabe $MYVIMRC<CR>
nnoremap <silent> <leader>so :so $MYVIMRC<CR>:echo 'Vim Config sourced'<CR>
nnoremap <silent> <leader>zs :tabe ~/.config/zsh/.zshrc<CR>
nnoremap <silent> <leader>sz :!source $ZDOTDIR/.zshrc<CR>:echo 'Zsh config sourced'<CR>

" shortcuts for creating shebang
inoremap <silent> <leader>sb  #!/data/data/com.termux/files/usr/bin/env
nnoremap <silent> <leader>sb  i#!/data/data/com.termux/files/usr/bin/env

" ctag goto definition/declaration
nnoremap <silent> <M-]>      <C-w><C-]><C-w>T
nnoremap <silent> <Leader>tf :!ctags --extras=+f -R *<CR>
nnoremap <silent> <Leader>tg g]
nnoremap <silent> <Leader>ta g<C-]>

" start some plugins
noremap  <silent> <leader>-  :tabe %:h<CR>
nnoremap <silent> <leader>nn :tab new <bar> :Ex<CR>
nnoremap <silent> <leader>sf :tab new <Bar> :Startify<CR>
noremap  <silent> <M-V>      :Vifm<CR>
nnoremap <silent> <leader>ne :Texplore<CR>
nnoremap <silent> <leader>rt :RainbowToggle<CR>
nnoremap <silent> <leader>ct :ColorizerToggle<CR>
nnoremap <silent> <leader>ca :ColorizerAttachToBuffer<CR>
nnoremap <silent> <leader>cr :ColorizerReloadAllBuffers<CR>

" enable tpopes vim.repeat for some plugins
silent! call repeat#set("\<Plug>easymotion/easymotion", v:count)
silent! call repeat#set("\<Plug>mg979/vim-visual-multi", v:count)
silent! call repeat#set("\<Plug>jiangmiao/auto-pairs", v:count)
silent! call repeat#set("\<Plug>liuchengxu/vim-which-key", v:count)
silent! call repeat#set("\<Plug>justinmk/vim-sneak", v:count)
" }}}
" Window Navigation: {{{
"splits
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

noremap  <silent> <C-h> :call WinMove('h')<CR>
noremap  <silent> <C-j> :call WinMove('j')<CR>
noremap  <silent> <C-k> :call WinMove('k')<CR>
noremap  <silent> <C-l> :call WinMove('l')<CR>
noremap! <silent> <C-h> :call WinMove('h')<CR>
noremap! <silent> <C-j> :call WinMove('j')<CR>
noremap! <silent> <C-k> :call WinMove('k')<CR>
noremap! <silent> <C-l> :call WinMove('l')<CR>

"" Ctrl+{h,j,k,l} to navigate windows from any mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
" inoremap <C-h> <C-\><C-N><C-w>h
" inoremap <C-j> <C-\><C-N><C-w>j
" inoremap <C-k> <C-\><C-N><C-w>k
" inoremap <C-l> <C-\><C-N><C-w>l
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

"" Resize window
nnoremap <silent> <M-j> :resize -3<CR>
nnoremap <silent> <M-k> :resize +3<CR>
nnoremap <silent> <M-h> :vertical resize -3<CR>
nnoremap <silent> <M-l> :vertical resize +3<CR>

" split & change splits: horizontal <—> vertical
nnoremap <silent> <leader>vh  <C-w>t<C-w>H
nnoremap <silent> <leader>hv  <C-w>t<C-w>K
nnoremap <silent> <leader>hs :<C-u>split<CR>
nnoremap <silent> <leader>vs :<C-u>vsplit<CR>

"" Tab navigation mappings
noremap    <Tab>  gt
noremap  <S-Tab>  gT
nnoremap <silent> <leader>tc :tabclose<CR>
nnoremap <silent> <leader>tn :tabnew<CR>
nnoremap <silent> <leader>tx :tabnext<CR>
nnoremap <silent> <leader>tm :tabmove<CR>
nnoremap <silent> <leader>to :0tabmove<CR>
nnoremap <silent> <leader>t- :-tabmove<CR>
nnoremap <silent> <leader>t+ :+tabmove<CR>
nnoremap <silent> <leader>ts :tab split<CR>

" buffer mappings
nmap     <silent> <leader>bd :bdelete<CR>
nnoremap <silent> <leader>bD :Bdelete<CR>
nnoremap <silent> <leader>bW :Bwipeout<CR>
nnoremap <silent> <leader>bB :bufdo :bdelete<CR>
nnoremap <silent> <leader>bb :buffers<CR>:buffer<SPACE>
nnoremap          <leader>ba :badd<SPACE>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bw :write<CR>
nnoremap <silent> <leader>w  :update<CR>
" inoremap <silent> <leader>w  <ESC>:up<CR>A
" }}}
"Standart Keybindings: {{{

" Allow easy navigation between wrapped lines.
xmap j gj
xmap k gk
nmap j gj
nmap k gk

" Control-S Save
" nnoremap <silent> <C-S>      :up<cr>
" vnoremap <silent> <C-S> <esc>:up<cr>
" cnoremap <silent> <C-S> <esc>:up<cr>
"" Save + back into insert
"inoremap <C-S> <esc>:w<cr>a

"" Control-Q exit
noremap  <silent> <C-Q> <ESC>:q<CR>
noremap! <silent> <C-Q> <ESC>:q<CR>
" Quit all
map <silent> <leader>q  <ESC>:qa<CR>
" force quit all
nmap <silent>Q ZQ

" --------------- "Copy & paste" ---------------

" Make sure pasting in visual mode doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
xnoremap <silent> <expr> p <sid>Repl()

" paste last, not deleted yank
noremap! <C-P> <C-r>0
noremap  <leader>p "0p
noremap  <leader>P "0P

noremap  <leader>y "+y

" Allow for easy copy/paste
xnoremap y y`]
" vnoremap p p=`] " vim.pasta takes care of those two
" nnoremap p p=`]

" Duplicate a selection
" Visual mode: D
xmap D y'>p

" Y yanks from the cursor to EOL. See :help Y.
" nnoremap Y y$ # neovim defautl

""Visually select text that was last edited/pasted
noremap gV `[v`]
" }}}
