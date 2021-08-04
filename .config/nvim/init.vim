source ~/.config/nvim/settings/settings.vim

"--------------- " Plugins "---------------

" Install vim-plug if not found
" if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
"   silent execute !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

filetype plugin on
filetype plugin indent on
syntax enable
" let g:polyglot_disabled = ['sensible', 'markdown']

call plug#begin('~/.config/nvim/plugged')

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'
"" Syntax Highlight & Colorscheme
Plug 'lifepillar/vim-gruvbox8'
" Plug 'sheerun/vim-polyglot'
Plug 'gisphm/vim-polyglot-min'
Plug 'andymass/vim-matchup'
"" Covinience
Plug 'tpope/vim-repeat'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'
Plug 'jiangmiao/auto-pairs' ", { 'on' : 'AutoPairsShortcutToggle' }
" let g:AutoPairs['<']='>'
Plug 'preservim/nerdcommenter', { 'on': '<plug>NERDCommenterToggle' }
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
" Plug 'craigemery/vim-autotag'

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

autocmd! User vim-which-key call which_key#register('<Space>')
let mapleader = "\<space>"
let maplocalleader = " "
nnoremap <silent> <leader>      :WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ' '<CR>
let g:which_key_hspace = 2
let g:which_key_timeout = 300
let g:which_key_floating_opts = { 'row': '+2', 'col': '-2', 'width': '+1', 'hight': '+3' }
" let g:which_key_fallback_to_native_key=1
let g:which_key_centered = 0

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle', 'for': 'git' }
Plug 'tpope/vim-rhubarb', {'on': 'GBrowse', 'for': 'vim-fugitive' }
" Better autocompletion
Plug 'jayli/vim-easycomplete'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'norcalli/snippets.nvim'
" Plug 'nvim-lua/completion-nvim'
" Neovim LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'
" Extras
" Plug 'vim-utils/vim-man'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
nmap <leader>ut :UndotreeToggle<CR>

" Plug 'ryanoasis/vim-devicons'

call plug#end()

""-------------- "Configurations" --------------

"" diff since last save
nnoremap <leader>dif :w !diff % -<CR>

map <leader>man <Plug>(Man)

" ctag goto definition/declaration
nnoremap <Leader><C-]> <C-w><C-]><C-w>T
nmap <Leader>rt :!ctags --extras=+f -R *<CR>
nmap <Leader>st g]
nmap <Leader>ta g<C-]>
nmap <Leader>T   <C-t>

" Delete trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

"" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"" Disable automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=cro

" Make sure pasting in visual mode doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" [Spell]
nmap <leader>se :setlocal spell! spelllang=en_us<Cr>
nmap <leader>sd :setlocal spell! spelllang=de_de<Cr>
nmap <leader>sp :set invspell

" Use spell correction and start in insert mode when we're editing commit
" messages.
if has('autocmd')
  if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  endif
  au BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')
endif

"" tmux
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

"" set default cursor when leaving nvim
autocmd! VimLeave * set guicursor=a:ver25-blinkon25

let g:awk_is_gawk = 1

" if executable('rg')
"   let g:rg_derive_root='true'
" endif

let g:matchup_motion_enabled = 0
let g:matchup_text_obj_enabled = 0
let g:matchup_delim_noskips = 1
let g:matchup_matchparen_deferred = 1

"------- "Auto complete Menu & SuperTab" -------

set omnifunc=htmlcomplete#CompleteTags
""set omnifunc=csscomplete#CompleteCSS
""set omnifunc=javascriptcomplete#CompleteJS
""set omnifunc=pythoncomplete#CompletePyls
set omnifunc=syntaxcomplete#Complete

"" select completion with right arrow
inoremap <expr> <right> pumvisible() ? "<CR>" : "<right>"
"" close insert menu with left arrow
inoremap <expr> <left> pumvisible() ? "<ESC>a" : "<left>"

""inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" Configure C/C++ language server manually
""if executable('clangd')
""    au User lsp_setup call lsp#register_server({
""        \ 'name': 'clangd',
""        \ 'cmd': {server_info->['clangd']},
""        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
""        \ })
""endif

" easy complete settings
" let g:easycomplete_tab_trigger="<c-space>"
let g:easycomplete_scheme="dark" ""rider,sharp

"set dictionary=${Your_Dictionary_File}

au User easycomplete_plugin call easycomplete#RegisterSource({
      \ 'name': 'snips',
      \ 'whitelist': ['*'],
      \ 'completor': 'easycomplete#sources#snips#completor',
      \ 'constructor': 'easycomplete#sources#snips#constructor',
      \ })

