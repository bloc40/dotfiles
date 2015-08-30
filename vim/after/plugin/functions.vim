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

function! GenerateRailsTags()
  exec ':!ctags -R --exclude=.git --exclude=log --exclude=tmp * `bundle show --paths`/../*'
endfunction
" --------------------------------------
" [Dispatch] run tests
" --------------------------------------
function! _SpinOrRspec()
  return system('ps ax | grep "spin serve" | grep -v grep') != '' ? 'spin push' : 'rspec'
endfunction

function! _IsNotTestFile()
  return match(expand('%:t'), '_spec.rb$') == -1
endfunction

function! _RunTest(param)
  if _IsNotTestFile()
    echo '!!! not a test file :(' | return
  endif
  exec ':wa'
  exec ':Dispatch ' . _SpinOrRspec() . ' ' . a:param
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
function! DuckDuckGo(...)
  exec ':silent !open http://duckduckgo.com?q=' . join(a:000, '+')
  redraw!
endfunction
