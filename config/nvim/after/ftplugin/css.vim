" vim-polyglot resets commentstring to Neovim's (empty) default, which breaks
" vim-commentary. Restore the CSS block comment.
setlocal commentstring=/*\ %s\ */
