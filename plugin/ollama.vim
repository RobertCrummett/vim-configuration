" Ask an AI model about your buffer contents
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

let g:default_ollama_model = "codellama"

command! -nargs=+ AskOllama call <SID>SendBufferToOllama(g:default_ollama_model, <q-args>)

function! s:SendBufferToOllama(model, prompt)
	let l:buffer = join(getline(1, "$"), "\n")

	let l:buffer = substitute(l:buffer, '\t', '\\t', 'g')
	let l:buffer = substitute(l:buffer, '\n', '\\n', 'g')
	let l:buffer = substitute(l:buffer, '\r', '\\r', 'g')

	let l:filetype = &filetype
	if l:filetype ==# ""
		let l:filetype = "code"
	endif

	let l:prompt = expand("My " . l:filetype . " code: ```" . l:buffer . "``` My prompt: " . a:prompt)

	if executable("ollama")
	 	terminal
	 	call term_sendkeys("", "ollama run " . a:model . "\<cr>")
	 	call term_sendkeys("", l:prompt)
	else
	 	echohl WarningMsg
	 	echomsg "`ollama` is not executable, therefore it cannot be queried"
	 	echohl None
	endif
endfunction
