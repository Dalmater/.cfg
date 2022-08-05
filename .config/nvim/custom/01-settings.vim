""""""""""""""""""""""
"  General Settings  "
""""""""""""""""""""""
set shell=$SHELL
" set backspace=indent,eol,start
set hid title
set shm+=cItlF
set is hls "inc
set ignorecase scs
set viminfo=!,'100,<100,s10,h,r/tmp,r/buffers,r/undo,n$HOME/.config/nvim/viminfo
" set shadafile=$HOME/.local/share/nvim/shada/main.shada
set noswapfile nobackup nowritebackup
set undofile
set undolevels=1000
set undoreload=10000
set history=1000
set cb+=unnamedplus,unnamed
set showcmd nosmd
set cmdheight=2
set sb splitright
" set whichwrap=b,s,<,>
set guioptions+='d'
let $LANG='en_US'
set spl=en_us
" Formating
set tabstop=2 softtabstop=2 shiftwidth=2
set et smartindent
set ai smarttab
set encoding=utf-8
set iskeyword+=$  "not to split word
set fo+=qlptbj
set fo-=croa
set matchpairs+=<:>
set sm
set pastetoggle+=<F12>
" set lbr
set bri
" set showbreak=≥
" completions
set pumheight=10
set path+=.,/data/data/com.termux/files,**
" set path+=/data/data/com.termux/files/usr/include
set path+=.,**
set cpt=.,w,b,u,t,k,kspell " complete-=w complete-=b complete-=u complete-=t (tags)
" set cpt+=k~/.config/nvim/spell/*
set wmnu
set cot=menu,longest,preview
set wim=longest:full,list:full
" Disable output, vcs, archive, rails, temp
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*.swp,._*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*.pyc,storage/*/*

" other settings
if executable("ag")
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

" Allow bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

if !has('gui_running')
  set t_Co=255
" else
"   set t_Co=24
endif
set termguicolors

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

"" Times
" set noto
set ttimeoutlen=100
set timeoutlen=800
set updatetime=300

" Allow up to 50 opened tabs on Vim start(nvim default)
" if &tabpagemax < 50
"   set tabpagemax=50
" endif

" Auto read file if it was changed elsewhere
" set autoread

" Auto reload if file was changed somewhere else
au CursorHold * checktime

" Disable automatic commenting on newline:
autocmd FileType * setlocal fo-=cro

" Disable any annoying beeps on errors.
set noeb
set vb

" Don't parse modelines —> vim modeline vulnerability
" set nomodeline

" extras
set mousemodel=popup
set confirm
set magic
set debug=msg
" let verbose=1

"" --------- performance tweaks ---------

" Do not fold by default. But if, do it up to 3 level
set foldmethod=marker
set foldnestmax=3
set nofoldenable

set nocursorline
set nocursorcolumn
set so=1
set siso=5
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=250

" Merge signcolumn with number line
set nuw=1
set signcolumn=number

if has('conceal')
  set conceallevel=2 concealcursor=nc
endif

"" ----- disable/enable plugins & modules -----

" let g:did_load_filetypes = 1
let g:loaded_man = 1
let g:loaded_manPlugin = 1
let g:loaded_matchit = 1
let g:loaded_matchitPlugin = 1
" netrw
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1
let g:netrw_liststyle = 3
let g:netrw_sort_options = "i"
let g:netrw_hide = 0
let g:netrw_sort_by = ""
" let g:netrw_usetab = 1
let g:netrw_browsex_viewer = "xdg-open"
let g:netrw_sizestyle="H"
let g:netrw_browse_split=3
let g:netrw_special_syntax = 1

" sql omni completion
" let g:omni_sql_no_default_maps = 1

"" disable/enable providers
" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1
" let g:loaded_perl_provider = 1
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
