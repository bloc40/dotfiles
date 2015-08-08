let g:ackprg = 'ag --vimgrep'

" search for the word where the cursor is
nnoremap <leader>a :Ag! <C-R><C-W>
" open search files without opening the file with the first match
map <leader>f :Ag!<space>
