""""""""""""""""""""""
"  General Settings  "
""""""""""""""""""""""
filetype on
filetype plugin on
filetype plugin indent on
syntax enable

set shell=$PREFIX/bin/zsh
""set shell=$SHELL
set backspace=indent,eol,start
set hid
set pumheight=10
set path+=**
""set tabstop=5 softtabstop=4 shiftwidth=4
set expandtab smarttab
set ai si
set inc ic scs hls
set nuw=1
set viminfo+=n$HOME/.config/nvim/viminfo
set completeopt=menuone,noinsert,longest,noselect
set complete+=k,kspell complete-=w complete-=b complete-=u complete-=t
set omnifunc=syntaxcomplete#Complete
set tags+=~/.config/nvim/systags
set history=1000
set clipboard+=unnamedplus
""set clipboard=unnamed,unnamedplus
set showcmd nosmd
set cmdheight=2
set updatetime=300
set so=6
set t_Co=256
set termguicolors

"" Encoding & formating
"" set encoding=utf-8
"" set fileencoding=utf-8
set fileencodings=utf-8,latin1
set ttyfast
set textwidth=54
set fileformats=unix
set iskeyword+=_,$,@,%,#,-	"not to split word"
set fo=tql
" t - autowrap to textwidth
" q - allow formatting of comments with :gq
" l - don't format already long lines

set spl=en_us,de_de

set confirm
set shortmess+=c
set wrap
""set diff
set sm
""set wildmode=list,full
set wim=list:longest,list:full
set wmnu
" Disable output, vcs, archive, rails, temp and backup
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,.cfg.git,*.pyc

set mouse=a
set sb spr
set magic

"" Timeout
"" cmd timeout
set noto
"set timeoutlen 1000
"set ttimeoutlen 1000

set noswapfile nobackup undofile title
set undolevels=1000
set undoreload=1000

" Don't save options in sessions and views
set sessionoptions-=options
set viewoptions-=options

" Set mapleader to space by default, early so all mappings by plugins are set
if !exists("mapleader")
  let mapleader = "\<Space>"
endif

" Enable default theme if some other is not set
if !exists("g:colors_name")
  colorscheme default
endif

" Allow for up to 10 opened tabs on Vim start.
if &tabpagemax < 10
  set tabpagemax=10
endif

" Disable strange Vi defaults.
set nocp

"" Auto read file if it was changed elsewhere
set autoread

" Auto reload if file was changed somewhere else (autoread)
au CursorHold * checktime

" Merge signcolumn with number line (if supported)
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Wrap lines by default
" set wrap linebreak
" set showbreak=" "

" Disable any annoying beeps on errors.
set noeb
set visualbell

" Don't parse modelines (google "vim modeline vulnerability").
set nomodeline

" Do not fold by default. But if, do it up to 3 level
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set conceallevel=2

"" --------- performance tweaks ---------

set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=8000
set synmaxcol=500

"" ------ disable/enable builtin plugins ------

"" netrw
" let loaded_netrw = 2
let g:netrw_liststyle=3

" sql omni completion
" let g:omni_sql_no_default_maps = 0

"" disable/enable providers
" let g:loaded_python_provider = 0
"" let g:loaded_python3_provider = 0
" let g:loaded_perl_provider = 0
" let g:loaded_ruby_provider = 0
" let g:loaded_node_provider = 0

"" set python2
let g:python2_host_prog = expand('$PREFIX/bin/python2')
"" set python3
let g:python3_host_prog = expand('$PREFIX/bin/python3')

" For tests
set debug=msg
set verbose

"" Tmux clipboard integration
" let g:clipboard = {
    " \   'name': 'myClipboard',
    " \   'copy': {
    " \      '+': ['tmux', 'load-buffer', '-'],
    " \      '*': ['tmux', 'load-buffer', '-'],
    " \    },
    " \   'paste': {
    " \      '+': ['tmux', 'save-buffer', '-'],
    " \      '*': ['tmux', 'save-buffer', '-'],
    " \   },
    " \   'cache_enabled': 1,
    " \ }
