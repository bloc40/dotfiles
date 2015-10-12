" ----------------------------------------
" --- Plugins ----------------------------
" ----------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
" Plug 'SirVer/ultisnips'
Plug 'bloc40/vim-replace'
Plug 'bloc40/vim-test-ruby'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'fatih/vim-go'
call plug#end()

" ---------------------------------------
" --- Setting ---------------------------
" ---------------------------------------
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set autowrite
set clipboard=unnamed
set dictionary="/usr/dict/words"
set diffopt+=vertical
set hidden
set history=100
set nobackup
set noswapfile
set nowrap
set nowritebackup
set number
set relativenumber
set scrolloff=1
set shortmess=at
set splitbelow

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set textwidth=120
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class,.git
hi colorcolumn ctermbg=0
set colorcolumn=+1

set foldmethod=indent
set foldnestmax=2
set nofoldenable
set foldlevel=1

let loaded_matchit=1
let mapleader = "\<Space>"

" ---------------------------------------
" --- Mappings --------------------------
" ---------------------------------------
map <leader>= mzgg=G`z
map <leader><leader> :wa<CR>
map <leader>d :tabe ~/Dropbox/notes/coding_notes.md<CR>
map <Leader>w mzgqap`z:w<CR>
map <silent><leader>z :ZoomBuffer<CR>
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l
cmap <C-A> <C-B>
imap <C-e> <C-o>$
imap <C-a> <C-o>^
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
cnoremap w!! w !sudo tee % >/dev/null
tnoremap <Esc> <C-\><C-n>
au Filetype ruby nmap <leader>r :RunCurrentLineInTest<CR><CR>
au Filetype ruby nmap <leader>rr :RunTestFile<CR><CR>
map <silent><leader>/ :Commentary<CR>j
map <leader>e :CtrlPBuffer<CR>
map <leader>f :Ag!<space>
nnoremap <leader>a :Ag! <C-R><C-W>
map <F1> :NERDTreeFind<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTree<CR>

if bufwinnr(1)
  map + 2<C-W>+
  map - 2<C-W>-
  map ( 5<C-W><
  map ) 5<C-W>>
end

" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>

"!!!!! Experimentals -------------------------
" list lines with word under the cursor
map <F5> [I:let nr = input("Which one: ") <Bar>exe "normal " . nr ."[\t"<CR>

" ---------------------------------------
" --- StatusLine ------------------------
" ---------------------------------------
hi User1 ctermbg=90  ctermfg=15
hi User2 ctermbg=Red ctermfg=Green

hi StatusLine   ctermbg=214      ctermfg=Black
hi StatusLineNC ctermbg=DarkGray ctermfg=Black

autocmd insertEnter * hi StatusLine ctermbg=27  ctermfg=White
autocmd InsertLeave * hi StatusLine ctermbg=214 ctermfg=Black

set statusline=
set statusline+=\ %*%<%f
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %2*%{&modified?'\ ☆\ \ ':''}%*
set statusline+=\ %1*%{ZoomedIn()}%*
set statusline+=%=%-5.(%y\ %l,%c%V%)\ %P\ " "

" ---------------------------------------
" --- Commands --------------------------
" ---------------------------------------
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile Gemfile.lock setfiletype ruby
autocmd FocusLost * silent! wa
autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
autocmd FileType css,scss,sass setlocal iskeyword+=-
autocmd FileType qf setlocal wrap linebreak

command! Q q
command! Noh noh
command! StrSym %s/\(['"]\)\([^ ]*\)\1/:\2/gc   " convert string into a symbol
command! SymStr %s/:\([^ ]*\)\(\s*\)/'\1'/gc    " convert symbol into a string
command! RubyHash %s/:\([^ ]*\)\(\s*\)=>/\1:/gc " convert to Ruby 1.9 syntax
command! FormatJson !python -m json.tool
command! Tags !ctags -R --exclude=.git --exclude=log --exclude=tmp * `bundle show --paths`/../*
command! V tabe $MYVIMRC
command! Vs so $MYVIMRC | echo 'Vimrc sourced :)'


runtime! init/**.vim

if filereadable(glob('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif
