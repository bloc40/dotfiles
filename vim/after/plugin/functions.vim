" --------------------------------------
" run Ruby tests
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
  exec ':! ' . _SpinOrRspec() . ' ' . a:param
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

" --------------------------------------
" Toggle miximizing a split window
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
