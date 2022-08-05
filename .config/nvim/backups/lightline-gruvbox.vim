" File: autoload/lightline/colorscheme/gruvboxdark.vim
" Description: lightline.vim theme for gruvbox colorscheme

let s:black =   [ '#000000', 232 ]
let s:base04 =  [ '#1d2021', 234 ]
let s:base03 =  [ '#282828', 235 ]
let s:base02 =  [ '#3c3836', 237 ]
let s:base01 =  [ '#504945', 239 ]
let s:base00 =  [ '#665c54', 59  ]
let s:base0 =   [ '#7c6f64', 243 ]
let s:base1 =   [ '#928374', 102 ]
let s:base2 =   [ '#a89984', 145 ]
let s:base3 =   [ '#d5c4a1', 250 ]
let s:base4 =   [ '#ebdbb2', 231 ]
let s:yellow1 = [ '#fabd2f', 220 ]
let s:yellow =  [ '#d79921', 172 ]
let s:orange1 = [ '#fe8019', 208 ]
let s:orange =  [ '#d65d0e', 166 ]
let s:red1 =    [ '#fb4934', 196 ]
let s:red =     [ '#cc241d', 160 ]
let s:magenta = [ '#b16286', 132 ]
let s:peach =   [ '#d3869b', 174 ]
let s:blue =    [ '#458588', 66  ]
let s:blue1 =   [ '#83a598', 109 ]
let s:cyan =    [ '#689d6a', 72  ]
let s:green =   [ '#b8bb26', 142 ]
let s:white =   [ '#eeeeee', 255 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}, 'command': {}}

let s:p.normal.left    = [ [ s:black, s:base0 ], [ s:base2, s:base01 ] ]
let s:p.normal.right   = [ [ s:base04, s:base0 ], [ s:base2, s:base01 ] ]
let s:p.normal.middle  = [ [ s:base1, s:base03 ] ]
let s:p.normal.error   = [ [ s:red, s:base03 ] ]
let s:p.normal.warning = [ [ s:yellow, s:base02 ] ]

let s:p.insert.left   = [ [ s:base04, s:green ], [ s:base4, s:base00 ] ]
let s:p.insert.right  = [ [ s:base01, s:green ], [ s:base4, s:base0 ] ]
let s:p.insert.middle = [ [ s:base2, s:base01 ] ]

let s:p.replace.left   = [ [ s:base04, s:orange], [ s:base3, s:base00 ] ]
let s:p.replace.right  = [ [ s:base03, s:orange ], [ s:base3, s:base0 ] ]
let s:p.replace.middle = [ [ s:base2, s:base01 ] ]

let s:p.visual.left     = [ [ s:black, s:yellow ], [ s:base2, s:base01 ] ]
let s:p.visual.right    = [ [ s:base04, s:yellow ], [ s:base2, s:base01 ] ]
let s:p.visual.middle   = [ [ s:base1, s:base03 ] ]

let s:p.terminal.left   = [ [ s:black, s:cyan, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.terminal.right  = [ [ s:base04, s:cyan, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.terminal.middle = [ [ s:base02, s:base02 ] ]

let s:p.command.left    = [ [ s:black, s:base2, 'bold' ], [ s:base2, s:base01 ] ]
let s:p.command.right   = [ [ s:base04, s:base2, 'bold' ], [ s:base2, s:base01 ] ]
let s:p.command.middle  = [ [ s:base1, s:base03 ] ]

let s:p.inactive.right  = [ [ s:base03, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left   = [ [ s:black, s:base02 ], [ s:base03, s:base00 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base04 ] ]

let s:p.tabline.left   = [ [ s:base2, s:base02 ] ]
let s:p.tabline.tabsel = [ [ s:base4, s:base00 ] ]
let s:p.tabline.middle = [ [ s:base02, s:base03 ] ]
let s:p.tabline.right  = [ [ s:black, s:orange1, 'bold' ] ]

let g:lightline#colorscheme#gruvboxdark#palette = lightline#colorscheme#flatten(s:p)
" silent! VMTheme gruvbox