" ultisnips settings
"let g:UltiSnipsSnippetDirectories=[$HOME.'~/.config/nvim/plugged/ultisnips"]
set rtp+=~/.config/nvim
"let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsSnippetsDir = "~/.config/nvim/custom/Snips"
" let g:UltiSnipsSnippetDirectories = ["Snips"]
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-space>"
let g:completion_enable_snippet = 'UltiSnips'
" SuperTab settings
" Set default completion type
"let g:SuperTabDefaultCompletionType = "<c-n>"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
""let g:SuperTabNoCompleteBefore =[]
"" let g:SuperTabNoCompleteAfter = ['^', ',']
""let g:SuperTabClosePreviewOnPopupClose = 1
" let g:SuperTabMappingForward = '<c-space>'
"let g:SuperTabMappingBackward = '<Up>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
let g:SuperTabDefaultCompletionType = 'context'
set cot=menu,longest,noselect

autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif

let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery =
      \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

"""""""""""""""""""""""
"     Goyo setup      "
"""""""""""""""""""""""
"" Auto save function
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  "" Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$'))  'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>gnoyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

function! s:goyo_line()
  set showmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_left()
  set noshowmode
  set showcmd
  set scrolloff=3
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_line()
autocmd! User GoyoLeave nested call <SID>goyo_left()

noremap <leader>gy :Goyo<cr>

""----------- " Statusline & colorscheme " -----------

let g:currentmode={
      \ 'n'      : 'NORMAL',
      \ 'v'      : 'VISUAL',
      \ 'V'      : 'V·Line',
      \ '\^V'    : 'V·Block',
      \ 'i'      : 'INSERT',
      \ 'R'      : 'REPLACE',
      \ 'Rv'     : 'V·Replace',
      \ 's'      : 'SELECT',
      \ 'S'      : 'S·LINE',
      \ '\<C-S>' : 'S·Block',
      \ 'c'      : 'Command',
      \ 'r'      : 'REPLACE',
      \ 'rm'     : 'More',
      \ 'r?'     : 'Confirm',
      \ '!'      : 'Shell',
      \ 't'      : 'TERMINAL'
      \}

function! GitInfo()
  let git = fugitive#head()
    if git != ''
  return ''.fugitive#head()
    else
  return ''
endfunction

set ls=2
set stl=
set stl+=%4*[%n]

set stl+=%1*

"" Show current mode
set stl+=%{toupper(g:currentmode[mode()])}
set stl+=%{&spell?'[SPELL]':''}
set stl+=%#WarningMsg#
set stl+=%{&paste?'[PASTE]':''}
set stl+=%2*

"" File name, as typed
set stl+=\ %<%t
set stl+=%{&modified?'\ [+]':''}
set stl+=%{&readonly?'\ []':''}

"" Git
""set stl+=%{FugitiveStatusline()}
set stl+=\ %{GitInfo()}

"" Truncate line here
set stl+=%<

