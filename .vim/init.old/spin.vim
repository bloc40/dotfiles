" run test for the whole file
noremap <D-r> :w<CR>\|:exe "!spin push %" <CR><CR>
" run test for specific line with spin push
noremap <D-R> :w<CR>\|:exe "!spin push %:\\" . line(".") <CR><CR>
