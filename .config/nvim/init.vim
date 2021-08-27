" Set mapleader to space by default, early so all mappings by plugins are set
if !exists("mapleader")
    let mapleader = "\<Space>"
endif

set exrc

""---------------- " Plugins "-----------------

" Install vim-plug if not found
" if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
"   silent execute !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

filetype on
filetype plugin on
filetype plugin indent on
syntax enable

let g:polyglot_disabled = ['sensible', 'markdown']
let g:vim_markdown_frontmatter = 1

" call plug#begin('~/.config/nvim/plugged')
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'
" Syntax Highlight & Colorscheme
Plug 'lifepillar/vim-gruvbox8'
" Plug 'sheerun/vim-polyglot'
Plug 'gisphm/vim-polyglot-min'
" Covinience
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/visualrepeat'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease', {'for': 'vim'}
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
  " let g:AutoPairsFlyMode = 1
  " let g:AutoPairs['<']='>'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  nmap <leader>u <Cmd>UndotreeToggle<CR>
  let g:undotree_WindowLayout    = 2
  let g:undotree_ShortIndicators = 1
  let g:undotree_HelpLine        = 0
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle', 'for': 'git' }
Plug 'tpope/vim-rhubarb', {'on': 'GBrowse' }
" Better autocompletion
Plug 'jayli/vim-easycomplete'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'norcalli/snippets.nvim'
" Plug 'nvim-lua/completion-nvim'
" Neovim LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'
" Extras
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-obsession'
" Plug 'craigemery/vim-autotag'
" let g:autotagCtagsCmd=
" let g:autotagTagsFile=
" Plug 'junegunn/vim-peekaboo'
Plug 'Chiel92/vim-autoformat'
  noremap <F9>       :Autoformat<CR>
  noremap <leader>af :Autoformat<CR>
Plug 'godlygeek/tabular' ", {'on': 'Tabularize'}
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  let g:vim_markdown_folding_disabled = 1
" Plug 'tpope/vim-markdown', {'for': 'markdown'}
" Plug 'vim-utils/vim-man'
"   noremap  <leader>m <Plug>(Man)
Plug 'justinmk/vim-sneak'
" Plug 'easymotion/vim-easymotion'
Plug 'romainl/vim-cool'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'skammer/vim-css-color'
  " let g:cssColorVimDoNotMessMyUpdatetime = 1
" statusline
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

if exists('$TMUX')
  Plug 'edkolev/tmuxline.vim'
endif

call plug#end()

" let g:tmuxline_preset = 'minimal'
let g:CoolTotalMatches = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_new_list_item_indent = 2

"-------------- "Configurations" --------------

source ~/.config/nvim/settings/settings.vim
source ~/.config/nvim/settings/lightline.vim
" source ~/.config/nvim/settings/mystatusline.vim

set bg=dark
colorscheme gruvbox8
hi Visual gui=reverse guifg=NONE guibg=NONE

lua require'colorizer'.setup()

"" Always use terminal background
" au ColorScheme * hi! Normal ctermbg=none guibg=none
hi Normal guibg=NONE

" popup menu
hi Pmenu guibg=#1a1a1a
hi PmenuSel guifg=#1a1a1a
" hi PmenuSbar guibg=#444444
" hi PmenuThumb guibg=#5d5d5d

" Set cursor style
" n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
set guicursor=n-v:block-Cursor,i-c-ci-ve:ver25-iCursor,r-cr:hor20-lCursor,o:hor50-nCursor
      \,a:blinkwait600-blinkoff400-blinkon250
      \,sm:block-blinkwait175-blinkoff150-blinkon175
      \,o:blinkon0

let g:optionprefix_improved_warnings = 1
" let g:gruvbox_plugin_hi_groups = 1

let g:awk_is_gawk = 1

" if executable('rg')
"   let g:rg_derive_root='true'
" endif

let g:sneak#s_next = 1

" Delete trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * %s/\n\+\%$//e
" autocmd BufWritePre *.[ch] %s/\%$/\r/e

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e
map <leader>fx :FixWhitespace

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" auto save folds
" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent loadview
" augroup END

" Disable automatic commenting on newline:
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
" nmap <leader>sd :setlocal spell! spelllang=de_de<Cr>
nmap <leader>sp :setlocal invspell<CR>

" Use spell correction and start in insert mode when we're editing commit messages.
if has('autocmd')
  if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  endif
  au BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')
endif

