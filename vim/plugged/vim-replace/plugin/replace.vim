"==========================================================================================
" File:           vim-replace.vim
" Author:         Jamal El Milahi
" Date:           Mar 1, 2012
" Version:        0.0.2
" Description:    vim-replace.vim will let you do find and replace throughout
"                 your application
"==========================================================================================
"
" global find and replace
" e.g. :Replace old new

function! s:searcher()
  if exists(':Ag')
    return ':Ag! '
  else if exists(':Ack')
    return ':Ack! '
  else
    return 'You need to have Ag or Ack installed before using this plugin' | exit
  endif
endfunction

function! s:quickfix_filename()
  let l:buffer_numbers = {}
  for quickfix_item in getqflist()
    let l:buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(l:buffer_numbers), 'fnameescape(v:val)'))
endfunction

command! -nargs=1 -complete=command -bang Qfdo exe 'args ' . s:quickfix_filename() | argdo<bang> <args>
function! s:find_and_replace(old, new)
  exec s:searcher() . a:old
  exec ':q'
  exec ':Qfdo %s/' . a:old . '/' . a:new . '/gcIe | update'
endfunction

command! -nargs=+ Replace call s:find_and_replace(<f-args>)
