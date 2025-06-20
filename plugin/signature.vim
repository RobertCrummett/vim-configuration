" For consistent signing
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

if exists('g:signing_loaded')
	finish
endif
let g:signing_loaded=0

let g:fullname = "[Robert] Nate Crummett"
let g:email = "robertcrummett@robertcrummett.com"

command! Signature execute "normal! O" . g:email . "<C-O>O" . g:fullname . "<C-O>I"
