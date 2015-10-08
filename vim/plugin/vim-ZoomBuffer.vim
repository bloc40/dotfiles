" -------------------------------------------
" Mark statusline when a window is zoomed in
" -------------------------------------------
function! ZoomedIn()
  if exists('s:maximize_session')
    return ' ZOOM '
  else
    return ''
  endif
endfunction

" --------------------------------------
" Toggle miximizing a split window
" --------------------------------------
function! s:zoom_buffer()
  if exists('s:maximize_session')
    exec 'source ' . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec 'mksession! ' . s:maximize_session
    only
  endif
endfunction
command! ZoomBuffer call s:zoom_buffer()
