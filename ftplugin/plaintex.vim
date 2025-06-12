setlocal spell spelllang=en_us
setlocal foldmethod=marker

" Setting the compiler and tex_flavor will also configure
" the `:make %` directive automatically.
let b:tex_flavor='pdftex'
compiler tex

setlocal wildignore+=*.pdf
