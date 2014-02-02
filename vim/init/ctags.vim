" ctags with rails load path
map <leader>t :!rails runner 'puts $LOAD_PATH.join(" ")' \| xargs /usr/local/bin/ctags -R public/javascripts<CR>
map <leader>T :!rails runner 'puts $LOAD_PATH.join(" ")' \| xargs rdoc -f tags<CR>
