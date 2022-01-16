" Set mapleader to space by default early, so all mappings by plugins are set
if !exists("mapleader")
  let mapleader = "\<Space>"
endif
" set rtp+=~/.local/share/nvim/
" set exrc

""----------------- " Plugins "------------------

" Install vim-plug if not found
" if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
"   silent execute !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

let g:polyglot_disabled = ['markdown']
let g:vim_markdown_frontmatter = 1

" call plug#begin('~/.config/nvim/plugged')
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'
" statusline
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Convenience
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/visualrepeat'
Plug 'junegunn/goyo.vim', {  'on': 'Goyo', 'for': ['markdown', 'txt', 'text', 'rst', 'liquid'] }
Plug 'tpope/vim-scriptease', {'for': 'vim'}
" Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup'
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'liuchengxu/vim-which-key', {'on': ['WhichKey', 'WhichKey!'] }
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }

" Git
Plug 'tpope/vim-fugitive', { 'on': [] }
Plug 'airblade/vim-gitgutter', { 'on': ['GitGutterToggle', 'GitGutterToggleOn'] }
Plug 'tpope/vim-rhubarb'

" Better auto completion
Plug 'jayli/vim-easycomplete'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'norcalli/snippets.nvim'
" Neovim LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
" Plug 'nvim-lua/completion-nvim'

" Extras
Plug 'vim-utils/vim-man'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-obsession'
" Plug 'craigemery/vim-autotag'
Plug 'junegunn/vim-peekaboo'
" Plug 'Chiel92/vim-autoformat'
 Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'justinmk/vim-sneak'
" Plug 'easymotion/vim-easymotion'
Plug 'romainl/vim-cool'
" Syntax Highlighting & Colorscheme
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'ap/vim-css-color'
Plug 'lifepillar/vim-gruvbox8'
" Plug 'sheerun/vim-polyglot'
Plug 'gisphm/vim-polyglot-min'
Plug 'luochen1990/rainbow', { 'on': [ 'RainbowToggle', 'RainbowToggleOn' ] }
Plug 'antoinemadec/FixCursorHold.nvim'
" Plug 'rking/ag.vim'

if exists('$TMUX')
  Plug 'tmux-plugins/vim-tmux'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'wellle/tmux-complete.vim'
  " Plug 'edkolev/tmuxline.vim'
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

" ------------ "Plugin settings" ------------

  let g:webdevicons_enable = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:webdevicons_enable_startify = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1

  "zslet g:AutoPairsFlyMode = 1
  " let g:AutoPairs["<"] = '>'
  let g:matchup_matchparen_offscreen = {'scrolloff': '1'}
  let g:matchup_surround_enabled = 1
  let g:matchup_delim_noskips = 1
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']

  nmap <leader>ut <Cmd>UndotreeToggle<CR>
  let g:undotree_WindowLayout       = 2
  let g:undotree_ShortIndicators    = 1
  " let g:undotree_HelpLine           = 1
  let g:undotree_SetFocusWhenToggle = 1
  " let g:pasta_paste_before_mapping = 'Pp'
  " let g:pasta_paste_after_mapping = 'pp'

  let g:VM_theme                    = 'gruvbox'
  let g:VM_use_first_cursor_in_line = 1
  let g:VM_mouse_mappings           = 1
  let g:VM_maps                     = {}
  let g:VM_maps["Undo"]             = 'u'
  let g:VM_maps["Redo"]             = '<C-r>'
  let g:VM_highlight_matches        = 'underline,bold'
  " let g:VM_theme_set_by_colorscheme = 1
  " let g:VM_Mono_hl   = 'DiffText'
  " let g:VM_Extend_hl = 'DiffAdd'
  " let g:VM_Cursor_hl = 'Visual'
  " let g:VM_Insert_hl = 'DiffChange'

  if exists(':VMTheme')
    let g:VM_theme_set_by_colorscheme = 1
    hi VM_Extend guibg=#5f8787 guifg=#ebdbb2
    hi VM_Cursor guibg=#8ec07c guifg=#1d2021
    hi VM_Insert guibg=#b16286 guifg=#ebdbb2
    hi VM_Mono35 guibg=#cc241d guifg=#ebdbb2
  endif

  let g:obsession_no_bufenter = 1
  "let g:autotagCtagsCmd='ctags --excmd=number -f -R'
  "let g:autotagCtagsCmd='ctags --extras=+f -R *'
  " let g:autotagTagsFile=
  " let g:peekaboo_window = 'vert bo 40new'
  let g:peekaboo_compact = 1
  let g:peekaboo_prefix = '<leader>'
  let gpeekaboo_ins_prefix = '<C-x>'
  " noremap <F10>      :Autoformat<CR>
  " noremap <leader>af :Autoformat<CR>

  " let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_new_list_item_indent = 2
  let g:vim_markdown_folding_disabled = 1
  let g:markdown_syntax_conceal = 1
  let g:vim_markdown_conceal = 1

  " map  <leader>M <Plug>(Man)
  map  <leader>m <Plug>(Tman)
  let g:CoolTotalMatches = 1
  " let g:cssColorVimDoNotMessMyUpdatetime = 1
  let g:rainbow_active = 0
  " let g:agprg="--color-match=01;31;103 --column"

  let g:tmux_navigator_save_on_switch = 'update'
  let g:tmux_navigator_no_mappings = 1
  " let g:tmuxline_theme = 'lightline_insert'
  " let g:tmuxline_preset = 'minimal'

  let g:plug_window = 'tabnew'
  let g:optionprefix_improved_warnings = 1
  let g:awk_is_gawk = 1
  " let g:zsh_fold_enable = 1
  " let g:vimsyn_folding = 'a,f'

