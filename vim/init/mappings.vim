" map for resizing windows
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map ( <C-W><
  map ) <C-W>>
end

" jump between windows
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l

" auto-indent the entire file
"map <D-L> gg=G<CR>''z.
map <D-L> gg=G``
map <leader>= gg=G``

" convert Ruby 1.8 to 1.9 hash syntax
map <D-H> :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>

" convert string into a symbol
command! StrSym %s/\(['"]\)\([^ ]*\)\1/:\2/gc

" convert symbol into a string
command! SymStr %s/:\([^ ]*\)\(\s*\)/'\1'/gc

" open .vimrc.after
command! V tabe ~/.vimrc
" update .vimrc.after file
command! Vs so ~/.vimrc

" Get off my lawn!!!
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" scroll the viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" format JSON using Python's json.tool module
command! FormatJson %!python -m json.tool

" search
nmap <leader>s :%s/
vmap <leader>s :s/

" In command-line mode, <C-A> should go to the front of the line, as in bash.
cmap <C-A> <C-B>
