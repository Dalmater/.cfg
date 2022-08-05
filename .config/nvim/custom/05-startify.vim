"--------------- "Startify" --------------
let g:startify_update_oldfiles = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
" let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 0
let g:startify_enable_special = 0
let g:startify_session_sort = 1
let g:startify_relative_path = 1
let g:startify_enable_unsafe = 1
" let g:startify_session_dir = '~/.config/nvim/session'

autocmd User Startified setlocal cursorline

let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ ]

" let g:startify_lists = [
"       \ { 'type': 'dir'       },
"       \ { 'type': 'files'     },
"       \ { 'type': 'sessions'  },
"       \ { 'type': 'bookmarks' },
"       \ { 'type': 'commands' },
"       \ ]

let  g:startify_bookmarks =  [
      \ {'a': '~/.config/nvim/after/plugin/' },
      \ {'c': '~/.config/' },
      \ {'n': '~/.config/nvim/custom/' },
      \ {'o': '~/.config/nvim/init.vim'},
      \ {'l': '~/.local/share/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/gruvboxdark.vim' },
      \ {'m': '~/.local/share/nvim/plugged/vim-visual-multi/autoload/vm/themes.vim' },
      \ {'g': '~/.local/share/nvim/plugged/vim-gruvbox8/colors/gruvbox8_hard.vim' },
      \ ]

let g:startify_commands = [
      \ {'ec':  ['Health Check', ':checkhealth']},
      \ {'ps': ['Plugins status', ':PlugStatus']},
      \ {'pu': ['Plugins update ',':PlugUpdate | PlugUpgrade']},
      \ {'h':  ['Help', ':help']},
      \ ]

" custom banner
let g:ascii = [
      \ '           ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
      \ '           ████╗  ██║██║   ██║██║████╗ ████║',
      \ '           ██╔██╗ ██║██║   ██║██║██╔████╔██║',
      \ '           ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      \ '           ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
      \ '           ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
      \]
let g:startify_custom_header =
      \ 'startify#center(g:ascii + startify#fortune#quote())'

" let g:ascii = [
"       \ '                              __',
"       \ '                .-----.--.--.|__|.--------.',
"       \ '                |     |  |  /|  ||        |',
"       \ '                |__|__|\___/ |__||__|__|__|',
"       \ '                '
"       \]
" let g:startify_custom_header =
"       \ 'startify#center(g:ascii + startify#fortune#quote())'

" startify file icons
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
