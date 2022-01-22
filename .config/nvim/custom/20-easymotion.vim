"------ " easymotion settings & keybindings" -------

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz,ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_add_search_history = 1
let g:EasyMotion_off_screen_search = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_skipfoldedline = 0

hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search
let s:target_hl_defaults = {
    \   'gui'     : ['#ffb400', '#cc241d' , 'bold']
    \ , 'cterm256': ['011', '160'     , 'bold']
    \ , 'cterm'   : ['yellow', 'red'     , 'bold']
    \ }

autocmd! User EasyMotionPromptBegin silent! easycompleteDisable
autocmd! User EasyMotionPromptEnd   silent! easycompleteEnable

nmap <leader><leader>f <Plug>(easymotion-overwin-f)
xmap <leader><leader>f <Plug>(easymotion-bd-f)
omap <leader><leader>f <Plug>(easymotion-bd-f)

nmap <leader><leader>s <Plug>(easymotion-overwin-f2)
xmap <leader><leader>s <Plug>(easymotion-bd-f2)
omap <leader><leader>s <Plug>(easymotion-bd-f2)

nmap <leader><leader>l <Plug>(easymotion-overwin-line)
xmap <leader><leader>l <Plug>(easymotion-bd-jk)
omap <leader><leader>l <Plug>(easymotion-bd-jk)

nmap <leader><leader>w <Plug>(easymotion-overwin-w)
xmap <leader><leader>w <Plug>(easymotion-bd-w)
omap <leader><leader>w <Plug>(easymotion-bd-w)
omap z                 <Plug>(easymotion-t)

nmap <leader><leader>; <Plug>(easymotion-next)
nmap <leader><leader>, <Plug>(easymotion-prev)

map <leader><leader>J  <Plug>(easymotion-sol-j)
map <leader><leader>K  <Plug>(easymotion-sol-k)

map <leader><leader>w  <Plug>(easymotion-iskeyword-w)
map <leader><leader>b  <Plug>(easymotion-iskeyword-b)
" nmap s                 <Plug>(easymotion-s2)
xmap s                 <Plug>(easymotion-s2)
omap z                 <Plug>(easymotion-s2)
nmap <leader><leader>n <Plug>(easymotion-sn)
xmap <leader><leader>n <Plug>(easymotion-sn)
omap <leader><leader>z <Plug>(easymotion-sn)
