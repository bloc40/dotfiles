" Fold init.vim by its section headers, a three-line block:
"   " ---...      (border: a comment holding only dashes, 3 or more)
"   " Title
"   " ---...
" A fold starts at the top border. Spacing after the quote doesn't matter.
function! VimrcFolds()
  let border = '^"\s*-\{3,}\s*$'
  if getline(v:lnum) =~# border
        \ && getline(v:lnum + 1) =~# '^"\s*\S' && getline(v:lnum + 1) !~# border
        \ && getline(v:lnum + 2) =~# border
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
