" https://github.com/henrik/vim-qargs/blob/master/plugin/qargs.vim

command! -nargs=1 -complete=command -bang Qfdo exe 'args ' . QuickfixFilenames() | argdo<bang> <args>

function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
