" Like a limerick, but in Vimscript.
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

set nocompatible

set termguicolors
filetype plugin indent on
syntax enable

set timeout timeoutlen=3000 ttimeoutlen=100
set mouse=a

set textwidth=80
set complete-=i
set hlsearch incsearch

set wildmenu wildoptions=pum

set autoread
set history=1000
set tabpagemax=50
set belloff=all

set path+=**

let mapleader = " "
let g:claude_api_key = readfile($HOME . '\vimfiles\.claude-api-key')[0]

if executable("rg")
	set grepprg=rg\ --vimgrep\ --smart-case\ --hidden grepformat=%f:%l:%c:%m
endif

autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t

colorscheme silkworm
