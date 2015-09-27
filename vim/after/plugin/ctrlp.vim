let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$' }
let g:ctrlp_use_caching = 0

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
