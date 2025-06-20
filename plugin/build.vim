" Asynchronous building
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

if exists('g:build_loaded')
	finish
endif
let g:build_loaded = 0

command! -nargs=* -complete=file Build call <SID>BuildAsync(<q-args>)

function! s:BuildAsync(directives) abort
	let l:cmd = join([expandcmd(&makeprg), expandcmd(a:directives)])
	let l:temp = tempname()
	let l:error = tempname()
	execute 'silent !start /min cmd /c "' . l:cmd . ' >' . l:temp . ' 2>' . l:error
			\ . ' & vim --servername ' . v:servername
			\ . " --remote-expr \"GetBuildText('" . l:temp . "', '" . l:error . "')\""
endfunction

function! GetBuildText(temp, error)
	let l:tempfsize = getfsize(a:temp)
	let l:errorfsize = getfsize(a:error)

	if l:tempfsize > 0 && l:errorfsize == 0
		execute "cgetfile " . a:temp
		echomsg "Build successful!"
	endif

	if l:tempfsize == 0 && l:errorfsize > 0
		execute "cfile " . a:error
		botright copen
		wincmd p
		redraw
	endif

	if l:tempfsize > 0 && l:errorfsize > 0
		execute "cgetfile " . a:temp
		execute "caddfile " . a:error
		botright copen
		wincmd p
		redraw
	endif

	call delete(a:temp)
	call delete(a:error)
endfunction