" tmux
if exists('$TMUX')
  let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
endif

" set default cursor when leaving nvim
autocmd! VimLeave * set guicursor=a:ver25-blinkon25

"------- "Auto complete Menu & SuperTab" -------

" set omnifunc=htmlcomplete#CompleteTags
"set omnifunc=csscomplete#CompleteCSS
"set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=syntaxcomplete#Complete

" select completion with right arrow
inoremap <expr> <right> pumvisible() ? "\<C-y>" : "<right>"
"" close insert menu with left arrow
inoremap <expr> <left>  pumvisible() ? "<ESC>a" : "<left>"

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
" let g:easycomplete_scheme="dark" "rider,sharp

"set dictionary=${Your_Dictionary_File}

au User easycomplete_plugin call easycomplete#RegisterSource({
      \ 'name': 'snips',
      \ 'whitelist': ['*'],
      \ 'completor': 'easycomplete#sources#snips#completor',
      \ 'constructor': 'easycomplete#sources#snips#constructor',
      \ })

" ultisnips settings
"let g:UltiSnipsSnippetDirectories=[$HOME.'~/.config/nvim/plugged/ultisnips"]
" set rtp+=~/.config/nvim
let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsSnippetsDir = "~/.config/nvim/custom/Snips"
let g:UltiSnipsSnippetDirectories = ["Snips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-space>"
let g:completion_enable_snippet = 'UltiSnips'
" SuperTab settings
" Set default completion type
let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabContextDefaultCompletionType = "<c-p>"
""let g:SuperTabNoCompleteBefore =[]
let g:SuperTabNoCompleteAfter = ['^', ',']
""let g:SuperTabClosePreviewOnPopupClose = 1
" let g:SuperTabMappingForward = '<Down>'
"let g:SuperTabMappingBackward = '<Up>'
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

"--------------- " Goyo setup " ---------------

"" Auto save function
" function! s:goyo_enter()
"    let b:quitting = 0
"    let b:quitting_bang = 0
"    autocmd QuitPre <buffer> let b:quitting = 1
"    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
"  endfunction

"  function! s:goyo_leave()
"    "" Quit Vim if this is the only remaining buffer
"    if b:quitting && len(filter(range(1, bufnr('$'))  'buflisted(v:val)')) == 1
"      if b:quitting_bang
"        qa!
"      else
"        qa
"      endif
"    endif
"  endfunction

"  autocmd! User GoyoEnter call <SID>gnoyo_enter()
"  autocmd! User GoyoLeave call <SID>goyo_leave()

 func! s:goyo_line()
   set showmode
   set noshowcmd
   set scrolloff=999
 endf

 func! s:goyo_left()
   set noshowmode
   set showcmd
   set scrolloff=3
   hi Normal guibg=none
 endf

 autocmd! User GoyoEnter nested call <SID>goyo_line()
 autocmd! User GoyoLeave nested call <SID>goyo_left()

noremap <leader>gy :Goyo \| set linebreak<cr>

""------------------- "Git" -------------------

let g:gutgutter_enable = 1
let g:gutgutter_map_keys = 0
nmap )    <Plug>(GitGutterNextHunk)
nmap (    <Plug>(GitGutterPrevHunk)
nmap <leader>gt :GitGutterToggle<CR>
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>
nmap ghp  <Plug>(GitGutterPreviewHunk)
nmap ghs  <Plug>(GitGutterStageHunk)
nmap ghu  <Plug>(GitGutterUndoHunk)

"" Git 'vim.fugitive'
" let g:fugitive_no_maps = 1
noremap <leader>gw  :Gwrite<CR>
noremap <leader>gc  :Git commit --verbose<CR>
noremap <leader>gsh :Gpush<CR>
noremap <leader>gp  :Gpull<CR>
noremap <leader>gs  :Gstatus<CR>
noremap <leader>gb  :Gblame<CR>
noremap <leader>gd  :Gvdiff<CR>
noremap <leader>gr  :Gremove<CR>

" ----------------- "EasyAlign" ----------------

" Start EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""------------- "tagbar settings" --------------

" map <F3>       :TagbarToggle<CR>
" map <leader>tb :TagbarToggle<CR>
" " autofocus on tagbar open
" let g:tagbar_autofocus = 1
" " let g:tagbar_width = max([24, winwidth(0) / 5])
" let g:tagbar_indent = 0
" let g:tagbar_show_data_type = 0
" let g:tagbar_show_visibility = -1
" let g:tagbar_autoshowtag = 0
" let g:no_status_line = 0
" let g:tagbar_silent = 0
" " let g:tagbar_wrap = 0
" let g:tagbar_scrolloff = 3
" let g:tagbar_jump_lazy_scroll = 0

"-------- " easymotion & keybindings" ---------

" let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_do_shade = 0
" let g:EasyMotion_smartcase = 1
" let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz,ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'
" let g:EasyMotion_enter_jump_first = 1
" let g:EasyMotion_add_search_history = 1
" let g:EasyMotion_startofline = 0

" autocmd User EasyMotionPromptBegin silent! easycompleteDisable
" autocmd User EasyMotionPromptEnd   silent! easycompleteEnable

" nmap <leader><leader>f <Plug>(easymotion-overwin-f)
" xmap <leader><leader>f <Plug>(easymotion-bd-f)
" omap <leader><leader>f <Plug>(easymotion-bd-f)

" nmap <leader><leader>s <Plug>(easymotion-overwin-f2)
" xmap <leader><leader>s <Plug>(easymotion-bd-f2)
" omap <leader><leader>s <Plug>(easymotion-bd-f2)

" nmap <leader><leader>l <Plug>(easymotion-overwin-line)
" xmap <leader><leader>l <Plug>(easymotion-bd-jk)
" omap <leader><leader>l <Plug>(easymotion-bd-jk)

" nmap <leader><leader>w <Plug>(easymotion-overwin-w)
" xmap <leader><leader>w <Plug>(easymotion-bd-w)
" omap <leader><leader>w <Plug>(easymotion-bd-w)
" omap z                 <Plug>(easymotion-t)

" nmap <leader><leader>; <Plug>(easymotion-next)
" nmap <leader><leader>, <Plug>(easymotion-prev)

" map <leader><leader>J  <Plug>(easymotion-sol-j)
" map <leader><leader>K  <Plug>(easymotion-sol-k)

" map <leader><leader>w  <Plug>(easymotion-iskeyword-w)
" map <leader><leader>b  <Plug>(easymotion-iskeyword-b)
" nmap s                 <Plug>(easymotion-s2)
" xmap s                 <Plug>(easymotion-s2)
" omap z                 <Plug>(easymotion-s2)
" nmap <leader><leader>n <Plug>(easymotion-sn)
" xmap <leader><leader>n <Plug>(easymotion-sn)
" omap <leader><leader>z <Plug>(easymotion-sn)

"---------------- "you surround"----------------

" map <leader>` ysiw`
map <leader>" ysiw"
map <leader>' ysiw'
map <leader>( ysiw(
map <leader>{ ysiw{
map <leader>[ ysiw[
" nmap <leader>< ysiw<

"------------------ "Mappings" ------------------
" AUTOCOMPLETE
" - ^n - autocomplete suggestions (next)
" - ^p - autocomplete suggestions (previous)
" - ^x^f - for filenames
" - ^x^] - tags only

" let mapleader = "\<space>"

" Delete word with alt-arrows
noremap <M-Left> db
"inoremap <M-Left>
noremap <M-Right> de
"inoremap <M-Right>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" These will kepp the next search centered
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

" diff since last save
nnoremap <leader>d :w !diff % -<CR>

" ctag goto definition/declaration
nnoremap <Leader><C-]> <C-w><C-]><C-w>T
nmap <Leader>tg :!ctags --extras=+f -R *<CR>
nmap <Leader>st g]
nmap <Leader>ta g<C-]>
" nmap <Leader>T   <C-t>

" toggle ruler
noremap <silent> <leader>nn :set nornu nonu<CR>
noremap <silent> <leader>sn :set rnu nu<CR>

"open terminal
noremap <leader>to :bot terminal<CR>

" open quickfix and list
noremap <silent> <leader>oq  :copen<CR>
noremap <silent> <leader>ol  :lopen<CR>

"" close popup
tnoremap <ESC> <C-\><C-n>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move line / block of text around
xnoremap <silent>K                  :m '<-2<CR>gv-gv
xnoremap <silent>J                  :m '>+1<CR>gv-gv
inoremap <silent><leader><C-k> <ESC>:m .-2<CR>==
inoremap <silent><leader><C-j> <ESC>:m .+1<CR>==
nnoremap <silent><leader>k          :m .-2<CR>==
nnoremap <silent><leader>j          :m .+1<CR>==

" ----------- "Window navigation" -------------

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

"" ALT+{h,j,k,l} to navigate windows from any mode
" tnoremap <M-h> <C-\><C-N><C-w>h
" tnoremap <M-j> <C-\><C-N><C-w>j
" tnoremap <M-k> <C-\><C-N><C-w>k
" tnoremap <M-l> <C-\><C-N><C-w>l
" inoremap <M-h> <C-\><C-N><C-w>h
" inoremap <M-j> <C-\><C-N><C-w>j
" inoremap <M-k> <C-\><C-N><C-w>k
" inoremap <M-l> <C-\><C-N><C-w>l
" nnoremap <M-h> <C-w>h
" nnoremap <M-j> <C-w>j
" nnoremap <M-k> <C-w>k
" nnoremap <M-l> <C-w>l

"" Resize window
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>

"" Change splits: horizontal <—> vertical
noremap <silent> <leader>vh  <C-w>t<C-w>H
noremap <silent> <leader>hv  <C-w>t<C-w>K

"" Tab navigation mappings
nnoremap   <Tab> gt
nnoremap <S-Tab> gT
noremap <silent> <leader>tn :tabn<CR>
noremap <silent> <leader>tp :tabp<CR>
noremap <silent> <leader>tm :tabm<CR>
noremap <silent> <leader>tt :tabnew<CR>
noremap <silent> <leader>tc :tabclose<CR>
noremap <silent> <leader>ts :tab split<CR>
noremap <silent> <leader>hs :<C-u>split<CR>
noremap <silent> <leader>vs :<C-u>vsplit<CR>

"" Buffer nav
nmap    <silent> <leader>bp :bp<CR>
nmap    <silent> <leader>bn :bn<CR>

" buffers & args "
nmap    <silent> <leader>w  :update<CR>
nmap    <silent> <leader>bd :bdelete<CR>
nmap    <silent> <leader>bu :Buffer <C-d>
nmap    <silent> <leader>bb :buffers<CR>:buffer<SPACE>
nmap    <silent> <Leader>be :edit<SPACE>
nmap    <silent> <Leader>ba :badd
nmap    <silent> <Leader>bw :w<CR>
nmap    <silent> <Leader>bn :bnext<CR>
nmap    <silent> <Leader>bp :bprevious<CR>

" nnoremap <leader>aa :argadd <C-r>=fnameescape(expand('%:p:h'))<CR>/*<C-d>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e  :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled in
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" path to the edited file
cnoremap <M-e>   <C-R>=expand("%:p:h") . "/" <CR>

"" expand %% to path in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <expr> * getcmdline() =~ '.*\*\*$' ? '/*' : '*'
" cnoreabbr <expr> %% fnameescape(expand('%:p'))

"--------- "Standart Keybindings" ---------

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" Control-S & W Save
nnoremap W          :update<CR>
vnoremap W     <ESC>:update<CR>
inoremap W    W<ESC>:update<CR>a
" nnoremap <C-S>      :up<cr>
" vnoremap <C-S> <esc>:up<cr>
" inoremap <C-S> <esc>:up<cr>
"" Save + back into insert
"inoremap <C-S> <esc>:w<cr>a

"" Control-Q exit
nnoremap <silent> <C-Q>      :q<CR>
vnoremap <silent> <C-Q> <ESC>:q<CR>
inoremap <silent> <C-Q> <ESC>:q<CR>
" Quit all
map <silent> <leader>q  <ESC>:qa<CR>

" -------------- "Copy & paste" --------------

vnoremap <C-c> y
noremap  <C-c> "+y

"" Control-P Paste
" inoremap <C-P> <esc>pa
cnoremap <C-P> <C-r>0
nnoremap <C-P> "+p
" paste last, not deleted yank
noremap  <leader>p "0p
noremap  <leader>P "0P
" noremap <leader>pp "+gp<CR>
noremap  <leader>y "+y<CR>
noremap  <leader>x "+x<CR>

" Allow for easy copying and pasting
vnoremap y y`]
nnoremap p p=`]

" Y yanks from the cursor to EOL. See :help Y.
nnoremap Y y$

""Visually select text that was last edited/pasted
noremap gV `[v`]

""highlight search off
noremap <silent> <leader><Esc> :noh<CR><Esc>

"" Keep flags when repeating substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"" easy caps
inoremap <M-u> <ESC>viwUi
nnoremap <M-u> viwU<ESC>

"" Check file in shellcheck
""nmap <leader>s :!clear && shellcheck %<CR>

"" quick edit & source init.vim & .zshrc
nnoremap <silent> <leader>i  :tabe ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>zs :tabe ~/.zshrc<CR>
nnoremap <silent> <leader>so :so $MYVIMRC<CR>:echo 'Config sourced'<cr>

"" shortcut for creating shebang
inoremap <silent> <leader>sb  #!/data/data/com.termux/files/usr/bin

"" netrw
nnoremap <silent> <leader>nt :wincmd v<bar> : Ex <bar> :vertical resize 25<CR>
nnoremap <silent> - :e %:h<CR>

"" tpopes vim.repeat
silent! call repeat#set("\<Plug>preservim/nerdcommenter", v:count)
silent! call repeat#set("\<Plug>easymotion/easymotion", v:count)
silent! call repeat#set("\<Plug>jiangmiao/auto-pairs", v:count)
silent! call repeat#set("\<Plug>liuchengxu/vim-which-key", v:count)

"---------------- "FZF-BASE" ------------------

"set rtp+=$PREFIX/bin/fzf
set rtp+=~/.fzf

"" FZF command prefix
""let g:fzf_command_prefix = 'Fzf'

""FzfFiles
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"" Search with ag including hidden files
command! -bang -nargs=? -complete=dir HFiles
      \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)

