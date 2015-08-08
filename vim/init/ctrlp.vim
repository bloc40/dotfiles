let g:ctrlp_match_window_reversed = 0

let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$' }

" override CtrlP to flush the file list
map <D-t> :CtrlPClearCache<CR>:CtrlP<CR>
map <leader>t :CtrlPClearCache<CR>:CtrlP<CR>

" show open buffers
map <D-e> :CtrlPBuffer<CR>
map <leader>e :CtrlPBuffer<CR>
