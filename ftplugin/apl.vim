let maplocalleader = '`'

let a = '`1234567890-=~!@#$%^&*()_+qwertyuiop[]QWERTYUIOP{}asdfghjkl;''\ASDFGHJKL:"|zxcvbnm,./ZXCVBNM<>?'
let b = '⋄¨¯<≤=≥>≠∨∧×÷⌺⌶⍫⍒⍋⌽⍉⊖⍟⍱⍲!⌹?⍵∊⍴~↑↓⍳○*←→?⍵⍷⍴⍨↑↓⍸⍥⍣⍞⍬⍺⌈⌊∥∇∆∘''⎕⍎⍕⊢⍺⌈⌊⊚∇∆⍤⌸⌷≡≢⊣⊂⊃∩∪⊥⊤|⍝⍀⌿⊆⊃∩∪⊥⊤|⍪⍙⍠'
let [A,B] = map([a,b], "split(v:val, '\\zs')")

for i in range(len(A))
	execute escape("inoremap <buffer> <localleader>" . A[i] . " " . B[i], '|')
endfor
