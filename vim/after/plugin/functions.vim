" --------------------------------------
" run Ruby tests
" --------------------------------------
function! s:spin_or_rspec()
  return system('ps ax | grep "spin serve" | grep -v grep') != '' ? 'spin push' : 'rspec'
endfunction

function! s:is_a_test_file()
  return match(expand('%:t'), '_spec.rb$') > 0
endfunction

function! s:print_warning() abort
  echohl WarningMsg
  echo '!!! not a test file :(' | return
  echohl None
endfunction

function! s:run_test(param)
  if s:is_a_test_file()
    exec ':wa'
    exec ':! ' . s:spin_or_rspec() . ' ' . a:param
  else
    call s:print_warning() | return
  endif
endfunction

function! RunCurrentLineInTest()
  call s:run_test('%:' . line('.'))
endfunction

function! RunTestFile()
  call s:run_test('%')
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
