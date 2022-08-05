"---------------- " Goyo setup " ----------------

let g:goyo_width  = '104'
let g:goyo_height = '100%'

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  "" Auto save function
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  " settings for goyo
  set nocursorline
  set showmode
  set noshowcmd
  set scrolloff=999
  " Limelight
  " ...
  echom 'Goyo is now loaded!'
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
  " settings for leaving goyo
  set noshowmode
  set showcmd
  set scrolloff=3
  hi Normal guibg=none
  " Limelight!
  " ...
  echom 'Left Goyo!'
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" autocmd! User goyo.vim echom 'Goyo is now loaded!'

noremap <silent> <leader>gy :Goyo<CR>
