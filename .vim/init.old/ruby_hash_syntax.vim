" Change hash syntax from => to :
command! ChangeHashSyntax call ChangeHashSyntax()
function! ChangeHashSyntax()
	exec ':%s/:\([^ )]\+\) =>/\1:/gc'
endfunction
