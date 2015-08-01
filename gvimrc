silent! source ~/.gvimrc.local

colorscheme railscasts

if has('gui_macvim')
  macmenu &File.New\ Tab key=<nop>
endif

set guioptions-=r   " hide scroll bars
set guioptions-=L
set guioptions-=T   " hide the toolbar

au FocusLost * silent! :wa    " autosave when focus is lost

" auto-indent the entire file
map <D-L> gg=G``
map <leader>= gg=G``
