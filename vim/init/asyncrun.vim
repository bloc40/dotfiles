function! Ztatus()
  if g:asyncrun_status == 'success'
    return ' ✔ '
  elseif g:asyncrun_status == 'failure'
    return ' ✘ '
  else
    return ' 🏃 '
  endif
endfunction

function! StatusColor()
  return 1
endfunction

" View status
" augroup vimrc
"     autocmd QuickFixCmdPost * botright copen 8
" augroup END

augroup QuickfixStatus
    au! BufWinEnter quickfix setlocal
        \ statusline=%t\ %{Ztatus()}%*\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END

noremap <silent><F9> :call asyncrun#quickfix_toggle(8)<CR>


" ============================
" Tags generation for Ruby
" ============================
