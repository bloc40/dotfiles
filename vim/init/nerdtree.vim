if executable('ag')
  " Use 'ag' in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g "" --hidden --nocolor'
endif
