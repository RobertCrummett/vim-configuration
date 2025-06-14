" Git command for Vim
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

command! -nargs=* Git call <SID>RunGit(<f-args>)

function! s:RunGit(...)
	let l:args = join(a:000, ' ')
	let l:auto_close_cmds = ['add', 'commit', 'push', 'pull', 'switch']
	let l:subcmd = matchstr(l:args, '^\s*\zs\S\+')

	if index(l:auto_close_cmds, l:subcmd) >= 0
		execute 'silent! !git ' . l:args
		redraw!
	else
		let l:output = systemlist('git ' . l:args)
		if v:shell_error
			echohl ErrorMsg | echomsg 'Git command failed: Git ' . l:args | echohl None
		endif
		call setqflist([], 'r', {'title': 'Git ' . l:args, 'lines': l:output})
		copen
	endif
endfunction
