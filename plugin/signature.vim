" For consistent signing
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

function! Fullname()
	let l:name = "[Robert] Nate Crummett"
	call append(line("."), l:name)
endfunction

function! Email()
	let l:email = "robertcrummett@robertcrummett.com"
	call append(line("."), l:email)
endfunction

command! Signature call Email() | call Fullname()
