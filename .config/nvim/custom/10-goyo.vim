"---------------- " Goyo setup " ----------------

let g:goyo_width  = '80'
let g:goyo_height = '100%'

" "" Auto save function
" function! s:goyo_enter()
"   let b:quitting = 0
"   let b:quitting_bang = 0
"   autocmd QuitPre <buffer> let b:quitting = 1
"   cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
" endfunction

" function! s:goyo_leave()
"   "" Quit Vim if this is the only remaining buffer
"   if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
"     if b:quitting_bang
"       qa!
"     else
"       qa
"     endif
"   endif
" endfunction

" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:goyo_enter()
  " if exists('$TMUX')
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set nocursorline
  set showmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  " if exists('$TMUX')
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set noshowmode
  set showcmd
  set scrolloff=3
  hi Normal guibg=none
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" func! s:goyo_line()
"   set showmode
"   set noshowcmd
"   set scrolloff=999
" endf

" func! s:goyo_left()
"   set noshowmode
"   set showcmd
"   set scrolloff=3
"   hi Normal guibg=none
" endf

" autocmd! User GoyoEnter nested call <SID>goyo_line()
" autocmd! User GoyoLeave nested call <SID>goyo_left()
autocmd! User goyo.vim echom 'Goyo is now loaded!'

noremap <silent> <leader>gy :Goyo \| set linebreak<cr>
