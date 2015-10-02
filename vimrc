" ------------------------------------------
" -- Load Plug-vim -------------------------
" ------------------------------------------
" install vim-plug if it does not exist
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

call plug#end()


" ------------------------------------------
" -- Settings ------------------------------
" ------------------------------------------
let loaded_matchit=1

set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set autowrite         " auto save when switching buffers
set clipboard=unnamed " make all operations work with the OS clipboard.
set dictionary="/usr/dict/words"
set diffopt+=vertical " always use vertical diffs
set expandtab         " indent without hard tab
set hidden            " allow Vim to manage multiple buffers effectively
set history=100
set nobackup          " remove swap and backup files from working directory
set noswapfile        " no swapfile
set nowrap            " no text wrapping
set nowritebackup
set number
set relativenumber
set scrolloff=1       " start the scrolling 3 lines before the border
set shiftwidth=2
set shortmess=at      " shortens about every message to a minimum and thus avoids scrolling within the output of messages and the 'press a key' prompt that goes with these. (set shm=at)
set softtabstop=2
set splitbelow        " put the cursor in the split below window
set textwidth=80      " (tw=80) limit the number of characters to 80 per line
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class,.git

" set statusline=\ %*%<%f\ %{fugitive#statusline()}%h%m%r%=%-5.(%y\ %l,%c%V%)\ %P\ " "
set statusline=\ %*%<%f
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %2*%{&modified?'\[+]':''}%*
set statusline+=\ %1*%{ZoomedIn()}%*
set statusline+=%=%-5.(%y\ %l,%c%V%)\ %P\ " "

" folding settings
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " dont fold by default
set foldlevel=1


" ------------------------------------------
" -- Mappings ------------------------------
" ------------------------------------------
let mapleader = "\<Space>"

map <leader>= mzgg=G`z
map <leader><leader> :wa<CR>
map <leader>d :tabe ~/Dropbox/notes/coding_notes.txt<CR>
map <leader>z :call MaximizeToggle()<CR>
map <Leader>w mzgqap`z:w<CR>
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
cnoremap w!! w !sudo tee % >/dev/null
tnoremap <Esc> <C-\><C-n>

" jump between windows
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l

" run Ruby tests
map <leader>r :call RunCurrentLineInTest()<CR><CR>
map <leader>rr :call RunTestFile()<CR><CR>
command! Spin !spin push spec

" [vim-commentary] comment/uncomment lines
map <silent><leader>/ :Commentary<CR>j

" [CtrlP]
map <leader>e :CtrlPBuffer<CR>

" [Ag]
map <leader>f :Ag!<space>
nnoremap <leader>a :Ag! <C-R><C-W>

" disable the arrow keys
" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>

" resizing windows
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map ( 5<C-W><
  map ) 5<C-W>>
end

" In command-line mode, <C-A> goes to the front of the line, as in bash.
cmap <C-A> <C-B>

" Emacs-like beginning and end of line.
imap <C-e> <C-o>$
imap <C-a> <C-o>^

"!!!!! Experimentals -------------------------
" list lines with word under the cursor
map <F5> [I:let nr = input("Which one: ") <Bar>exe "normal " . nr ."[\t"<CR>


" ------------------------------------------
" -- Commands ------------------------------
" ------------------------------------------
hi User1        ctermbg=Black ctermfg=Magenta guibg=#ff00ff guifg=#ffffff
hi User2        ctermbg=Red   ctermfg=White   guibg=#aa0000 guifg=#89a1a1
hi StatusLine   ctermfg=Black ctermbg=Yellow
hi StatusLineNC ctermfg=Black ctermbg=DarkGray
" change status line color in insert mode
autocmd insertEnter * hi StatusLine term=reverse ctermfg=White ctermbg=DarkBlue guisp=Blue
autocmd InsertLeave * hi StatusLine term=reverse ctermfg=Black ctermbg=Yellow

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile Gemfile.lock setfiletype ruby
autocmd FocusLost * silent! wa
autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
autocmd FileType css,scss,sass setlocal iskeyword+=-
autocmd FileType qf setlocal wrap linebreak
autocmd VimLeave * if filereadable('.vim/.netrwhist')|call delete('.vim/.netrwhist')|endif

command! Q q                                    " bind :Q to :q
command! Noh noh
command! StrSym %s/\(['"]\)\([^ ]*\)\1/:\2/gc   " convert string into a symbol
command! SymStr %s/:\([^ ]*\)\(\s*\)/'\1'/gc    " convert symbol into a string
command! RubyHash %s/:\([^ ]*\)\(\s*\)=>/\1:/gc " convert to Ruby 1.9 syntax
command! FormatJson !python -m json.tool
command! -nargs=* Duck call DuckDuckGo(<f-args>)
command! Tags !ctags -R --exclude=.git --exclude=log --exclude=tmp * `bundle show --paths`/../*

command! V tabe $MYVIMRC
command! Vs so $MYVIMRC | echo 'Vimrc sourced :)'


" local vimrc - keep this at the end
if filereadable(glob('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif
