nmap <leader>t= :Tabularize/=<CR>
vmap <leader>t= :Tabularize/=<CR>
nmap <leader>t: :Tabularize/:\zs<CR>
vmap <leader>t: :Tabularize/:\zs<CR>
nmap <leader>t: :Tabularize/,\zs<CR>
vmap <leader>t: :Tabularize/,\zs<CR>

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
