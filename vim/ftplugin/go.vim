setlocal softtabstop=2
setlocal listchars=tab:\ \ ,trail:·,nbsp:·

compiler go

" ---------------------------------------
" https://github.com/fatih/vim-go
" ---------------------------------------

au Filetype go nmap <leader>r <Plug>(go-run)
au Filetype go nmap <leader>b <Plug>(go-build)
au Filetype go nmap <leader>t <Plug>(go-test)
au Filetype go nmap <leader>c <Plug>(go-coverage)
au Filetype go nmap <leader>s <Plug>(go-implements)
au Filetype go nmap <leader>gb <Plug>(go-doc-browser)

let g:go_fmt_autosave = 0
let g:go_fmt_command = 'goimports'

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
