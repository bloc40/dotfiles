" --------------------------------------
" Global find and replace
" --------------------------------------
" https://github.com/henrik/vim-qargs/blob/master/plugin/qargs.vim
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

command! -nargs=1 -complete=command -bang Qfdo exe 'args ' . QuickfixFilenames() | argdo<bang> <args>
function! FindReplace(old, new)
  exec ':Ag! ' . a:old
  exec ':q'
  exec ':Qfdo %s/' . a:old . '/' . a:new . '/gcIe | update'
endfunction

" --------------------------------------
" Rename a file
" --------------------------------------
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" --------------------------------------
" [Dispatch] run tests
" --------------------------------------
function! _RunTest(param)
  if match(expand('%:t'), '_spec.rb$') != -1
    exec ':Dispatch rspec ' . a:param
  else
    echo '!!! not a test file :('
  endif
endfunction

function! RunCurrentLineInTest()
  call _RunTest('%:' . line('.'))
endfunction

function! RunTestFile()
  call _RunTest('%')
endfunction

" --------------------------------------
" Search DuckDuckGo from the Ex command
" --------------------------------------
function! Duck(...)
  exec ':silent !open http://duckduckgo.com?q=' . join(a:000, '+')
  redraw!
endfunction
