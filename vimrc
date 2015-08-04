" don't maintain compatibility with vi
set nocompatible
filetype off

" Vundle. This must happen first
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" bundles
Plugin 'SirVer/ultisnips'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/ZoomWin'

call vundle#end()
filetype plugin indent on


" ------------------------------------------
" -- Settings ------------------------------
" ------------------------------------------

syntax on     " highlight known syntaxes

let mapleader = "\<Space>"

set guifont=Inconsolata:h16
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set hidden            " allow Vim to manage multiple buffers effectively
set hlsearch          " highlight search
set incsearch         " move the cursor to the matched string while searching
set nowrap            " no text wrapping
set nobackup          " remove swap and backup files from working directory
set nowritebackup
set noswapfile        " no swapfile
set history=50
set number            " show line numbers
set autoread          " auto save files when changed by another editor
set autowrite         " auto save when switching buffers
set mouse=a           " mouse scrolling
set ttymouse=xterm
set splitbelow        " put the cursor in the split below window
set scrolloff=3       " start the scrolling 3 lines before the border
set noeb vb t_vb=     " no error or visual bells please
set laststatus=2      " always diplay the status line. (set ls=2)
set shortmess=at      " shortens about every message to a minimum and thus avoids scrolling within the output of messages and the 'press a key' prompt that goes with these. (set shm=at)
set wildmenu          " show possible completions of command line commands, file names, and more
set expandtab         " indent without hard tab
set shiftwidth=2
set softtabstop=2
set diffopt+=vertical " always use vertical diffs
set textwidth=80      " (tw=80) limit the number of characters to 80 per line
set colorcolumn=+1
hi colorcolumn ctermbg=8

set list listchars=tab:»·,trail:·,nbsp:·  " display extra whitespace

" ignore these files
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class,.git

" add git branch to status line
" set statusline=[%n]\ %*%<%f\ %h%m%r%{fugitive#statusline()}%=%-16.(%y\ %l/%L,%c%V%)\ %P
set statusline=\ %*%<%f\ %{fugitive#statusline()}%h%m%r%=%-5.(%y\ %l,%c%V%)\ %P\ " "

" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1

" set clipboard=unnamed    " make all operations work with the OS clipboard.
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif


" ------------------------------------------
" -- Mappings ------------------------------
" ------------------------------------------

" jump between windows
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l

if bufwinnr(1)    " resizing windows
  map + <C-W>+
  map - <C-W>-
  map ( <C-W><
  map ) <C-W>>
end

" disable the arrow keys
" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>

" scroll the viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" In command-line mode, <C-A> goes to the front of the line, as in bash.
cmap <C-A> <C-B>

" open file in current directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" open .vimrc
nmap <leader>v :tabe $MYVIMRC<CR>
" source .vimrc
nmap <leader>vs :so $MYVIMRC<CR>


" ------------------------------------------
" -- Commands ------------------------------
" ------------------------------------------

command! StrSym %s/\(['"]\)\([^ ]*\)\1/:\2/gc " convert string into a symbol
command! SymStr %s/:\([^ ]*\)\(\s*\)/'\1'/gc  " convert symbol into a string

" format JSON
command! FormatJson %!python -m json.tool

" convert Ruby 1.8 to 1.9 hash syntax
command! RubyHash :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc

" associate the .es6 file extension with JavaScript
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" clear white space in the end of lines
autocmd BufWritePre * :%s/\s\+$//e

" additional Ruby syntax highliting
autocmd BufRead,BufNewFile {Capfile,Gemfile,Gemfile.lock,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" autosave when focus is lost
autocmd FocusLost * silent! :wa

" allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass setlocal iskeyword+=-

" delete .netrwhist files
autocmd VimLeave * if filereadable(".vim/.netrwhist")|call delete(".vim/.netrwhist")|endif

" autocmd FileType gitcommit setlocal textwidth=72
" autocmd FileType gitcommit setlocal spell


runtime! init/**.vim    " source initialization files

" local vimrc - keep this at the end
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
