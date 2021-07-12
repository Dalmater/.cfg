""""""""""""""""""""""
"  General Settings  "
""""""""""""""""""""""
filetype plugin indent on
syntax on
set shell=$SHELL
set backspace=indent,eol,start
set hidden
set pumheight=10
set iskeyword+=-
set path+=**
""set colorcolumn=
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
""set timeoutlen=400
set scrolloff=8
set termguicolors
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256
set formatoptions-=cro
set background=dark
set spelllang=en_us,de_de
"" set spell
set confirm
set noerrorbells
set shortmess+=c
set wrap
set showmatch
set wildmode=list,full
set wildmenu
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
"" --------- performance tweaks ---------
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1
"" built in plugins
"" disable netrw
let loaded_netrw = 0
""  disable sql omni completion
let g:omni_sql_no_default_maps = 1
"" disable providers
let g:loaded_python_provider = 0

let g:loaded_perl_provider = 0

""let g:loaded_ruby_provider = 0

"" set python3
let g:python3_host_prog = expand('$PREFIX/bin/python3')
