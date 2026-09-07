" Fold init.vim by its section headers:
"   "==========================================
"   " Section title
"   "==========================================
" A fold starts at the top border of each header.
function! VimrcFolds()
  if getline(v:lnum) =~# '^"=\{3,}' && getline(v:lnum + 1) =~# '^" \S'
    return '>1'
  endif
  return '='
endfunction

function! VimrcFoldText()
  let title = substitute(getline(v:foldstart + 1), '^"\s*', '', '')
  return title . ' (' . (v:foldend - v:foldstart + 1) . ' lines)'
endfunction

setlocal foldmethod=expr
setlocal foldexpr=VimrcFolds()
setlocal foldtext=VimrcFoldText()