"" Search in custom directories
command! -bang Root call fzf#vim#files('$PREFIX', fzf#vim#with_preview(), <bang>0)

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

"" Advanced ripgrep (RG) only used as selector
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" dotbare command
command! Dots call fzf#run(fzf#wrap({
      \ 'source': 'dotbare ls-files --full-name --directory "${DOTBARE_TREE}" | awk -v home="${DOTBARE_TREE}/" "{print home \$0}"',
      \ 'sink': 'e',
      \ 'options': [ '--keep-right', '--multi', '--preview', 'bat {}', '--preview-window=down:60%' ]
      \ }))

" FZF settings
let g:fzf_layout = { 'down': '60%' }

let g:fzf_preview_window = ['down:55%:hidden', 'alt-t']

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"[[B]Commits] Customize the options used by 'git log'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" Expect expression for direct command execution
let g:fzf_commands_expect = 'C-enter'

" fzf-history
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:ackprg = 'ag --nobreak --nonumbers --noheading . | fzf --keep=right'

" Split-term
let g:split_term_vertical = 1
let g:split_term_horizontal = 1

" See `man fzf-tmux` for available options
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-d60%' }
endif

"--------------- " FZF-MAPPINGS "---------------

" Mapping selecting mappings
nmap <leader><tab>  <Plug>(fzf-maps-n)
xmap <leader><tab>  <Plug>(fzf-maps-x)
omap <leader><tab>  <Plug>(fzf-maps-o)
imap <leader><tab>  <Plug>(fzf-maps-i)

