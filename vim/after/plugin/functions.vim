" --------------------------------------
" Search DuckDuckGo from the Ex command
" --------------------------------------
function! DuckDuckGo(...)
  exec ':silent !open http://duckduckgo.com?q=' . join(a:000, '+')
  redraw!
endfunction

" --------------------------------------
" Toggle miximizing a split window
" --------------------------------------
function! ZoomedIn()
  if exists('s:maximize_session')
    return '[Zoom]'
  else
    return ''
  endif
endfunction

" --------------------------------------
" Toggle maximizing a split window
" --------------------------------------
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
