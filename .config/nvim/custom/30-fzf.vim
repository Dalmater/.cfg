"----------------- "FZF-BASE" ------------------

set rtp+=~/.fzf

" FZF settings
let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'down': '60%' }

let g:fzf_preview_window = ['down:60%:hidden', 'alt-t']

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"[[B]Commits] Customize the options used by 'git log'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(cyan)%C(bold)%cr"'

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags --excmd=number -R'

" Expect expression for direct command execution
let g:fzf_commands_expect = 'alt-enter'

"" FZF command prefix
let g:fzf_command_prefix = 'Fzf'

" fzf-history
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:ackprg = 'ag --nobreak --nonumbers --noheading . | fzf --keep=right'

" Split-term
let g:split_term_vertical = 1
let g:split_term_horizontal = 1

" See `man fzf-tmux` for available options
" if exists('$TMUX')
" let g:fzf_layout = { 'tmux': '-p -h 65% -w 80%' }
" let g:fzf_layout = { 'tmux': '-d 60%' }
" endif

""FzfFiles
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"" Search with ag including hidden files
command! -bang -nargs=? -complete=dir HFiles
      \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden -f --ignore .git -g ""', 'sink': 'tabe'}, <bang>0)

"" Search in custom directories
command! -bang Root call fzf#vim#files('$PREFIX', fzf#vim#with_preview(), <bang>0)

command! -bang Home call fzf#vim#files('$HOME', fzf#vim#with_preview(), <bang>0)

"" Fzf LS
command! Ls call fzf#run(fzf#wrap({'source': 'exa -a --color=always', 'sink': 'tabe'}), fzf#vim#with_preview())

command! -bang -complete=dir -nargs=? Lsa
      \ call fzf#run(fzf#wrap({'source': 'ls -a --color=always', 'dir': <q-args>, 'sink': 'tabe'}, <bang>0))

command! -bang -complete=dir -nargs=? LS
      \ call fzf#run(fzf#wrap('exa -a', {'source': 'exa -a --color=always', 'dir': <q-args>, 'sink': 'tabe'}, <bang>0))

"" RipGrep integration
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0),

"" GGrep
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number -- '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"" Advanced ripgrep (RG) only used as selector
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --hidden --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" dotbare command
command! Dotf call fzf#run(fzf#wrap({
      \ 'source': 'dotbare ls-files --full-name --directory "${DOTBARE_TREE}" | awk -v home="${DOTBARE_TREE}/" "{print home \$0}"',
      \ 'sink': 'tabe',
      \ 'options': [ '--keep-right', '-m', '--preview', 'bat {}', '--preview-window=down:60%:border-top' ]
      \ }))
noremap  <silent>     <C-f>d :Dotf<CR>
nnoremap <silent> <leader>fd :Dotf<CR>

"--------------- " FZF-MAPPINGS "----------------

" Mapping selecting mappings
  nmap <silent> <leader><tab>  <Plug>(fzf-maps-n)
  xmap <silent> <leader><tab>  <Plug>(fzf-maps-x)
  omap <silent> <leader><tab>  <Plug>(fzf-maps-o)
  imap <silent> <leader><tab>  <Plug>(fzf-maps-i)

" full screen fzf
  noremap  <silent> <M-r>      :RG!<Space>
  noremap  <silent> <M-t>      :FzfFiles!<CR>
  noremap  <silent> <M-c>      :LS!<CR>
  noremap  <silent> <M-a>      :FzfAg!<CR>
  noremap  <silent> <leader>fz :FZF! ~<CR>
  nnoremap <silent> <leader>cm :FzfCommands!<CR>
  nnoremap <silent> <leader>fM :FzfMaps!<CR>
  nnoremap <silent> <leader>co :FzfColors!<CR>
  nnoremap <silent> <leader>ht :FzfHelptags!<CR>