"--------------- "Configurations" ---------------

filetype plugin indent on
syntax enable

" source ~/.config/nvim/settings/*
source ~/.config/nvim/custom/01-settings.vim
source ~/.config/nvim/custom/02-lightline.vim
source ~/.config/nvim/custom/startiffy.vim
source ~/.config/nvim/custom/30-fzf.vim
source ~/.config/nvim/custom/which-key.vim
source ~/.config/nvim/custom/10-goyo.vim
" source ~/.config/nvim/custom/20-easymotion.vim

lua require'colorizer'.setup()

set background=dark
colorscheme gruvbox8_hard
" let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_transp_bg = 1

autocmd FileType netrw    call lightline#update()
autocmd FileType startify call lightline#update()

" Enable default theme if some other is not set
if !exists("g:colors_name")
  colorscheme default
endif

" Always use terminal background
hi! Normal guibg=NONE
" Reversed visual highlighting
hi! Visual gui=reverse guifg=NONE guibg=NONE
" Cursor line and column
hi! LineNr          guibg=#1d2021
hi! SignColumn      guibg=#1d2021
hi! CursorLine      guibg=#1d2021
hi! CursorLineNr    guibg=#1d2021
hi! ColorColumn     guibg=#1d2021
hi! Special         gui=NONE
hi! EndOfBuffer     guifg=#504945 guibg=NONE gui=NONE
" hi! Directory       guifg=#458588 gui=italic
hi! Pmenu           guibg=#282828
" hi! PmenuSel        guifg=#1d2021
" hi! PmenuSbar       guibg=#83a598
" hi! PmenuThumb      guibg=#504945
hi! StartifyHeader  guifg=#8ec07c gui=bold ctermfg=107
hi! StartifySpecial guifg=#fabd2f ctermfg=221

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="Visual", timeout=300, on_visual=false, on_macro=true}

if executable('rg')
  let g:rg_derive_root='true'
  let g:rg_highlight='true'
endif

" Delete trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * %s/\n\+\%$//e
" autocmd BufWritePre *.[ch] %s/\%$/\r/e

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e
map <leader>fx :FixWhitespace<CR>

" Set cursor style. Default:
" n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
set guicursor=n-v:block-Cursor,i-c-ci-ve:ver25-iCursor,r-cr:hor20-lCursor,o:hor50-nCursor
      \,a:blinkwait600-blinkoff400-blinkon250
      \,sm:block-blinkwait175-blinkoff150-blinkon175

