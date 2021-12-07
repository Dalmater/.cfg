" File: autoload/lightline/colorscheme/gruvboxdark.vim
" Description: lightline.vim theme for gruvbox colorscheme

let s:base04 =  [ '#1d2021' ,234 ]
let s:base03 =  [ '#282828', 235 ]
let s:base02 =  [ '#3c3836', 236 ]
let s:base01 =  [ '#504945', 239 ]
let s:base00 =  [ '#665c54', 59  ]
let s:base0 =   [ '#7c6f64', 243 ]
let s:base1 =   [ '#928374', 8   ]
let s:base2 =   [ '#a89984', 138 ]
let s:base3 =   [ '#ebdbb2', 187 ]
let s:base4 =   [ '#d5c4a1', 250 ]
let s:yellow =  [ '#d79921', 172 ]
let s:orange1 = [ '#fe8019', 208 ]
let s:orange =  [ '#d65d0e', 166 ]
let s:red =     [ '#fb3934', 196 ]
let s:darkred = [ '#cc241d', 160 ]
let s:magenta = [ '#b16286', 132 ]
let s:peach =   [ '#d3869b', 174 ]
let s:blue =    [ '#458588', 66  ]
let s:cyan =    [ '#83a598', 108 ]
let s:green =   [ '#b8bb26', 142 ]
let s:white =   [ '#eeeeee', 255 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:base04, s:green], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base04, s:base0 ], [ s:base2, s:base01 ] ]
let s:p.normal.middle = [ [ s:base1, s:base03 ] ]
let s:p.normal.error = [ [ s:red, s:base02 ] ]
let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]

let s:p.inactive.right = [ [ s:base03, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left = [ [ s:base1, s:base02 ], [ s:base03, s:base00 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base04 ] ]

let s:p.insert.left = [ [ s:base04, s:darkred ], [ s:base3, s:base00 ] ]
let s:p.insert.right = [ [ s:base01, s:darkred ], [ s:base4, s:base0 ] ]
let s:p.insert.middle = [ [ s:base2, s:base02 ] ]

let s:p.replace.left = [ [ s:base04, s:orange], [ s:base3, s:base00 ] ]
let s:p.replace.right = [ [ s:base01, s:orange ], [ s:base4, s:base0 ] ]

let s:p.visual.left = [ [ s:base04, s:peach ], [ s:base3, s:base01 ] ]

let s:p.tabline.left = [ [ s:base2, s:base02 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base00 ] ]
let s:p.tabline.middle = [ [ s:base02, s:base03 ] ]
let s:p.tabline.right = [ [ s:orange1, s:base02 ] ]

let g:lightline#colorscheme#gruvboxdark#palette = lightline#colorscheme#flatten(s:p)
