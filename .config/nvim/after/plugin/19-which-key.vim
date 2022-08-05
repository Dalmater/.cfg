"------------------ "WhichKey" ------------------

" nnoremap <silent><leader> :WhichKey '<Space>'<CR>
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent><leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" nnoremap <localleader> :<c-u>WhichKey  ','<CR>
" vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR>
" nnoremap <silent>g :WhichKey 'g'<CR>
" vnoremap <silent>g :WhichKeyVisual 'g'<CR>
" nnoremap <silent>c :WhichKey 'c'<CR>
" vnoremap <silent>c :WhichKeyVisual 'c'<CR>

let g:which_key_flatten = 1
let g:which_key_hspace = 2
let g:which_key_timeout = 300
let g:which_key_max_size = 0
" let g:which_key_fallback_to_native_key = 1
" let g:which_key_sort_horizontal = 1
let g:which_key_disable_default_offset = 1
let g:which_key_group_dicts = ''
" let g:which_key_use_floating_win = 1
" let g:which_key_floating_opts = { 'row': '+3', 'col': '-3', 'width': '+2', 'hight': '+2' }
let g:which_key_default_group_name = '+next_key'
let g:which_key_ignore_invalid_key = 1
let g:which_key_run_map_on_popup = 1
let g:which_key_map = {}
" let g:which_key_map = { '<C-]>' : 'goto definition' }
" let g:which_key_map[' '] = { 'name': '+easymotion' }
let g:which_key_map['.'] = 'set working directory'
let g:which_key_map['-'] = 'netrw in files directory'
let g:which_key_map['a'] = { 'name': '+autoformat +argadd' }
let g:which_key_map['b'] = { 'name': '+buffers' }
let g:which_key_map['c'] = { 'name': '+Command_History +Colors +Commands' }
let g:which_key_map['f'] = { 'name': '+FZF file_hist' }
let g:which_key_map['g'] = { 'name': '+git +goyo +Rg_word +F open_file +x open_URL' }
let g:which_key_map['h'] = { 'name': '+fzf hor→vert split' }
let g:which_key_map['j'] = { 'name': 'move lines down' }
let g:which_key_map['j'] = 'move line down'
let g:which_key_map['k'] = { 'name': 'move lines up' }
let g:which_key_map['k'] = 'move line up'
let g:which_key_map['l'] = { 'name': '+ls +Locate' }
let g:which_key_map['n'] = { 'name': '+netrw +Terminal' }
let g:which_key_map['o'] = { 'name': '+(c+l)open open_URL' }
let g:which_key_map['r'] = { 'name': '+g Rg +o Root' }
let g:which_key_map['s'] = { 'name': 'search_hist +spell +source +shebang +ruler' }
let g:which_key_map['t'] = { 'name': '+tabs +tags +z terminal' }
let g:which_key_map['v'] = { 'name': 'split vert→hor' }
let g:which_key_map['u'] = { 'name': '+p UpdatePlugs +t UndoTree' }
let g:which_key_map['z'] = { 'name': 'edit zshrc +terminal' }
let g:which_key_map.s.b = 'shebang'
let g:which_key_map.t.f = 'make a tags file'
let g:which_key_map.t.a = 'open tag'
let g:which_key_map.t.g = 'open tag'
let g:which_key_map.t.z = 'open terminal in new tab'
let g:which_key_map.n.t = 'open terminal in new tab'
let g:which_key_map.t.e = 'expand dir of file in cmd line'
let g:which_key_map.g.a = 'ag word under cursor'
let g:which_key_map.g.w = 'grep word under cursor'
let g:which_key_map.d = 'which_key_ignore'
let g:which_key_map.e = 'which_key_ignore'
let g:which_key_map.P = 'which_key_ignore'
let g:which_key_map.p = 'which_key_ignore'
let g:which_key_map.q = 'which_key_ignore'
let g:which_key_map.S = 'which_key_ignore'
let g:which_key_map['<Esc>'] = 'which_key_ignore'
let g:which_key_map['i'] = 'edit $MYVIMRC'
let g:which_key_display_names = {' ': 'SPC', '<C-H>': 'BS', '<C-I>': 'TAB', '<CR>': '⏎', '<TAB>': '↹'}

autocmd! User vim-which-key call which_key#register('<Space>', "g:which_key_map")
" autocmd! User vim-which-key call which_key#register('<Space>', "g:which_key_map_visual", 'v')

" autocmd! FileType which_key
" autocmd  FileType which_key set ls=0 noru nosmd
"       \| autocmd BufLeave <buffer> set ls=2 nosmd ru