" set default cursor when leaving nvim
autocmd! VimLeave * set guicursor=a:ver25-blinkon25

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Make sure pasting in visual mode doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vnoremap <silent> <expr> p <sid>Repl()

" [Spell]
nmap <leader>se :setlocal spell! spelllang=en_us<Cr>
nmap <leader>sd :setlocal spell! spelllang=de_de<Cr>
nmap <leader>sp :setlocal invspell<CR>

" Use spell correction and start in insert mode when we're editing commit messages, text or markdown files.
if has('autocmd')
  if has('spell')
    let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
    au BufEnter * if index(spellable, &ft) < 0 | setlocal nospell | else | setlocal spell | endif
    " au BufNewFile,BufRead COMMIT_EDITMSG, setlocal spell
  endif
  au BufNewFile,BufRead COMMIT_EDITMSG, call feedkeys('i')
endif

" enable spell only if file type is normal text
" let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
" autocmd BufEnter * if index(spellable, &ft) < 0 | setlocal nospell | else | setlocal spell | endif

" tmux
if exists('$TMUX')
  let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
endif

" startify if no passed argument or all buffers are closed
" augroup noargs
"   " startify when there is no open buffer left
"   autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

"   " open startify on start if no argument was passed
"   autocmd VimEnter * if argc() == 0 | Startify | endif
" augroup END

" fzf if passed argument is a folder
augroup folderarg
"   " change working directory to passed directory
  autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif

"   " start startify (fallback if fzf is closed)
"   autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | Startify  | endif

"   " start fzf on passed directory
  autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'FzfFiles ' fnameescape(argv()[0]) | endif
augroup END

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    <Plug>(Man)
    "   call CocAction('doHover')
  endif
endfunction

" Open URL
command -bar -nargs=1 OpenURL :!xdg-open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:)]*')
  echo s:uri
  if s:uri != ""
    exec "!xdg-open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map     <Leader>ow  :call OpenURL()<CR>

cnoremap <C-t> <C-\>e(<SID>RemoveLastPathComponent())<CR>
function! s:RemoveLastPathComponent()
  return substitute(getcmdline(), '\%(\\ \|[\\/]\@!\f\)\+[\\/]\=$\|.$', '', '')
endfunction

"-------- "Auto complete Menu & SuperTab" --------

" set omnifunc=htmlcomplete#CompleteTags
"set omnifunc=csscomplete#CompleteCSS
"set omnifunc=javascriptcomplete#CompleteJS
set omnifunc+=syntaxcomplete#Complete

" select completion with right arrow
inoremap <expr> <right> pumvisible() ? "\<C-y>" : "<right>"
"" close insert menu with left arrow
inoremap <expr> <left>  pumvisible() ? "<ESC>a" : "<left>"

" easy complete settings
" let g:easycomplete_tab_trigger="<c-space>"
" let g:easycomplete_scheme="dark" "rider,sharp

" inoremap ^] ^X^]
" inoremap ^F ^X^F
" inoremap ^D ^X^D
" inoremap ^L ^X^L

