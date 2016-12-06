function! VimrcFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^"""') >= 0
    return '>1'
  else
    return '='
  endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=VimrcFolds()


function! VimrcFoldText()
  let foldsize = (v:foldend - v:foldstart)
  return getline(v:foldstart) . ' (' . foldsize . ' lines)'
endfunction

setlocal foldtext=VimrcFoldText()