" full screen fzf
noremap  <M-f>       :RG!<Space>
noremap  <M-t>       :Files!<CR>
noremap  <M-c>       :LS!<CR>
noremap  <M-a>       :Ag!<CR>
noremap  <leader>fz  :FZF! -m<CR>
nnoremap <leader>cm  :Commands!<CR>
nnoremap <leader>fM  :Maps!<CR>
nnoremap <leader>co  :Colors!<CR>
nnoremap <leader>ht  :Helptags!<CR>
" FZF keybindings
nnoremap <leader>la  :Lsa<CR>
nnoremap <leader>ls  :Ls<CR>
nnoremap <leader>lS  :LS<CR>
nnoremap <leader>fr  :RG<CR>
nnoremap <leader>r   :Rg<CR>
nnoremap <leader>fd  :Dots<CR>
noremap  <leader>ff  :Files<CR>
nnoremap <leader>hh  :HFiles<CR>
nnoremap <leader>fl  :Lines<Space>
nnoremap <leader>bl  :BLines<Space>
nnoremap <leader>bt  :BTags<CR>
nnoremap <leader>ft  :Tags<CR>
nnoremap <leader>ht  :Helptags<CR>
nnoremap <leader>fc  :Commits<CR>
nnoremap <leader>fg  :GFiles?<CR>
nnoremap <leader>gf  :GFiles<CR>
nnoremap <leader>fw  :Windows<CR>
nnoremap <leader>fb  :Buffers<CR>
nnoremap <leader>lo  :Locate<space>
noremap  <leader>fs  :Snippets<CR>
nnoremap <leader>fm  :Marks<CR>
nnoremap <leader>fa  :Ag<CR>
nnoremap <leader>gg  :GGrep<CR>
" Recover commands from history through FZF
nnoremap <leader>ch  :History:<CR>
nnoremap <leader>sh  :History/<CR>
nnoremap <leader>fh  :History <CR>
" Search root files
nnoremap <leader>fp  :Root<CR>
" 'grep' word under cursor
nnoremap <silent><leader>gw :Rg <C-R>=expand("<cword>")<CR><CR>
" ag is a bit faster and looks better
nnoremap <silent><leader>ga :Ag <C-R>=expand("<cword>")<CR><CR>
" Insert mode completion
inoremap <c-x><c-w>  <Plug>(fzf-complete-word)
inoremap <c-x><c-p>  <Plug>(fzf-complete-path)
" inoremap <c-x><c-l>  <Plug>(fzf-complete-line)

