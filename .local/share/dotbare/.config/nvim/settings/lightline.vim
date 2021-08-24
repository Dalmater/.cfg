" Get default from :h lightline

let g:lightline = {
      \ 'colorscheme': 'gruvboxdark',
      \ 'active': {
        \   'left': [ ['mode', 'paste', 'spell'],
        \             ['filename', 'readonly', 'gitbranch'] ],
        \ 'right': [ ['percent' ],
        \            ['lineinfo' ],
        \            ['fileformat','fileencoding','filetype' ] ],
        \ },
        \ 'component_function': {
          \   'gitbranch': 'GitInfo',
          \   'fileformat': 'MyFileformat',
          \   'filename': 'LightlineFilename',
          \   'filetype': 'MyFiletype',
          \   'fileencoding': 'MyFileencoding',
          \ },
          \ }

function! GitInfo()
  let git = fugitive#head()
    if git != ''
  return " " . fugitive#head()
    else
  return ''
endf

function! LightlineFileformat()
  return winwidth(0) > 60 ? &fileformat : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 60 ? (&fenc !=# ""  ?  &fenc:&enc) : ''
endf

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? '[+]' : ''
  return filename . modified
endfunction

function! LightlineFiletype()
  let fileformat = &fileformat
  let fileencoding = &fenc !=# "" ? &fenc:&enc
  let filetype = &ft !=# "" ? &ft:"no ft"
  return fileformat . fileencoding . filetype
endf

function! MyFiletype()
  return winwidth(0) > 43 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 60 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline.tab = {
      \ 'active': ['winnr', 'filename', 'ficolorsme', 'modified' ],
      \ 'inactive': [ 'filename', 'ficolorsme', 'modified' ] }

let g:lightline.enable = {
      \ 'statusline': 1,
      \ 'tabline': 1
      \ }

let g:lightline.separator = {
      \   'left': '', 'right': ''
      \ }
let g:lightline.subseparator = {
      \   'left': '', 'right': ''
      \ }

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

"let g:lightline.tabline = {
"       \ 'left': [ [ 'tabs' ] ],
"       \ 'right': [ ] }

" let g:lightline.mode_map = {
"       \ 'n'     : 'NORMAL',
"       \ 'i'     : 'INSERT',
"       \ 'R'     : 'REPLACE',
"       \ 'v'     : 'VISUAL',
"       \ 'V'     : 'V-LINE',
"       \ "\<C-v>": 'V-BLOCK',
"       \ 'c'     : 'COMMAND',
"       \ 's'     : 'SELECT',
"       \ 'S'     : 'S-LINE',
"       \ "\<C-s>": 'S-BLOCK',
"       \ 't'     : 'TERMINAL',
"       \ }

let g:lightline.mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'V-L',
      \ "\<C-v>" : 'V-B',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'S-L',
      \ "\<C-s>" : 'S-B',
      \ 't': 'T',
      \ }

let g:lightline.component = {
      \ 'mode':'%{lightline#mode()}',
      \ 'absolutepath': '%F',
      \ 'relativepath': '%f',
      \ 'filename': '%t',
      \ 'modified': '%{&modified?"[+]":""}',
      \ 'bufnum': '%n',
      \ 'paste': '%{&paste?"PASTE":""}',
      \ 'readonly': '%{&readonly?"":""}',
      \ 'charvalue': '%b',
      \ 'charvaluehex': '%B',
      \ 'fileencoding': '%<%{&fenc!=#""?&fenc:&enc}',
      \ 'fileformat': '%<%{&ff}',
      \ 'filetype': '%<%{&ft!=#""?&ft:"no ft"}',
      \ 'percent': '%3p%%%<',
      \ 'percentwin': '%P',
      \ 'spell': '%{&spell?&spelllang:""}',
      \ 'lineinfo': '%3l:%-2c',
      \ 'line': '%l',
      \ 'column': '%c',
      \ 'close': '%999X X ',
      \ 'winnr': '%{winnr()}' }
