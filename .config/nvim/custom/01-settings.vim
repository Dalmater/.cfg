""""""""""""""""""""""
"  General Settings  "
""""""""""""""""""""""
set shell=$SHELL
set backspace=indent,eol,start
set hid
set shm+=acIt
set pumheight=15
set path=.,/data/data/com.termux/files
" set path+=/data/data/com.termux/files/usr/include
set path+=.,**
set tabstop=2 softtabstop=2 shiftwidth=2
set et smarttab
set ai smartindent
set inc hls
set ignorecase scs
set nuw=1
set viminfo+=n$HOME/.config/nvim/viminfo
set viminfo^=!
set cb+=unnamedplus,unnamed
set showcmd nosmd
set cmdheight=2
set updatetime=300
set guioptions+='d'
" Formating
set encoding=utf-8
" set fileencoding=utf-8
" set fileencodings+=utf-8
set iskeyword+=$,%,#  "not to split word"
set fo+=qlptb
setg fo-=croa
set spl=en_us
let $LANG='en_US'
" set nowrap
" set lbr
" set brk+=_\\\|=~\#\ /\$\~{}\()<>[]""''
set bri
set showbreak=≥
set cpt=.,w,b,u,t,k,kspell ""complete-=w complete-=b complete-=u complete-=t (tags)

" set cpt+=k~/.config/nvim/spell/*
set sm
set wmnu
set cot=menu,longest,preview
" set wildmode=longest,list,full
set wim=longest:full,list:full
" Disable output, vcs, archive, rails, temp
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*.swp,._*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*.pyc
set confirm
set sb spr
set magic
" set textwidth=54
set noswapfile nobackup nowritebackup
set undofile title
set undolevels=1000
set undoreload=10000
set matchpairs+=<:>
set pastetoggle+=<F12>
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
" set mousemodel popup

if !has('gui_running')
  set t_Co=255
" else
"   set t_Co=24
endif
set termguicolors

" if &history < 1000
set history=1000
" endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
" setglobal tags+=~/.config/nvim/systags;

"" Timeout
" set noto
set timeoutlen=1000

" Don't save options in sessions and views
" set sessionoptions=blank,curdir,folds,help,tabpages,winpos
set sessionoptions-=options
set viewoptions-=options

" Allow for up to 20 opened tabs on Vim start.
if &tabpagemax < 20
  set tabpagemax=20
endif

" Disable strange Vi defaults.
" set nocp

" Auto read file if it was changed elsewhere
set autoread

" Auto reload if file was changed somewhere else
au CursorHold * checktime

" Disable automatic commenting on newline:
autocmd FileType * setlocal fo-=cro

" Disable any annoying beeps on errors.
set noeb
set vb

" Don't parse modelines —> vim modeline vulnerability
set nomodeline

"" --------- performance tweaks ---------

" Do not fold by default. But if, do it up to 3 level
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" set nornu nonu
set cursorline
set nocursorcolumn
set so=1
set siso=3
set scrolljump=3
set lazyredraw
set redrawtime=10000
set synmaxcol=250

" Merge signcolumn with number line
set signcolumn=number

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

set debug=msg

"" ----- disable/enable plugins & modules -----

" netrw
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1
let g:netrw_liststyle = 3
let g:netrw_sort_options = "i"
let g:netrw_hide = 0
let g:netrw_usetab = 1
let g:netrw_browsex_viewer = "xdg-open"
let g:netrw_sizestyle="H"
let g:netrw_browse_split=3

" sql omni completion
let g:omni_sql_no_default_maps = 1

"" disable/enable providers
" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1
" let g:loaded_perl_provider = 0
" let g:loaded_ruby_provider = 1
" let g:loaded_node_provider = 1

" set python2
let g:python_host_prog = expand('$PREFIX/bin/python2')

" set python3
let g:python3_host_prog = expand('$PREFIX/bin/python')

" tmux clipboard
if exists('$TMUX')
  let g:clipboard = {
        \ 'name': 'myClipboard',
        \ 'copy': {
          \ '+': ['tmux', 'load-buffer', '-'],
          \ '*': ['tmux', 'load-buffer', '-'],
          \ },
          \ 'paste': {
            \ '+': ['tmux', 'save-buffer', '-'],
            \ '*': ['tmux', 'save-buffer', '-'],
            \ },
            \ 'cache_enabled': 1,
            \ }
endif
