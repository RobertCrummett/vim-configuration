" For automatic license text
"
" [Robert] Nate Crummett
" robertcrummett@robertcrummett.com

let g:license_zeroclausebsd = "Permission to use, copy, modify, and/or distribute this software for\n"
			\ . "any purpose with or without fee is hereby granted.\n"
			\ . "\n"
			\ . "THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL\n"
			\ . "WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES\n"
			\ . "OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE\n"
			\ . "FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY\n"
			\ . "DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN\n"
			\ . "AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT\n"
			\ . "OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE."

command! License execute "normal! O" . g:license_zeroclausebsd . "\<ESC>9kI"
