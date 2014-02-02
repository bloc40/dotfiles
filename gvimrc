silent! source ~/.gvimrc.local

if has('gui_macvim')
  macmenu &File.New\ Tab key=<nop>
endif
