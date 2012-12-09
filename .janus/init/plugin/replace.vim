"==========================================================================================
" File:           replace.vim
" Author:         Jamal El Milahi
" Date:           Mar 1, 2012
" Version:        0.0.1
" Description:    replace.vim will let you do find and replace throughout your application
"==========================================================================================
"
" global find and replace
" e.g. (default are Ruby files):                        :Replace old new
" e.g. (for non Ruby files you specify the extension):  :Replace old new js


command! -nargs=+ Replace :call Replace(<f-args>)

function! Replace(from, to, ...)
  let extension = a:0 > 0 ? a:1 : 'rb'
  exe 'args **/*.'. extension
  exe 'argdo %s/'. a:from .'/'. a:to .'/gcIe | update'
endfunction
