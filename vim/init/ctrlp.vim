" show the listing order of the matched files for ControlP (ex-CommandT) from top to bottom
let g:ctrlp_match_window_reversed = 0

let g:ctrlp_map = '<D-t>'
let g:ctrlp_cmd = 'CtrlP'

" use Rubymine way of opening a file
map <D-N> :CtrlPClearCache<CR>:CtrlP<CR>

" override CtrlP to flush the file list
map <D-t> :CtrlPClearCache<CR>:CtrlP<CR>

" show open buffers
map <D-e> :CtrlPBuffer<CR>
