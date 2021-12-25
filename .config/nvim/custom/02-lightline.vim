" Get default from :h lightline

let g:lightline = {
      \ 'colorscheme': 'gruvboxdark',
      \ 'active': {
        \ 'left': [ ['bufnum', 'mode', 'paste'],
        \           ['filename', 'gitbranch'],
        \           ['spell'] ],
        \ 'right': [ ['percent'],
        \            ['lineinfo'],
        \            ['fileformat','fileencoding','filetype' ] ],
        \ 'warning': [ ['%WarningMsg#'] ],
        \ },
        \ 'component_function': {
          \ 'gitbranch': 'GitInfo',
          \ 'fileformat': 'MyFileformat',
          \ 'filename': 'LightlineFilename',
          \ 'filetype': 'MyFiletype',
          \ 'fileencoding': 'MyFileencoding',
          \ 'mode': 'LightlineMode',
          \ '%#WarningMsg#': 'StatuslineTabWarning',
          \ },
          \ 'component_expand': {
            \ '%#WarningMsg#': 'StatuslineTabWarning',
            \ },
            \ }

function! LightlineMode()
  let fname = expand('%:t')
  return fname =~# '^__Tagbar__' ? 'Tagbar' :
        \ lightline#mode()
endfunction

let g:lightline.inactive = {
      \ 'colorscheme': 'gruvboxdark',
      \ 'left': [ [ 'filename' ] ],
      \ 'right': [ [ 'percent' ],
      \            [ 'lineinfo' ],
      \            [ 'filetype' ] ],
      \ }

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' ' . fugitive#head()
  else
    return ''
  endif
endf

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  return lightline#statusline(0)
endfunction

" function! LightlineFileformat()
"   return winwidth(0) > 60 ? &fileformat : ''
" endfunction

" function! LightlineFilename()
"   return &filetype ==# 'startify' ? '' : ''
" endf

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

function! LightlineFiletype()
  let fileformat = &fileformat
  let fileencoding = &fenc !=# '' ? &fenc : &enc
  let filetype = &ft !=# '' ? &ft:"no ft"
  return fileformat . fileencoding . filetype
endf

function! MyFiletype()
  return winwidth(0) > 50 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 64 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endf

"" Find if there are mixed indentings.
function! StatuslineTabWarning()
  if !exists('b:statusline_tab_warning')
    "" If the file is unmodifiable, do not warn.
    if !&modifiable
      let b:statusline_trailing_space_warning = ''
      return b:statusline_trailing_space_warning
    endif

    let has_leading_tabs = search('^\t\+', 'nw') != 0
    let has_leading_spaces = search('^ \+', 'nw') != 0

    if has_leading_tabs && has_leading_spaces
      let b:statusline_tab_warning = ' [mixed-indenting]'
    elseif has_leading_tabs
      let b:statusline_tab_warning = ' [tabbed-indenting]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif

  return b:statusline_tab_warning
endfunction

let g:lightline.tab = {
      \ 'active': ['tabnum', 'filename', 'ficolorsme', 'modified' ],
      \ 'inactive': ['filename', 'ficolorsme', 'modified' ], }

let g:lightline.enable = {
      \ 'statusline': 1,
      \ 'tabline': 1
      \ }

let g:lightline.separator = {
      \ 'left': '', 'right': ''
      \ }
let g:lightline.subseparator = {
      \ 'left': '', 'right': ''
      \ }

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

"let g:lightline.tabline = {
"       \ 'left': [ [ 'tabs' ] ],
"       \ 'right': [ 'close' ] }

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
      \ 'paste': '%{&paste?"PST":""}',
      \ 'readonly': '%{&readonly?"":""}',
      \ 'charvalue': '%b',
      \ 'charvaluehex': '%B',
      \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \ 'fileformat': '%{&ff}',
      \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \ 'percent': '%3p%%%<',
      \ 'percentwin': '%P',
      \ 'spell': '%{&spell?&spelllang:""}',
      \ 'lineinfo': '%3l:%-2c',
      \ 'line': '%l',
      \ 'column': '%c',
      \ 'close': '%999X X ',
      \ 'winnr': '%{winnr()}' }

"------ "lightline colorscheme function" -------

function! s:set_lightline_colorscheme(name) abort
  let g:lightline.colorscheme = a:name
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! s:lightline_colorschemes(...) abort
  return join(map(
        \ globpath(&rtp,"autoload/lightline/colorscheme/*.vim",1,1),
        \ "fnamemodify(v:val,':t:r')"),
        \ "\n")
endfunction

command! -nargs=1 -complete=custom,s:lightline_colorschemes LightlineColors
      \ call s:set_lightline_colorscheme(<q-args>)
