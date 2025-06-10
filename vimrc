set nocompatible

set termguicolors
filetype plugin indent on
syntax enable

set ttimeout
set ttimeoutlen=100

set textwidth=80
set complete-=i
set omnifunc=syntaxcomplete#Complete
set incsearch

set wildmenu
set wildoptions=pum

set formatoptions+=j

set autoread
set history=1000
set tabpagemax=50

let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

if executable("rg")
	set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
	set grepformat=%f:%l:%c:%m
endif
