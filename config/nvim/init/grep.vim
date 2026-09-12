" Built-in :grep backed by ripgrep. Results go to the quickfix list, so ]q / [q,
" :cdo and :cfdo all work. Use :grep! to search without jumping to the first hit.
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

augroup GrepQuickFix
  autocmd!
  autocmd QuickFixCmdPost grep,grepadd cwindow | redraw!
augroup END

" --------------
" how to use:
" --------------
" rg <pattern>
" rg -l <pattern>
" rg -i <pattern>
" rg -g '*.rb' <pattern>
" rg --hidden <pattern>
" rg --files
