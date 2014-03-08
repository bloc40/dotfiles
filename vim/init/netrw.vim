let g:netrw_liststyle=3     " use tree-mode as default view
let g:netrw_browse_split=4 " open file in previous buffer
let g:netrw_preview=1       " preview window shown in a vertically split
let g:netrw_winsize=20      " when you preview the new file takes up 80% and the file explorer the other 20%.

" Toggle Vexplore with F2
function! ToggleVExplorer()
  if exists('t:expl_buf_num')
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      let cur_win_nr = winnr()
      exec expl_win_num . 'wincmd w'
      close
      exec cur_win_nr . 'wincmd w'
      unlet t:expl_buf_num
    else
      unlet t:expl_buf_num
    endif
  else
    exec '1wincmd w'
    Vexplore
    let t:expl_buf_num = bufnr('%')
  endif
endfunction

map <silent><F2> :call ToggleVExplorer()<CR>
