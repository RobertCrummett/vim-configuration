" Ask an AI model about your buffer contents
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

let g:ollama_model_llama2 = "llama2"
let g:ollama_model_codellama = "codellama"

command! -nargs=+ Llama2 call <SID>AskOllama(g:ollama_model_llama2, <q-args>)
command! -nargs=+ CodeLlama call <SID>SendBufferToOllama(g:ollama_model_codellama, <q-args>)

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
	
	call s:AskOllama(a:model, l:prompt)
endfunction

function! s:AskOllama(model, prompt)
	if executable("ollama")
	 	terminal
	 	call term_sendkeys("", "ollama run " . a:model . "\<cr>")
	 	call term_sendkeys("", a:prompt)
	else
	 	echohl WarningMsg
	 	echomsg "`ollama` is not executable, therefore it cannot be queried"
	 	echohl None
	endif
endfunction