"" Separation between left and right aligned items
set stl+=%=
set stl+=%{&filetype!=#''?&filetype.'':'none'}
set stl+=%q
"" Encoding & File format
set stl+=%#WarningMsg#
set stl+=%{&fileencoding!='utf-8'?'['.&fileencoding.']':''}

set stl+=%2*

"" Warning about byte order
set stl+=%#WarningMsg#
set stl+=%{&bomb?'[BOM]':''}

"" Location of cursor line & column number
set stl+=%3*[%l/%L]
set stl+=%1*[%2c]
set stl+=%4*%3p%%

"" Warning about trailing spaces.
set stl+=%#WarningMsg#
set stl+=%{StatuslineTabWarning()}

"" Find if they are mixed indentings.
function! StatuslineTabWarning()
  if !exists('b:statusline_tab_warning')
    "" If the file is unmodifiable, do not warn.
    if !&modifiable
      let b:statusline_trailing_space_warning = ''
      return b:statusline_trailing_space_warning
    endif

    let has_leading_tabs = search('^\t\+', 'nw') != 0
    let has_leading_spaces = search('^ \+', 'nw') != 0

    if has_leading_tabs && has_leading_spaces
      let b:statusline_tab_warning = ' [mixed-indenting]'
    elseif has_leading_tabs
      let b:statusline_tab_warning = ' [tabbed-indenting]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif

  return b:statusline_tab_warning
endfunction

set bg=dark
colorscheme gruvbox8_hard
"" colorscheme PerfectDark

"" Always use terminal background
au ColorScheme * hi! Normal ctermbg=none guibg=none
hi Normal guibg=none
hi User2 guifg=italic

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi User1 guifg=#ffffff guibg=#870000
  else
    hi User1 guifg=#1d1d1d guibg=#83a598
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi User1 guifg=#1d1d1d guibg=#83a598
au InsertLeave * hi User3 guifg=#ffffff guibg=#504504

hi User1 guifg=#1d1d1d guibg=#83a598
hi User2 guifg=none    guibg=none
hi User3 guifg=#ffffff guibg=#504504
hi User4 guifg=#1d1d1d guibg=#848484
hi Comment gui=italic

hi Pmenu guibg=#1d1d1d
hi PmenuSel  guibg=#2d2d2d guifg=#d09911 gui=bold
hi PmenuSbar guibg=#444444
hi PmenuThumb guibg=#5d5d5d

"" Set cursor style
" n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
set guicursor=n-v-c:block-nCursor,i-ci-ve:ver10-iCursor,r-cr:hor15-lCursor,o:hor50-Cursor
    \,a:blinkwait700-blinkoff400-blinkon250 " -Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
    \,n:block-blinkon0
    \,v:block-blinkon0

highlight Cursor gui=reverse guifg=NONE guibg=NONE
highlight Cursor gui=NONE guifg=bg guibg=fg

""---------------- "GitGutter" ----------------

highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow

highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
nmap )     <Plug>(GitGutterNextHunk)
nmap (     <Plug>(GitGutterPrevHunk)
nmap <leader>ggt :GitGutterToggle<Cr>
nmap <leader>ggh :GitGutterLineHighlightsToggle<Cr>

let g:gutgutter_enable = 1
let g:gutgutter_map_keys = 0

""------------- "tagbar settings" --------------

map <F3>        :TagbarToggle<CR>
map <leader>tbt :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
" let g:tagbar_autoclose = 1
" let g:tagbar_position =
" let g:tagbar_width = max([24, winwidth(0) / 5])
" let g:tagbar_indent = 0
let g:tagbar_show_data_type = 0
let g:tagbar_show_visibility = -1
let g:tagbar_autoshowtag = 0
let g:no_status_line = 0
let g:tagbar_silent = 0
" let g:tagbar_wrap = 0
let g:tagbar_scrolloff = 4
let g:tagbar_jump_lazy_scroll = 0

"" -------- " easymotion & keybindings" ---------

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789;'
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_add_search_history = 1
let g:EasyMotion_startofline = 0

autocmd User EasyMotionPromptBegin silent! easycompleteDisable
autocmd User EasyMotionPromptEnd   silent! easycompleteEnable

" nmap <leader><leader>f <Plug>(easymotion-overwin-f)
" xmap <leader><leader>f <Plug>(easymotion-bd-f)
" omap <leader><leader>f <Plug>(easymotion-bd-f)
"
" nmap <leader><leader>s <Plug>(easymotion-overwin-f2)
" xmap <leader><leader>s <Plug>(easymotion-bd-f2)
" omap <leader><leader>s <Plug>(easymotion-bd-f2)
"
" nmap <leader><leader>l <Plug>(easymotion-overwin-line)
" xmap <leader><leader>l <Plug>(easymotion-bd-jk)
" omap <leader><leader>l <Plug>(easymotion-bd-jk)
"
" nmap <leader><leader>w <Plug>(easymotion-overwin-w)
" xmap <leader><leader>w <Plug>(easymotion-bd-w)
" omap <leader><leader>w <Plug>(easymotion-bd-w)
" omap z                 <Plug>(easymotion-t)
"
" nmap <leader><leader>; <Plug>(easymotion-next)
" nmap <leader><leader>, <Plug>(easymotion-prev)
"
" map <leader><leader>J  <Plug>(easymotion-sol-j)
" map <leader><leader>K  <Plug>(easymotion-sol-k)
"
" map <leader><leader>w  <Plug>(easymotion-iskeyword-w)
" map <leader><leader>b  <Plug>(easymotion-iskeyword-b)
" nmap s                 <Plug>(easymotion-s2)
" xmap s                 <Plug>(easymotion-s2)
" omap z                 <Plug>(easymotion-s2)
" nmap <leader><leader>n <Plug>(easymotion-sn)
" xmap <leader><leader>n <Plug>(easymotion-sn)
" omap <leader><leader>z <Plug>(easymotion-sn)

"---------------- "you surround"----------------

nmap <leader>` ysiw`
nmap <leader>" ysiw"
nmap <leader>' ysiw'
nmap <leader>( ysiw(
nmap <leader>{ ysiw{
nmap <leader>[ ysiw[
" nmap <leader>< ysiw<

"------------------ "Mappings" ------------------
" AUTOCOMPLETE
" - ^n - autocomplete suggestions (next)
" - ^p - autocomplete suggestions (previous)
" - ^x^f - for filenames
" - ^x^] - tags only

let mapleader = "\<space>"
let maplocalleader = " "

" Delete word with alt-arrows
nnoremap <M-Left> db
"inoremap <M-Left>
nnoremap <M-Right> de
"inoremap <M-Right>

" Fix indentation
map <leader><F7> gg=G<C-o><C-o>

"" These will kepp the next search centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"" Undo breakpoints
inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutes
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Back to normal mode from insert
inoremap jk <esc>
inoremap kj <esc>
inoremap jj <esc>

"" toggle ruler
noremap <silent> <leader>nn :set nornu nonu<CR>
noremap <silent> <leader>sn :set rnu nu<CR>

"open terminal
noremap <leader>to :bot terminal<Cr>
noremap <leader>ot :unev term://zsh<CR>

" open quickfix and list
nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>

"" close popup
tnoremap <Esc> <C-\><C-n>

"" Better tabbing
vnoremap < <gv
vnoremap > >gv

"" Move line / block of text around
xnoremap <silent>K          :m '<-2<CR>gv-gv
xnoremap <silent>J          :m '>+2<CR>gv-gv
inoremap <leader><C-k> <esc>:m .-2<CR>==
inoremap <leader><C-j> <esc>:m .+2<CR>==
nnoremap <leader>k          :m .-2<cr>==
nnoremap <leader>j          :m .+2<cr>==

"" ----------- "Window navigation" -------------

""splits
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

"" ALT+{h,j,k,l} to navigate windows from any mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"" Resize window
nnoremap <leader><M-j> :resize -2<Cr>
nnoremap <leader><M-k> :resize +2<Cr>
nnoremap <leader><M-h> :vertical resize -2<Cr>
nnoremap <leader><M-l> :vertical resize +2<Cr>

"" Change splits: horizontal <—> vertical
map <leader>vh      :<C-w>t<C-w>H
map <leader>hv      :<C-w>t<C-w>K

"" tab navigation mappings
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tm :tabm<CR>
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
noremap  <leader>ts :tab split<CR>
noremap  <leader>hs :<C-u>split<CR>
noremap  <leader>vs :<C-u>vsplit<CR>

"" Buffer nav
nmap     <leader>bp :bp<CR>
nmap     <leader>bn :bn<CR>

" buffers & args "
nmap     <leader>w  :update<CR>
nmap     <leader>up :update<CR>
nmap     <leader>bd :bdelete<CR>
nnoremap <leader>bu :b <C-d>
nnoremap <leader>bb :buffers<CR>:buffer<Space>
nnoremap <Leader>be :edit
nnoremap <Leader>ba :badd
nnoremap <Leader>bw :w<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>

nnoremap <leader>aa :argadd <C-r>=fnameescape(expand('%:p:h'))<CR>/*<C-d>

"" path to the edited file
cnoremap <M-e>   <C-R>=expand("%:p:h") . "/" <CR>
"" expand %% to path in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <expr> * getcmdline() =~ '.*\*\*$' ? '/*' : '*'
cnoreabbr <expr> %% fnameescape(expand('%:p'))

""--------- "Standart Keybindings" ---------

"" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

"" Control-S & W Save
nnoremap W          :up<cr>
vnoremap W     <esc>:up<cr>
inoremap W    W<esc>:up<cr>a
nnoremap <C-S>      :up<cr>
vnoremap <C-S> <esc>:up<cr>
inoremap <C-S> <esc>:up<cr>
"" Save + back into insert
""inoremap <C-S> <esc>:w<cr>a

"" Control-Q exit
noremap  <C-Q>      :q<cr>
vnoremap <C-Q> <esc>:q<cr>
inoremap <C-Q> <esc>:q<cr>

" Control-C Copy in visual mode
""vnoremap <C-c> y
vnoremap <C-c> "+y

"" Control-P Paste in all modes
inoremap <C-p> <esc>pa
cnoremap <C-P> <C-r>0
nnoremap <C-P> "+p
" paste last, not deleted yank
noremap  pp  "0p
noremap  pP  "0P

" Allow for easy copying and pasting
vnoremap y y`]
nnoremap p p`]

" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$

""Visually select text that was last edited/pasted
noremap gV `[v`]

""highlight search off
nnoremap <silent><leader><esc> :noh<cr><esc>

"" Keep flags when repeating substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"" easy caps
inoremap <M-u> <ESC>viwUi
nnoremap <M-u> viwU<ESC>

"" Check file in shellcheck
""nmap <leader>s :!clear && shellcheck %<CR>

"" quick edit init.vim & .zshrc
nnoremap <silent><leader>ini :tabe ~/.config/nvim/init.vim<cr>
nnoremap <silent><leader>zsh :tabe ~/.zshrc<cr>
nnoremap <silent><leader>so  :so ~/.config/nvim/init.vim<cr>:echo 'sourced'<cr>
nnoremap <silent><leader>sz  :so ~/.zshrc<cr>:echo 'shell sourced'<cr>

"" shortcut for creating shebang
inoremap <leader>she #!/data/data/com.termux/files/usr/bin

"" Git 'vim.fugitive'
noremap <leader>ga  :Gwrite<CR>
noremap <leader>gc  :Git commit --verbose<CR>
noremap <leader>gsh :Gpush<CR>

noremap <leader>gll :Gpull<CR>
noremap <leader>gs  :Gstatus<CR>
noremap <leader>gb  :Gblame<CR>
noremap <leader>gd  :Gvdiff<CR>
noremap <leader>gr  :Gremove<CR>

"" netrw
nnoremap <leader>nt :wincmd v<bar> : Ex <bar> :vertical resize 25<CR>
nnoremap <silent> - :e %:h<CR>

"" tpopes vim.repeat
silent! call repeat#set("\<Plug>preservim/nerdcommenter", v:count)
silent! call repeat#set("\<Plug>easymotion/easymotion", v:count)
silent! call repeat#set("\<Plug>jiangmiao/auto-pairs", v:count)

""----------------- "FZF-BASE" -------------------

""set rtp+=$PREFIX/bin/fzf
set rtp+=~/.fzf

"" FZF command prefix
""let g:fzf_command_prefix = 'Fzf'

""FzfFiles
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"" Search including hidden files
command! -bang -nargs=? -complete=dir HFiles
      \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)

"" Search in custom directories
command! -bang ZshFiles call fzf#vim#files('~/.zsh', fzf#vim#with_preview(), <bang>0)

command! -bang DotFiles call fzf#vim#files('~/.config', fzf#vim#with_preview(), <bang>0)

command! -bang Home call fzf#vim#files('$HOME', fzf#vim#with_preview(), <bang>0)

"" Fzf LS
command! Ls call fzf#run(fzf#wrap({'source': 'exa -a --color=always'}), fzf#vim#with_preview())

command! -bang -complete=dir -nargs=? Lsa
      \ call fzf#run(fzf#wrap({'source': 'ls -a --color=always', 'dir': <q-args>}, <bang>0))

command! -bang -complete=dir -nargs=? LS
      \ call fzf#run(fzf#wrap('exa -a', {'source': 'exa -a --color=always', 'dir': <q-args>}, <bang>0))

"" RipGrep integration
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

"" GGrep
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number -- '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"" Advanced ripgrep (RG)
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" ripgrep (Find)
" if executable('rg')
" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
" set grepprg=rg\ --vimgrep
command! -bang -nargs=* Find call fzf#vim#grep('rg --files --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" endif

" FZF settings

let g:fzf_layout = { 'down': '60%' }

let g:fzf_preview_window = ['right:50%:hidden', 'alt--']

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"[[B]Commits] Customize the options used by 'git log'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" Expect expression for direct command execution
let g:fzf_commands_expect = 'S-enter'

let g:fzf_layout = { 'down': '60%' }

" fzf-history
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:ackprg = 'ag --nobreak --nonumbers --noheading . | fzf --keep=right'

" Split-term
let g:split_term_vertical = 1
let g:split_term_horizontal = 1

" See `man fzf-tmux` for available options
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
endif

"--------------- " FZF-MAPPINGS "---------------

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <leader><tab> <plug>(fzf-maps-i)

" full screen fzf
nnoremap <leader>fe  :FZF! -m<CR>
nnoremap <C-f>       :RG!<Space>
nnoremap <M-t>       :Files!<Cr>
nnoremap <M-c>       :LS!<Cr>
nnoremap <A-a>       :Ag!<CR>
nnoremap <leader>fz  :FZF! ../<CR>
nmap     <leader>cm  :Commands!<CR>
nmap     <leader>map :Maps!<CR>
nmap     <leader>co  :Colors!<CR>
nmap     <leader>ht  :Helptags!<CR>
"" FZF keybindings
noremap  <leader>fi  :Find<CR>
nmap     <leader>lsa :Lsa<CR>
nmap     <leader>ls  :Ls<CR>
nmap     <leader>fls :LS<CR>
nmap     <leader>fr  :RG<CR>
nmap     <leader>rg  :Rg<CR>
noremap  <leader>ff  :Files<CR>
nnoremap <leader>hh  :HFiles<CR>
nmap     <leader>fl  :Lines<space>
nmap     <leader>bl  :Blines<space>
nmap     <leader>bt  :BTags<CR>
nmap     <leader>ft  :Tags<CR>
nmap     <leader>ht  :Helptags<CR>
nmap     <leader>fc  :Commits<CR>
nmap     <leader>fg  :GFiles?<CR>
nmap     <leader>gf  :GFiles<CR>
nmap     <leader>fw  :Windows<CR>
nmap     <leader>fb  :Buffers<CR>
nmap     <leader>lo  :Locate<space>
xmap     <leader>fs  :Snippets<CR>
nnoremap <leader>fm  :Marks<CR>
nnoremap <leader>ag  :Ag<CR>
nmap     <leader>gg  :GGrep<CR>
nnoremap <leader>hf  <Cmd>Files $HOME<CR>
" Recover commands from history through FZF
nmap     <leader>ch  :History:<CR>
nmap     <leader>sh  :History/<CR>
nmap     <leader>fh  :History <CR>
" Search custom files
nnoremap <leader>zf  :ZshFiles<CR>
nnoremap <leader>df  :DotFiles<CR>
nnoremap <leader>ho  :Home<CR>

" Insert mode completion
imap <c-x><c-w>    <plug>(fzf-complete-word)
imap <c-x><c-p>    <plug>(fzf-complete-path)
imap <c-x><c-l>    <plug>(fzf-complete-line)

" Path completion with custom source command
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('fd -H -t f')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" <Plug>(-fzf-complete-trigger)
" <Plug>(fzf-complete-file)
map <silent><leader>cf  <Plug>(fzf-complete-file-ag)
" <Plug>(fzf-complete-line)
map <silent> <leader>/  <Plug>(fzf-complete-path)

" fzf-vim-actions functions colors & statusline
" Global line completion not just open buffers.
inoremap <expr> <c-x><c-x> fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': 'rg -n ^ --color always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

"Reducer example
function! s:make_sentence(lines)
  return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-e' : 'edit',
      \ 'alt-q'  : function('s:build_quickfix_list'),
      \ 'ctrl-n' : 'tab new',
      \ 'ctrl-t' : 'tab split',
      \ 'ctrl-s' : 'split',
      \ 'ctrl-v' : 'vsplit' }

"" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':       ['fg', 'Normal'],
      \ 'bg':         ['bg', 'Normal'],
      \ 'hl':         ['fg', 'Comment'],
      \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':        ['fg', 'Statement'],
      \ 'preview-bg': ['bg', 'Comment'],
      \ 'info':       ['fg', 'PreProc'],
      \ 'border':     ['fg', 'Ignore'],
      \ 'prompt':     ['fg', 'Conditional'],
      \ 'pointer':    ['fg', 'Ignore'],
      \ 'marker':     ['fg', 'Keyword'],
      \ 'spinner':    ['fg', 'Label'],
      \ 'header':     ['fg', 'Exception'] }

" custom Statusline
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=160 ctermbg=none
  highlight fzf2 ctermfg=23 ctermbg=none
  highlight fzf3 ctermfg=242 ctermbg=250
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

"" Hide Statusline
autocmd! FileType fzf set ls=0 nosmd noru
      \| autocmd BufLeave <buffer> set ls=2 nosmd noru

""--------------- "NerdCommenter" ---------------

"" Create default mappings
let g:NERDCreateDefaultMappings = 0
map <leader>cc       <plug>NERDCommenterComment
map <leader>c<space> <plug>NERDCommenterToggle
map <leader>cy       <plug>NERDCommenterYank
map <leader>ci       <plug>NERDCommenterInvert
map <leader>cu       <plug>NERDCommenterUncomment

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines are commented or not
let g:NERDToggleCheckAllLines = 1

let g:NERDRemoveExtraSpaces = 1

" source ~/.config/nvim/general/statusline2.vim
