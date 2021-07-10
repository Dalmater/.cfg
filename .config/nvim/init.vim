""""""""""""""""""""""
"  General Settings  "
""""""""""""""""""""""
filetype plugin indent on
syntax on
set shell=$SHELL
set backspace=indent,eol,start
set hidden
set path+=**
set colorcolumn=
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
set autoindent smartindent
set incsearch ignorecase smartcase nohlsearch
set numberwidth=1 relativenumber nu title
set viminfo+=n$HOME/.config/nvim/viminfo
set completeopt=menuone,noinsert,longest,noselect
set omnifunc=syntaxcomplete#Complete
set noswapfile nobackup undofile
set history=1000
set clipboard+=unnamedplus
set clipboard=unnamed
set showcmd noshowmode
set complete+=k,kspell complete-=w complete-=b complete-=u complete-=t complete-=v complete-=f
set updatetime=300
set scrolloff=8
set termguicolors
set encoding=UTF-8
set spelllang=en_us,de_de
"" set spell
set confirm
set noerrorbells
set shortmess+=c
set wrap
set showmatch
set wildmode=list,full
set wildmenu
set nocursorline
set nocompatible
set mouse=a
set splitbelow splitright
set exrc
set cmdheight=2
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

""""""""""""""""""""""
"      PLUGINS       "
""""""""""""""""""""""
""auto installation of vim-plug if not installed

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

""plugins here, coc for example
""Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }
""Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
""Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
""Plug 'mhinz/vim-signify'
""let g:signify_sign_show_count = 0
""Plug 'ervandew/supertab'
"" clean window
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

"" Syntax Highlight & Colorscheme
""Plug 'sheerun/vim-polyglot'
Plug 'gisphm/vim-polyglot-min'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'chriskempson/base16-vim'

"" Vim Wiki setup
Plug 'vimwiki/vimwiki'

""if executable('node')
""  Plug 'suan/vim-instant-markdown', {'do': 'npm -g install instant-markdown-d' }
""endif

let g:vimwiki_list=[{'path': '~/.wiki', 'syntax': 'markdown', 'ext': '.md'}]

"" vimwiki with markdown support
""let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

""if executable('node')
""  let g:instant_markdown_slow = 1
""  let g:instant_markdown_autostart = 0
""  map <leader>md :InstantMarkdownPreview<CR>
""endif
call plug#end()

""------------------ Settings -------------------

"""""""""""""""""""""""""""""""""
"         Color Scheme          "
"""""""""""""""""""""""""""""""""
colorscheme base16-3024

highlight Normal guibg=none

set background=dark

"" Access colors present in 256 colorspace
let base16colorspace=256

""""""""""""""""""""""""""
"    Default behaviour   "
""""""""""""""""""""""""""
" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" Automatically deletes all trailing whitespaces and newlines at end of file on save.

au BufWritePre * %s/\s\+$//e
au BufWritePre * %s/\n\+\%$//e
au BufWritePre *.[ch] %s/\%$/\r/e

"""""""""""""""""""""""""""
"   Auto complete Menu    "
"""""""""""""""""""""""""""
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
set omnifunc=javascriptcomplete#CompleteJS

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"""""""""""""""""""""""""""
"    Coc Configuration    "
"""""""""""""""""""""""""""
"" Install Extentions
let g:coc_global_extensions = [
\       'coc-json',
\       'coc-pyright',
\       'coc-snippets',
\       'coc-tsserver',
\       'coc-sh',
\       'coc-markdownlint'
\ ]

"" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

""""""""""""""""
"    netrw     "
""""""""""""""""
"" Tweaks for browsing files
let g:netrw_banner=0        "" disable annoying banner
let g:netrw_browse_split=4  "" open in prior window
let g:netrw_altv=1          "" open splits to the right
let g:netrw_liststyle=3     "" tree view
let g:netrw_winsize = 20
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

""""""""""""""""
"  Statusline  "
""""""""""""""""
highlight Comment gui=italic

let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ ' '  : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'REPLACE ',
       \ 'Rv' : 'V·Replace ',
       \ 's'  : 'SELECT ',
       \ 'S'  : 'S-LINE ',
       \ 'c'  : 'Command ',
       \ 't'  : 'TERMINAL '
       \}

set laststatus=2
set statusline=
set statusline+=%4*
set statusline+=[%n]
set statusline+=%1*

"" Show current mode
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%{&spell?'[SPELL]':''}
set statusline+=%#WarningMsg#
set statusline+=%{&paste?'[PASTE]':''}
set statusline+=%2*

"" File path, as typed or relative to current directory
set statusline+=\ %F
set statusline+=%{&modified?'\ [+]':''}
set statusline+=%{&readonly?'\ []':''}

"" Truncate line here
set statusline+=%<