" set dictionary "+=${~/.config/nvim/spell/*}

nnoremap <M-d> :EasyCompleteNextDiagnostic<CR>
nnoremap <M-f> :EasyCompletePreviousDiagnostic<CR>

au User easycomplete_plugin call easycomplete#RegisterSource({
      \ 'name': 'snips',
      \ 'whitelist': ['*'],
      \ 'completor': 'easycomplete#sources#snips#completor',
      \ 'constructor': 'easycomplete#sources#snips#constructor',
      \ })

au User easycomplete_custom_plugin call easycomplete#RegisterSource({
      \ 'name':      'snips',
      \ 'whitelist': ['*'],
      \ 'completor': 'easycomplete#sources#snips#completor',
      \ 'constructor': 'easycomplete#sources#snips#constructor',
      \  })

"" ultisnips settings
" let g:UltiSnipsSnippetDirectories=[$HOME/.local/share/nvim/plugged/ultisnips']
" set rtp+=~/.config/nvim
let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsSnippetsDir = ", "$HOME/.local/share/nvim/plugged/snippets.nvim" ~/.config/nvim/Snips"
let g:UltiSnipsSnippetDirectories = ["Snips", "Snippets"]
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:completion_enable_snippet = 'UltiSnips'

" SuperTab settings
" Set default completion type
" let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabContextDefaultCompletionType = "<c-p>"
"let g:SuperTabNoCompleteBefore =[]
let g:SuperTabNoCompleteAfter = ['^', ',', ' ']
let g:SuperTabClosePreviewOnPopupClose = 1
" let g:SuperTabMappingForward = "<tab>"
" let g:SuperTabMappingBackward = "<s-tab>"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
let g:SuperTabDefaultCompletionType = 'context'

autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif

let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery =
      \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" nvim lsp completion for specific language
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

" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)

""------------------- "Git" ---------------------

hi GitGutterAdd    guifg=#a1b520 guibg=#1d2021 ctermfg=2
hi GitGutterChange guifg=#d79921 guibg=#1d2021 ctermfg=3
hi GitGutterDelete guifg=#fa4934 ctermfg=1
  let g:gitgutter_map_keys = 0
  let g:gitgutter_log = 1
  " let g:gitgutter_sign_added = '+'
  " let g:gitgutter_sign_modified = '~'
  " let g:gitgutter_sign_removed = '_'
  " let g:gitgutter_highlight_linenrs = 1
  " let g:gitgutter_sign_allow_clobber = 1
  " let g:gitgutter_set_sign_backgrounds = 1
  let g:gitgutter_preview_win_floating = 1
  let g:gitgutter_close_preview_on_escape = 1
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>
nmap <leader>gt :GitGutterToggle<CR>
nmap )    <Plug>(GitGutterNextHunk)
nmap (    <Plug>(GitGutterPrevHunk)
nmap ghp  <Plug>(GitGutterPreviewHunk)
nmap ghs  <Plug>(GitGutterStageHunk)
nmap ghu  <Plug>(GitGutterUndoHunk)
omap ic   <Plug>(GitGutterTextObjectInnerPending)
omap ac   <Plug>(GitGutterTextObjectOuterPending)
xmap ic   <Plug>(GitGutterTextObjectInnerVisual)
xmap ac   <Plug>(GitGutterTextObjectOuterVisual)

"" Git 'vim.fugitive'
" let g:fugitive_no_maps = 1
" noremap <leader>gw  :Gwrite<CR>
noremap <leader>gc :Git commit --verbose<CR>
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gr :GRemove<CR>

" ------------------ "Vim-Sneak" -----------------

let g:sneak#label = 1
let g:sneak#s_next = 1
" let g:sneak#label_esc = "\<Space>"

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

" autocmd User SneakEnter set nocursorline
" autocmd User SneakLeave set cursorline

" ------------------ "EasyAlign" -----------------

" Start EasyAlign in visual mode (e.g. vip<Enter>) [C-p for LiveEasyAlign]
" vmap <Enter> <Plug>(LiveEasyAlign)
" vmap <C-p> <Plug>(EasyAlign)

" Start EasyAlign for a motion/text object (e.g. gaip) [C-p for LiveEasyAlign]
" nmap ga <Plug>(EasyAlign)

""------------- "tagbar settings" ----------------

" map <F3>       :TagbarToggle<CR>
" map <leader>tb :TagbarToggle<CR>
" autofocus on tagbar open
  " let g:tagbar_autofocus = 1
  " let g:tagbar_width = max([24, winwidth(0) / 5])
  " let g:tagbar_indent = 0
  " let g:tagbar_show_data_type = 0
  " let g:tagbar_show_visibility = -1
  " let g:tagbar_autoshowtag = 0
  " let g:no_status_line = 1
  " let g:tagbar_silent = 0
  " let g:tagbar_wrap = 0
  " let g:tagbar_scrolloff = 3
  " let g:tagbar_jump_lazy_scroll = 0

"---------------- "you surround" -----------------

" map <leader>` ysiw`
" map <leader>" ysiw"
map <leader>' ysiw'
map <leader>( ysiw(
map <leader>{ ysiw{
map <leader>[ ysiw[
" nmap <leader>< ysiw<

"----------------- "Mappings" -------------------

" AUTOCOMPLETE
" - ^n - autocomplete suggestions (next)
" - ^p - autocomplete suggestions (previous)
" - ^x^f - for filenames
" - ^x^] - tags only

" Delete word with alt-arrows
noremap <M-Left> db
inoremap <M-Left> <Esc>ldbi
noremap <M-Right> de
inoremap <M-Right> <Esc>ldei

" Replace all is aliased to S
nnoremap <leader>S :%s///g<Left><Left><Left>

" These will keep the next search centered
nnoremap n nzzzv
nnoremap N Nzzzv

" deletes from eol to beginning of next line
nnoremap J mzJ`z

"" Undo breakpoints
inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

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
noremap <silent> <leader>to :0tabmove<CR>
noremap <silent> <leader>nn :set nornu nonu<CR>
noremap <silent> <leader>sn :set rnu nu<CR>

"open terminal
noremap <silent> <leader>tz :bot tab terminal<CR>

" open quickfix and list
noremap <silent> <leader>oq  :copen<CR>
noremap <silent> <leader>ol  :lopen<CR>

"" close popup
tnoremap <ESC> <C-\><C-n>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move line / block of text up/down
xnoremap <silent>K                   :move '<-2<CR>gv-gv
xnoremap <silent>J                   :move '>+1<CR>gv-gv
inoremap <silent> <leader><C-k> <ESC>:move .-2<CR>==
inoremap <silent> <leader><C-j> <ESC>:move .+1<CR>==
nnoremap <silent> <leader>k          :move .-2<CR>==
nnoremap <silent> <leader>j          :move .+1<CR>==

"" Set working directory
nnoremap <silent> <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <leader>e  :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled in
noremap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Press ^F in insert mode to insert the current file
imap <C-F> <C-R>=expand("%")<CR>

"" path to the edited file in command line
cnoremap <M-e>  <C-R>=expand("%:p:h") . "/" <CR>

"" expand %% to path in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <expr> * getcmdline() =~ '.*\*\*$' ? '/*' : '*'
cnoreabbr <expr> %% fnameescape(expand('%:p'))

nnoremap <leader>aa :argadd <C-r>=fnameescape(expand('%:p:h'))<CR>/*<C-d>

""highlight search off
noremap <silent> <leader><Esc> :noh<CR><Esc>

"" Keep flags when repeating substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"" easy caps
inoremap <M-u> <ESC>viwUa
nnoremap <M-u> viwU<ESC>

"" Check file in shellcheck
""nmap <leader>s :!clear && shellcheck %<CR>

"" quick edit & source init.vim & .zshrc
nnoremap <silent> <leader>i  :tabe $MYVIMRC<CR>
nnoremap <silent> <leader>so :so $MYVIMRC<CR>:echo 'Vim Config sourced'<CR>
nnoremap <silent> <leader>zs :tabe ~/.config/zsh/.zshrc<CR>
nnoremap <silent> <leader>sz :!source $ZDOTDIR/.zshrc<CR>:echo 'Zsh config sourced'<CR>

"" shortcuts for creating shebang
inoremap <silent> <leader>sb  #!/data/data/com.termux/files/usr/bin/env
nnoremap <silent> <leader>sb  i#!/data/data/com.termux/files/usr/bin/env

" ctag goto definition/declaration
nnoremap <Leader><C-]> <C-w><C-]><C-w>T
nmap     <Leader>tg :!ctags --extras=+f -R *<CR>
nmap     <Leader>st g]
nmap     <Leader>ta g<C-]>
nmap     <Leader>T   <C-t>

"" netrw
nnoremap <silent> <leader>nt :tab new<bar> :Ex <bar> :vertical resize 25<CR>
nnoremap <silent> -   :tabe %:h<CR>
nnoremap <silent> <leader>tp :Texplore<CR>
" Start startify
nnoremap <silent> <leader>sf :tab new<Bar> :Startify<CR>
nnoremap <silent> <leader>rt :RainbowToggleOn<CR>

"" tpopes vim.repeat
silent! call repeat#set("\<Plug>easymotion/easymotion", v:count)
silent! call repeat#set("\<Plug>junegunn/vim-easy-align", v:count)
silent! call repeat#set("\<Plug>jiangmiao/auto-pairs", v:count)
silent! call repeat#set("\<Plug>liuchengxu/vim-which-key", v:count)

" ------------ "Window navigation" ---------------

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

noremap <silent> <C-h> :call WinMove('h')<CR>
noremap <silent> <C-j> :call WinMove('j')<CR>
noremap <silent> <C-k> :call WinMove('k')<CR>
noremap <silent> <C-l> :call WinMove('l')<CR>

"" Ctrl+{h,j,k,l} to navigate windows from any mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

"" Resize window
nnoremap <silent> <M-j> :resize -4<CR>
nnoremap <silent> <M-k> :resize +4<CR>
nnoremap <silent> <M-h> :vertical resize -4<CR>
nnoremap <silent> <M-l> :vertical resize +4<CR>

"" Change splits: horizontal <—> vertical
noremap <silent> <leader>vh  <C-w>t<C-w>H
noremap <silent> <leader>hv  <C-w>t<C-w>K

"" Tab navigation mappings
nnoremap   <Tab> gt
nnoremap <S-Tab> gT
noremap <silent> <leader>tn :tabnew<CR>
noremap <silent> <leader>tm :tabmove<CR>
noremap <silent> <leader>to :0tabmove<CR>
noremap <silent> <leader>tl :-tabmove<CR>
noremap <silent> <leader>tr :+tabmove<CR>
noremap <silent> <leader>tc :tabclose<CR>
noremap <silent> <leader>ts :tab split<CR>
noremap <silent> <leader>sh :<C-u>split<CR>
noremap <silent> <leader>sv :<C-u>vsplit<CR>

" buffer navigation
nmap    <silent> <leader>bd :bdelete<CR>
nmap    <silent> <leader>bu :FzfBuffer <C-d>
nmap    <silent> <leader>bb :buffers<CR>:buffer<SPACE>
nmap    <silent> <leader>ba :badd<SPACE>
nmap    <silent> <leader>bw :write<CR>
nmap    <silent> <leader>w  :update<CR>
nmap    <silent> <leader>bn :bnext<CR>
nmap    <silent> <leader>bp :bprevious<CR>

"------------ "Standart Keybindings" ------------

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" Control-S Save
" nnoremap <silent> <C-S>      :up<cr>
" vnoremap <silent> <C-S> <esc>:up<cr>
" inoremap <silent> <C-S> <esc>:up<cr>
"" Save + back into insert
"inoremap <C-S> <esc>:w<cr>a

"" Control-Q exit
nnoremap <silent> <C-Q>      :q<CR>
vnoremap <silent> <C-Q> <ESC>:q<CR>
inoremap <silent> <C-Q> <ESC>:q<CR>
" Quit all
map <silent> <leader>q  <ESC>:qa<CR>

" --------------- "Copy & paste" ---------------

" nnoremap  <C-c> "+y
" vnoremap <C-c> y
" inoremap <C-P> <esc>pa
cnoremap <C-P> <C-r>0
" nnoremap <C-P> "+p
" paste last, not deleted yank
noremap  <leader>p "0p
noremap  <leader>P "0P
" noremap <leader>pp "+gp<CR>
noremap  <leader>y "+y<CR>

" Allow for easy copying and pasting
vnoremap y y`]
" nnoremap p p=`]

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Y yanks from the cursor to EOL. See :help Y.
nnoremap Y y$

""Visually select text that was last edited/pasted
noremap gV `[v`]

" Open file under cursor in new tab
noremap gF <C-w>gF
