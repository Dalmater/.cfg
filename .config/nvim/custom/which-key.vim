"------------------ "WhichKey" ------------------

" nnoremap <silent><leader> :WhichKey '<Space>'<CR>
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent><leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" nnoremap <localleader> :<c-u>WhichKey  ','<CR>
" vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR>
nnoremap <silent>g :WhichKey 'g'<CR>
" vnoremap <silent>g :WhichKeyVisual 'g'<CR>

" let g:which_key_flatten = 1
let g:which_key_hspace = 2
let g:which_key_timeout = 300
let g:which_key_max_size = 0
let g:which_key_fallback_to_native_key = 1
" let g:which_key_centered = 1
" let g:which_key_sort_horizontal = 1
let g:which_key_disable_default_offset = 1
let g:which_key_group_dicts = ''
" let g:which_key_use_floating_win = 1
" let g:which_key_floating_opts = { 'row': '+3', 'col': '-3', 'width': '+2', 'hight': '+2' }
let g:which_key_default_group_name = '+next_key'
let g:WhichKeyFormatFunc = function('which_key#format')
" let g:which_key_ignore_invalid_key = 1
let g:which_key_map = {}
let g:which_key_map = { '<C-]>' : 'goto definition' }
" let g:which_key_map[' '] = { 'name': '+easymotion' }
let g:which_key_map['.'] = 'set working directory'
let g:which_key_map['a'] = { 'name': '+autoformat +argadd' }
let g:which_key_map['b'] = { 'name': '+buffers' }
let g:which_key_map['c'] = { 'name': '+Commands_History +Colors' }
let g:which_key_map['f'] = { 'name': '+FZF & +x FixWhiteSpace' }
let g:which_key_map['g'] = { 'name': '+git +goyo +Rg_word' }
let g:which_key_map['h'] = { 'name': 'hsearch +fzf +hor→vert_split' }
let g:which_key_map['l'] = { 'name': '+ls +Locate' }
let g:which_key_map['o'] = { 'name': '+(c+l)open' }
let g:which_key_map['r'] = { 'name': '+rg Rg +o Root' }
let g:which_key_map['s'] = { 'name': '+split +spell +source +shebang' }
let g:which_key_map['t'] = { 'name': '+tabs +tags' }
let g:which_key_map['v'] = { 'name': 'vert→hor_split' }
let g:which_key_map['u'] = { 'name': '+p update +t UndoTree' }
let g:which_key_map['z'] = { 'name': 'edit zshrc' }
let g:which_key_map['n'] = { 'name': '+New_Netrw_Tab +noruler' }
let g:which_key_map.d = 'which_key_ignore'
let g:which_key_map.e = 'which_key_ignore'
let g:which_key_map.q = 'which_key_ignore'
let g:which_key_map.P = 'which_key_ignore'
let g:which_key_map.p = 'which_key_ignore'
let g:which_key_map['<Esc>'] = 'which_key_ignore'
let g:which_key_map['i'] = 'which_key_ignore'

" call which_key#register('space', "g:which_key_map")
autocmd! User vim-which-key call which_key#register('<Space>', "g:which_key_map")

" autocmd! FileType which_key
" autocmd  FileType which_key set ls=0 noru nosmd
"       \| autocmd BufLeave <buffer> set ls=2 nosmd ru
