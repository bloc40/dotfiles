" marks.vim - Enhanced :Marks command
function! s:Marks()
  marks abcdefghijklmnopqrstuvwxyz.
  echo 'Jumb to mark: '
  let marks = nr2char(getchar())
  redraw
  execute 'normal! `' . marks
endfunction

command! Marks call s:Marks()

" define a highlight colour group for bookmarks
hi default BookmarkCol ctermfg=blue ctermbg=lightblue cterm=bold guifg=DarkBlue guibg=#d0d0ff gui=bold
" define a bookmark / sign: just highlight the line
sign define MyBookmark linehl=BookmarkCol
" add something to the context menue (right mouse)
amenu 1.200 PopUp.-SEP3- :
amenu 1.200 PopUp.&mark.set\ bookmark :exe 'sign place 1000 name=MyBookmark line='.line(".").' buffer='.winbufnr(0)<CR>
amenu 1.200 PopUp.&mark.del\ bookmarks :sign unplace 1000 <CR>
amenu 1.200 PopUp.&mark.list\ bookmarks :sign list<CR>