" Path & file completion with custom source command
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('fd -H -t f')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" <Plug>(-fzf-complete-trigger)
" <Plug>(fzf-complete-file)
" <Plug>(fzf-complete-file-ag)

" fzf-vim-actions functions colors & statusline
" Global line completion not just open buffers.
inoremap <expr> <c-x><c-x> fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': 'rg -n ^ --color always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

"" Reducer example
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
      \ 'border':     ['fg', 'Argument'],
      \ 'prompt':     ['fg', 'Title'],
      \ 'pointer':    ['fg', 'Exception'],
      \ 'marker':     ['fg', 'Special'],
      \ 'spinner':    ['fg', 'Label'],
      \ 'header':     ['fg', 'Function'] }

" custom Statusline
" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 ctermfg=160 ctermbg=none
"   highlight fzf2 ctermfg=23 ctermbg=none
"   highlight fzf3 ctermfg=242 ctermbg=250
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction
" autocmd! User FzfStatusLine call <SID>fzf_statusline()

"" Hide Statusline
autocmd! FileType fzf set ls=0 nosmd noru
      \| autocmd BufLeave <buffer> set ls=2 nosmd noru

"----------------- "WhichKey" -----------------

" nnoremap <silent><leader> :WhichKey '<Space>'<CR>
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent><leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" let g:which_key_flatten = 1
let g:which_key_hspace = 2
let g:which_key_timeout = 300
" let g:which_key_fallback_to_native_key = 1
" let g:which_key_centered = 0
let g:which_key_sort_horizontal = 1
let g:which_key_disable_default_offset = 1
let g:which_key_group_dicts = ''
" let g:which_key_floating_opts = { 'row': '+3', 'col': '-3', 'width': '+2', 'hight': '+2' }
let g:which_key_default_group_name = '+next_key'
let g:WhichKeyFormatFunc = function('which_key#format')
let g:which_key_map = {}
" let g:which_key_map = { 'e' : 'which_key_ignore' }
" let g:which_key_map = { '<Esc>' : 'which_key_ignore' }
let g:which_key_map = { '<C-]>' : 'goto definition' }
let g:which_key_map['a'] = { 'name': '+f autoformat' }
let g:which_key_map['b'] = { 'name': '+buffers' }
let g:which_key_map['c'] = { 'name': '+Commands_History +Colors' }
let g:which_key_map['f'] = { 'name': '+FZF' }
let g:which_key_map['g'] = { 'name': '+git +goyo' }
let g:which_key_map['h'] = { 'name': 'hsplit + fzf' }
let g:which_key_map['l'] = { 'name': '+fzf_ls' }
let g:which_key_map['o'] = { 'name': '+(c+l)open' }
let g:which_key_map['s'] = { 'name': '+spell +' }
let g:which_key_map['t'] = { 'name': '+tabs +tags' }
let g:which_key_map['v'] = { 'name': 'vsplit +' }
let g:which_key_map['z'] = { 'name': 'edit zshrc' }
let g:which_key_map['n'] = { 'name': 'which_key_ignore' }
" let g:which_key_map[' '] = { 'name': 'easymotion' }
let g:which_key_map.e = 'which_key_ignore'
let g:which_key_map['<Esc>'] = 'which_key_ignore'
let g:which_key_map['i'] = 'edit init.vim'
let g:which_key_map['.'] = 'set working directory'

" call which_key#register('space', "g:which_key_map")
autocmd! User vim-which-key call which_key#register('<Space>', "g:which_key_map")
