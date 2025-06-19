" Visual colorscheme selection
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

command! -nargs=* Colorscheme call <SID>OpenColorschemes(<f-args>)

" Return all of the colorschemes on the runtime path in an alphabetically sorted list
function! s:GetColorschemes() abort
    let l:colorschemes = []
    for path in split(&runtimepath, ',')
        let l:files = glob(path . '/colors/*.vim', 0, 1)
        for file in l:files
            let l:name = fnamemodify(file, ':t:r')
            if !empty(l:name) && index(l:colorschemes, l:name) == -1
                call add(l:colorschemes, l:name)
            endif
        endfor
    endfor
    call sort(colorschemes)
    return colorschemes
endfunction

" Create a `colorscheme` buffer to select colorschemes. Set up mappings for this buffer as well
function! s:OpenColorschemes() abort
	let l:colorschemes = s:GetColorschemes()

	execute "silent! new"
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
	setlocal nonumber norelativenumber nolist

	call setline(1, l:colorschemes)

	let l:position = index(l:colorschemes, g:colors_name)
	if l:position != 0
		execute "silent! normal! gg" . l:position . "j"
	endif

	augroup Colorscheme
		autocmd!
		autocmd BufEnter,BufFilePost <buffer> call s:SetupMappings()
		" TODO Apply this only when line is changed.
		autocmd CursorMoved <buffer> call s:ColorMyPencils()
	augroup END

	file [colorschemes]
endfunction

" Mappings for `colorscheme` buffer
function! s:SetupMappings() abort
	nnoremap <buffer> <CR> <CMD>call <SID>ColorMyPencils()<CR><CMD>q<CR>
endfunction

" Set the colorscheme according to the text in the current line
function! s:ColorMyPencils() abort
	let l:colors = getline(".") 
	if l:colors !=# g:colors_name
		execute "colorscheme " . l:colors
	endif
endfunction
