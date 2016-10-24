au Filetype ruby nmap <silent><leader>r :RunFocusedTest<CR>
au Filetype ruby nmap <silent><leader>rr :RunTestFile<CR>


function! s:run_test_file()
  call s:run_test('%')
endfunction
command! RunTestFile call s:run_test_file()

function! s:run_focused_test()
  call s:run_test('%:' . line('.'))
endfunction
command! RunFocusedTest call s:run_focused_test()


function! s:run_test(param)
  if s:is_a_test_file()
    exec ':wa'
    exec ':AsyncRun rspec ' . a:param
  else
    call s:print_warning() | return
  endif
endfunction

function! s:is_a_test_file()
  return match(expand('%:t'), '_spec.rb$') > 0
endfunction

function! s:print_warning() abort
  echohl WarningMsg
  echo '!!! not a test file :(' | return
  echohl None
endfunction

