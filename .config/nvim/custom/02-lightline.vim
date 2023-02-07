" Get default from :h lightline

let g:lightline = {
      \  'colorscheme': 'gruvboxdark',
      \  'active': {
        \  'left': [ ['bufnum', 'mode', 'paste'],
        \            ['filename', 'gitbranch'],
        \            ['gitgutter', 'spell'] ],
        \  'right': [ ['percent'],
        \             ['lineinfo'],
        \             ['fileformat','fileencoding','filetype' ] ],
        \  },
        \  'component_function': {
          \  'gitbranch': 'GitInfo',
          \  'gitgutter': 'GitStatus',
          \  'fileformat': 'MyFileformat',
          \  'filename': 'LightlineFilename',
          \  'filetype': 'MyFiletype',
          \  'fileencoding': 'MyFileencoding',
          \  },
          \  }

          " \  'mode': 'LightlineMode',
" function! LightlineMode()
"   let fname = expand('%:t')
"   return fname =~# 'startify' ? 'Startify' :
"         \ lightline#mode()
"   return fname =~# '^__Tagbar__' ? 'Tagbar' :
"         \ lightline#mode()
" endfunction

let g:lightline.inactive = {
      \  'colorscheme': 'gruvboxdark',
      \  'left': [ [ 'filename' ] ],
      \  'right': [ [ 'percent' ],
      \             [ 'lineinfo' ],
      \             [ 'filetype' ] ],
      \  }

let g:lightline.tab = {
      \  'active': ['tabnum', 'filename', 'ficolorsme', 'modified'],
      \  'inactive': ['filename', 'ficolorsme' , 'modified'],
      \ }

fun! GitInfo()
  if exists('FugitiveHead')
    let mark = ' '
    let git = fugitive#head()
    if git != ''
      return mark.git
    endif
  endif
  return ''
endf

fun! GitStatus()
  if exists("g:gitgutter_signs")
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
  else
    return ''
  endif
endf

let g:tagbar_status_func = 'TagbarStatusFunc'

fun! TagbarStatusFunc(current, sort, fname, ...) abort
  return lightline#statusline(0)
endf

function! LightlineFilename()
  if &filetype == 'startify'
    return &filetype ==# 'startify' ? 'Startify' : ''
  elseif &filetype == 'fzf'
    return &ft ==# 'fzf' ? 'fzf' : ''
  else
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    let readonly = &readonly ? ' ' : ''
    return filename . modified . readonly
  endif
endfunction

fun! LightlineFiletype()
  let fileformat = &fileformat
  let fileencoding = &fenc !=# '' ? &fenc : &enc
  let filetype = &ft !=# '' ? &ft:"no ft"
  return fileformat . fileencoding . filetype
endf

fun! MyFiletype()
  return winwidth(0) > 50 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endf

fun! MyFileformat()
  return winwidth(0) > 64 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endf

fun! MyFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endf

let g:lightline.separator = {
      \  'left': '', 'right': ''
      \  }
let g:lightline.subseparator = {
      \  'left': '', 'right': ''
      \  }

let g:lightline.mode_map = {
      \  'n' : 'N',
      \  'i' : 'I',
      \  'R' : 'R',
      \  'v' : 'V',
      \  'V' : 'V-L',
      \  "\<C-v>" : 'V-B',
      \  'c' : 'C',
      \  's' : 'S',
      \  'S' : 'S-L',
      \  "\<C-s>" : 'S-B',
      \  't': 'T',
      \  }

let g:lightline.component = {
      \  'mode':'%{lightline#mode()}',
      \  'absolutepath': '%F',
      \  'relativepath': '%f',
      \  'filename': '%t',
      \  'modified': '%{&modified?"[+]":""}',
      \  'bufnum': '%n',
      \  'paste': '%{&paste?"PST":""}',
      \  'readonly': '%{&readonly?"":""}',
      \  'charvalue': '%b',
      \  'charvaluehex': '%B',
      \  'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \  'fileformat': '%{&ff}',
      \  'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \  'percent': '%3p%%%<',
      \  'percentwin': '%P',
      \  'spell': '%{&spell?&spelllang:""}',
      \  'lineinfo': '%3l:%-2c',
      \  'line': '%l',
      \  'column': '%c',
      \  'close': '%999X X ',
      \  'obstatus': '%{ObsessionStatus()}',
      \  'winnr': '%{winnr()}' }

"------ "lightline colorscheme change" -------

function! s:set_lightline_colorscheme(name) abort
  let g:lightline.colorscheme = a:name
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! s:lightline_colorschemes(...) abort
  return join(map(
        \  globpath(&rtp,"autoload/lightline/colorscheme/*.vim",1,1),
        \  "fnamemodify(v:val,':t:r')"),
        \  "\n")
endfunction

command! -nargs=1 -complete=custom,s:lightline_colorschemes LightlineColors
      \  call s:set_lightline_colorscheme(<q-args>)