" FZF keybindings
  nnoremap <silent> <leader>la :Lsa<CR>
  nnoremap <silent> <leader>ls :Ls<CR>
  nnoremap <silent> <leader>lS :LS<CR>
  nnoremap <silent> <leader>rr :RG<Space>
  nnoremap <silent> <leader>gg :GGrep<CR>
  nnoremap <silent> <leader>hh :HFiles<CR>
  nnoremap <silent> <leader>hf :HFiles<CR>
  nnoremap <silent> <leader>fa :FzfAg<CR>
  nnoremap <silent> <leader>rg :Rg<Space>
  nnoremap <silent> <leader>fr :FzfRg<Space>
  nnoremap <silent> <leader>ff :FzfFiles<CR>
  nnoremap <silent> <leader>fi :Files<CR>
  nnoremap <silent> <leader>fg :FzfGFiles?<CR>
  nnoremap <silent> <leader>gf :FzfGFiles<CR>
  nnoremap <silent> <leader>fl :FzfLines<Space>
  nnoremap <silent> <leader>bl :FzfBLines<Space>
  nnoremap <silent> <leader>tt :FzfTags<CR>
  nnoremap <silent> <leader>bt :FzfBTags<CR>
  nnoremap <silent> <leader>ht :FzfHelptags<CR>
  nnoremap <silent> <leader>fc :FzfCommits<CR>
  nnoremap <silent> <leader>bc :FzfBCommits<CR>
  nnoremap <silent> <leader>fw :FzfWindows<CR>
  nnoremap <silent> <leader>fb :FzfBuffers<CR>
  nnoremap <silent> <leader>lo :FzfLocate<space>
  nnoremap <silent> <leader>fs :FzfSnippets<CR>
  nnoremap <silent> <leader>fm :FzfMarks<CR>
  nnoremap <silent> <leader>ft :FzfFiletypes<CR>
" Recover commands from history through FZF
  nnoremap <silent> <leader>ch :FzfHistory:<CR>
  nnoremap <silent> <leader>hs :FzfHistory/<CR>
  nnoremap <silent> <leader>fh :FzfHistory <CR>
" Search home/all files
  nnoremap <silent> <leader>ho :Home<CR>
  nnoremap <silent> <leader>fp :Root<CR>
  nnoremap <silent> <leader>ro :Root<CR>
" 'grep' word under cursor
  nnoremap <silent> <leader>gw :Rg <C-R>=expand("<cword>")<CR><CR>
" with ag (better highlight)
  nnoremap <silent> <leader>aw :FzfAg <C-R>=expand("<cword>")<CR><CR>
  nnoremap <silent> <leader>ga :FzfAg <C-R>=expand("<cword>")<CR><CR>
" Insert mode completion
  " inoremap <c-x><c-w>  <Plug>(fzf-complete-word)
  " inoremap <c-x><c-p>  <Plug>(fzf-complete-path)
  " inoremap <c-x><c-l>  <Plug>(fzf-complete-line)
  " inoremap <c-x>t <Plug>(fzf-complete-trigger)
  " inoremap <c-x>w <Plug>(fzf-complete-file-ag)

" Path & file completion with custom source command
  inoremap <expr> <c-x><c-s> fzf#vim#complete#path('fd -H -td')
  inoremap <expr> <c-x><c-p> fzf#vim#complete#path('ag --hidden -f -l -g ""')
  inoremap <expr> <c-x><c-w> fzf#vim#complete#path('rg --hidden --files')

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
      \ 'alt-q'  : function('s:build_quickfix_list'),
      \ 'alt-e'  : 'tabedit',
      \ 'ctrl-t' : 'tab new',
      \ 'ctrl-s' : 'tab split',
      \ 'ctrl-x' : 'split',
      \ 'ctrl-v' : 'vsplit' }

"" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':       ['fg', 'Normal'],
      \ 'bg':         ['bg', 'Normal'],
      \ 'hl':         ['fg', 'Comment'],
      \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':        ['fg', 'Exception', 'Statement'],
      \ 'preview-bg': ['bg', 'Comment'],
      \ 'info':       ['fg', 'Type'],
      \ 'border':     ['fg', 'PreProc'],
      \ 'prompt':     ['fg', '#689d6a'],
      \ 'pointer':    ['fg', 'Argument'],
      \ 'marker':     ['fg', 'Function'],
      \ 'spinner':    ['fg', 'Special'],
      \ 'header':     ['fg', 'Include'] }

" custom Statusline
" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 guifg=160 guibg=none
"   highlight fzf2 guifg=23  guibg=none
"   highlight fzf3 guifg=242 guibg=250
"   setlocal lightline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction

" autocmd! User FzfStatusLine call <SID>fzf_statusline()
autocmd! User FzfStatusLine call lightline#update()

"" Hide Statusline
" autocmd! FileType fzf set ls=0 nosmd noru
"       \| autocmd BufLeave <buffer> set ls=2 nosmd noru
