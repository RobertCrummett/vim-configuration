" Like a limerick, but in Vimscript.
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

set nocompatible
set encoding=utf-8

set termguicolors
filetype plugin indent on
syntax enable

set timeout 
set timeoutlen=3000 
set ttimeoutlen=100
set mouse=a

set nolangremap
set complete-=i

augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :setlocal hlsearch
	autocmd CmdlineLeave /,\? :setlocal nohlsearch
augroup END

set incsearch 
set smartcase

set wildmenu 
set wildoptions=pum

set autoread
set history=1000
set tabpagemax=50
set belloff=all

set path+=**

let mapleader = " "

if executable("rg")
	set grepprg=rg\ --vimgrep\ --smart-case\ --hidden 
	set grepformat=%f:%l:%c:%m
endif

autocmd FileType * set formatoptions-=c 
			\ | set formatoptions-=r 
			\ | set formatoptions-=o 
			\ | set formatoptions-=t
			\ | set formatoptions+=j

if exists(":DiffOrig") != 2
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
				\ | diffthis | wincmd p | diffthis
endif

colorscheme catppuccin_frappe

set laststatus=2
set guioptions-=e
set ruler
set statusline=%<%f\ %y\ %{FugitiveStatusline()}%=%55(%{strftime('%a\ %b\ %e\ %H:%M\ %z')}\ %)
