" -------------------------------------------
" Mark statusline when a window is zoomed in
" -------------------------------------------
" function! ZoomedIn()
"   if exists('s:maximize_sesion')
"     return ' ZOOM '
"   else
"     return ''
"   endif
" endfunction

" --------------------------------------
" Toggle miximizing a split window
" --------------------------------------
" function! s:zoom_buffer()
"   if exists('s:maximize_session')
"     exec 'source ' . s:maximize_session
"     call delete(s:maximize_session)
"     unlet s:maximize_session
"     let &hidden=s:maximize_hidden_save
"     unlet s:maximize_hidden_save
"   else
"     let s:maximize_hidden_save = &hidden
"     let s:maximize_session = tempname()
"     set hidden
"     exec 'mksession! ' . s:maximize_session
"     only
"   endif
" endfunction
" command! ZoomBuffer call s:zoom_buffer()


" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
map <silent><leader>z :ZoomToggle<CR>