"" Separation between left and right aligned items
set statusline+=%=
set statusline+=%{&filetype!=#''?&filetype.'\ ':'none\ '}

"" Encoding & File format
set statusline+=%#WarningMsg#
set statusline+=%{&fileencoding!='utf-8'?'['.&fileencoding.']':''}

set statusline+=%2*

"" Warning about byte order
set statusline+=%#WarningMsg#
set statusline+=%{&bomb?'[BOM]':''}
set statusline+=%3*

"" Location of cursor line
set statusline+=[%l/%L]
set statusline+=%1*

"" Column number
set statusline+=\ col:%2c

"" Warning about trailing spaces.
set statusline+=%#WarningMsg#
set statusline+=%{StatuslineTabWarning()}

"" Find if they are mixed indentings.
function! StatuslineTabWarning()
    if !exists('b:statusline_tab_warning')
        "" If the file is unmodifiable, do not warn this.
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

hi user1 guifg=#1d1d1d guibg=#8ec07c
hi user2 guifg=#ffffff guibg=#3c3836
hi user3 guifg=#ffffff guibg=#504945
hi user4 guifg=#ffffff guibg=#282828

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi User1 guifg=#ffffff guibg=#870000
    elseif a:mode == 'v'
      hi User1 guibg=#8ec07c
    else
    hi User1 guifg=#1d1d1d guibg=#83a598
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi User1 guifg=#1d1d1d guibg=#83a598

"""""""""""""""""""""""
"     Goyo setup
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
    set showcmd
    set scrolloff=999
endfunction

function! s:goyo_left()
    set noshowmode
    set noshowcmd
    set scrolloff=8
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_line()
autocmd! User GoyoLeave nested call <SID>goyo_left()

noremap <leader>g :Goyo<cr>

""""""""""""""""""
"  GitGutter    "
""""""""""""""""""
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow

highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gutgutter_enable = 1
let g:gutgutter_map_keys =0

""----------------- Mappings -----------------
"" AUTOCOMPLETE
" - ^n - autocomplete suggestions (next)
" - ^p - autocomplete suggestions (previous)
" - ^x^f - for filenames
" - ^x^] - tags only

let mapleader = "|"

inoremap jk <ESC>
nnoremap Q <Nop>
nmap <leader>w :update<CR>
nmap <leader>q :bdelete<CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>

map <C-n>n :set nornu nonu<CR>
map <C-n>  :set rnu nu<CR>

"" Better Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" Move selected line / block of text in visual mode
xmap K :move '<-2<CR>gv-gv
xmap J :move '>+1<CR>gv-gv

"" Check file in shellcheck
nmap <leader>s :!clear && shellcheck %<CR>

"" CURSOR MAPPINGS & SPLITS

    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait600-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

"" toggle ruler
"" toggle cursor line
    nnoremap <leader>i :set cursorline!<cr>

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

""""""""""""""""
"" Keybindings
""""""""""""""""
"" Control-S Save
noremap <C-S> :w<cr>
vnoremap <C-S> <esc>:w<cr>
inoremap <C-S> <esc>:w<cr>
"" Save + back into insert
""inoremap <C-S> <esc>:w<cr>a

"" Control-Q exit
noremap <C-Q> :q<cr>
vnoremap <C-Q> <esc>:q<cr>
inoremap <C-Q> <esc>:q<cr>  " force exit

" Control-C Copy in visual mode
vnoremap <C-C> y

"" Control-V Paste in insert and command mode
""inoremap <C-V> <esc>pa
""cnoremap <C-V> <C-r>0

"" Highlight search disapeared
nnoremap <silent><esc> :noh<cr><esc>

"" Back to normal mode from insert
inoremap jk <esc>
inoremap JK <esc>

"" quick edit init.vim
nnoremap <silent><leader>init :tabe ~/.config/nvim/init.vim<cr>
nnoremap <silent><leader>so :so ~/.config/nvim/init.vim<cr>:echo 'sourced'<cr>

"" shortcut for creating shebang
inoremap <leader>she #!/data/data/com.termux/files/usr/bin

"" fzf integration
set rtp+=$PREFIX/bin/fzf
set rtp+=~/.fzf

let g:fzf_layout = { 'down': '70%' }

""FzfFiles
""command! -bang -nargs=? -complete=dir Files
""    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"" Fzf LS
command! LS call fzf#run(fzf#wrap({'source': 'ls'}))

command! -bang -complete=dir -nargs=? LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))

let g:fzf_preview_window = ['up:50%:hidden', 'alt--']

"" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

"" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

"" RipGrep integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

"" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
map <M-t> :Files<CR>
map <C-f> :Rg<CR>
map <M-c> :LS<CR>
nnoremap <M-t> :Files<Cr>

"" full screen
noremap <M-f>f :RG!<Cr>
map <M-t>t :Files!<Cr>
map <M-c>c :LS!<Cr>

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

"" Word completion with custom spec with pop up layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" Replace the default dictionary completion with fzf-based fuzzy completion
"inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

nmap <F-6> :setlocal spell! spelllang=en-en<Cr>

"" set default cursor when leaving nvim
autocmd VimLeave * set guicursor=a:ver25-blinkon25
