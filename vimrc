" --- don't maintain compatibility with vi
set nocompatible
filetype off

" --- Vundle. This must happen first
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" --- let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" --- bundles
Plugin 'SirVer/ultisnips'
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

" --- highlight known syntaxes
syntax on

let mapleader = "\<Space>"


" ------------------------------------------
" -- Settings ------------------------------
" ------------------------------------------

set guifont=Inconsolata:h16
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set hidden      " allow Vim to manage multiple buffers effectively
set hlsearch    " highlight search
set incsearch   " move the cursor to the matched string while typing the search pattern
set nowrap      " no text wrapping
set number      " show line numbers

" mouse scrolling
set mouse=a
set ttymouse=xterm

" ignore these files
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class,.git

" add git branch to status line
" set statusline=[%n]\ %*%<%f\ %h%m%r%{fugitive#statusline()}%=%-16.(%y\ %l/%L,%c%V%)\ %P
set statusline=\ %*%<%f\ %{fugitive#statusline()}%h%m%r%=%-5.(%y\ %l,%c%V%)\ %P\ " "

set nobackup      " remove swap and backup files from working directory
set nowritebackup

" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1         " this is just what i use

set splitbelow          " put the cursor in the split below window

" set clipboard=unnamed    " make all operations work with the OS clipboard.
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set scrolloff=3       " start the scrolling 3 lines before the border
set noeb vb t_vb=     " no error or visual bells please
set autoread          " auto save files when changed by another editor
set autowrite         " auto save when switching buffers
set noswapfile        " nwswapfile

set expandtab         " indent without hard tab
set shiftwidth=2
set softtabstop=2

set laststatus=2      " show a status line even when only one window is shown. (set ls=2)
set shortmess=at      " shortens about every message to a minimum and thus avoids scrolling within the output of messages and the 'press a key' prompt that goes with these. (set shm=at)
set wildmenu          " show possible completions of command line commands, file names, and more

set textwidth=80      " (tw=80) limit the number of characters to 80 per line
set colorcolumn=81
hi ColorColumn ctermbg=8



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


" ------------------------------------------
" -- Commands ------------------------------
" ------------------------------------------
command! StrSym %s/\(['"]\)\([^ ]*\)\1/:\2/gc " convert string into a symbol
command! SymStr %s/:\([^ ]*\)\(\s*\)/'\1'/gc  " convert symbol into a string
command! V tabe ~/.vimrc                      " open .vimrc
command! Vs so ~/.vimrc                       " source .vimrc
" format JSON
command! FormatJson %!python -m json.tool

" convert Ruby 1.8 to 1.9 hash syntax
command! RubyHash :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc

" associate the .es6 file extension with JavaScript
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

au BufWritePre * :%s/\s\+$//e " clear white space in the end of lines

" additional Ruby syntax highliting
au BufRead,BufNewFile {Capfile,Gemfile,Gemfile.lock,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" au VimLeave * if filereadable(".vim/.netrwhist")|call delete(".vim/.netrwhist")|endif


" --- Source initialization files
runtime! init/**.vim

" --- Machine-local vim settings - keep this at the end
silent! source ~/.vimrc.local
