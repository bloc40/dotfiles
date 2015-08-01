" run test for specific line with spin push
map <D-r> :wa<CR> \| :exe "!spin push %" <CR><CR>

" run test for the whole file
map <D-R> :wa<CR> \| :exe "!spin push %:" . line(".") <CR><CR>

" run all tests
command! Spin !spin push spec
