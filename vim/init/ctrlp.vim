" show the listing order of the matched files for ControlP (ex-CommandT) from top to bottom
let g:ctrlp_match_window_reversed = 0

"let g:ctrlp_custom_ignore = '^\.git'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ }

" override CtrlP to flush the file list
map <D-t> :CtrlPClearCache<CR>:CtrlP<CR>

" show open buffers
map <D-e> :CtrlPBuffer<CR>
