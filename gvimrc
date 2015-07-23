silent! source ~/.gvimrc.local

colorscheme railscasts

if has('gui_macvim')
  macmenu &File.New\ Tab key=<nop>
endif
