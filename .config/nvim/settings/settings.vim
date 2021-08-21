""""""""""""""""""""""
"  General Settings  "
""""""""""""""""""""""

set shell=$SHELL
set backspace=indent,eol,start
set hid
set shm+=cI
set pumheight=10
set path=.,/data/data/com.termux/files/usr/include
set path+=**
" set tabstop=5 softtabstop=4 shiftwidth=4
set et smarttab
set ai si
set inc ic scs hls
set nuw=1
set viminfo+=n$HOME/.config/nvim/viminfo
set viminfo^=!
set cb+=unnamed,unnamedplus
set showcmd nosmd
set cmdheight=2
set updatetime=300
if !has('gui_running')
  set t_Co=256
endif
set termguicolors
set guioptions+='d'
set ttyfast
" Formating
" set encoding=utf-8
" set fileencoding=utf-8
set iskeyword+=$,%,#,-,_	"not to split word"
set fo=ql
" q - allow formatting of comments with :gq
" l - don't format already long lines
set spl=en_us
let $LANG='en_US'
" set nowrap
set complete+=k,kspell,t complete-=i complete-=w ""complete-=b complete-=u
set sm
set wmnu
set cot=menu,longest,preview,noselect
" set wildmode=longest,list,full
set wim=longest:full,list:full
" Disable output, vcs, archive, rails, temp and backup
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*.pyc
set confirm
set sb spr
set magic
set textwidth=54
set noswapfile nobackup undofile title
set undolevels=1000
set undoreload=1000

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

"" Timeout
" set noto
set timeoutlen=1000

if &history < 1000
    set history=1000
endif

set tags+=~/.config/nvim/systags

if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" Don't save options in sessions and views
set sessionoptions-=options
set viewoptions-=options

" Enable default theme if some other is not set
" if !exists("g:colors_name")
"     colorscheme default
" endif

" Allow for up to 20 opened tabs on Vim start.
if &tabpagemax < 20
    set tabpagemax=20
endif

" Disable strange Vi defaults.
set nocp

" Auto read file if it was changed elsewhere
set autoread

" Auto reload if file was changed somewhere else
au CursorHold * checktime

" Merge signcolumn with number line (if supported)
if has("nvim-0.5.0") || has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

set debug=msg

" Disable any annoying beeps on errors.
set noeb
set vb

" Don't parse modelines —> vim modeline vulnerability
set nomodeline

" Do not fold by default. But if, do it up to 3 level
set foldmethod=indent
set foldnestmax=3
set nofoldenable

"" --------- performance tweaks ---------

" set nornu nonu
set nocursorline
set nocursorcolumn
set so=3
set siso=5
" set scrolljump=3
set lazyredraw
set redrawtime=10000
set synmaxcol=250

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
" let g:loaded_python_provider = 0
" let g:loaded_python3_provider = 0
" let g:loaded_perl_provider = 0
" let g:loaded_ruby_provider = 1
" let g:loaded_node_provider = 0

" set python2
let g:python2_host_prog = expand('$PREFIX/bin/python2')

" set python3
let g:python3_host_prog = expand('$PREFIX/bin/python3')

" disable pair highlighting
let g:loaded_matchit = 0
let g:loaded_matchparen = 0
let g:matchup_motion_enabled = 0
let g:matchup_text_obj_enabled = 0
let g:matchup_delim_noskips = 1
let g:matchup_matchparen_deferred = 1
