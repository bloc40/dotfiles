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
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/ZoomWin'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on


" ------------------------------------------
" -- Settings ------------------------------
" ------------------------------------------

syntax on     " highlight known syntaxes

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
set history=100
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
" set colorcolumn=+1
" hi colorcolumn ctermbg=8

set list listchars=tab:»·,trail:·,nbsp:·  " display extra whitespace
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class,.git
set statusline=\ %*%<%f\ %{fugitive#statusline()}%h%m%r%=%-5.(%y\ %l,%c%V%)\ %P\ " "

" folding settings
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " dont fold by default
set foldlevel=1

set clipboard=unnamed " make all operations work with the OS clipboard.


" ------------------------------------------
" -- Mappings ------------------------------
" ------------------------------------------
" ---- Free leader single letters: [d o p q x y]

let mapleader = "\<Space>"

" jump between windows
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l

map <leader>i mzgg=G`z
map <leader>w :w<CR>
map <leader>nh :noh<CR>
nmap <leader>v :tabe $MYVIMRC<CR>
nmap <leader>s :so $MYVIMRC<CR>:echo 'Vimrc sourced :)'<CR>

" wrap text
map <Leader>wr mmgqap`m:w<CR>

" open file in current directory
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
map <leader>e :e %%
map <leader>es :sp %%
map <leader>ev :vs %%
map <leader>et :tabe %%

map <leader>sc :sp db/schema.rb<CR>

map <leader>rf :call RenameFile()<CR>

" [Vundle]
nmap <leader>bi :so $MYVIMRC<CR>:PluginInstall<CR>
nmap <leader>bc :so $MYVIMRC<CR>:PluginClean<CR>
nmap <leader>bu :so $MYVIMRC<CR>:PluginUpdate<CR>

" [UltiSnips]
map <leader>u :UltiSnipsEdit<space>

" [vim-rails.vim]
map <leader>vu :Vunittest<CR>

" [ZoomWin] zoom in/out the current window
map <silent><leader>z :ZoomWin<CR>

" [vim-fugitive]
map <leader>g :Gstatus<CR>

" [vim-commentary] comment/uncomment lines
map <silent><leader>/ :Commentary<CR>j

" [vim-dispatch]
map <leader>r :w<CR>:call RunCurrentLineInTest()<CR>
map <leader>rr :w<CR>:call RunTestFile()<CR>
map <leader>ra :w<CR>:Dispatch! rake<CR>
map <leader>c :Copen<CR>

" [CtrlP]
" map <leader>t :CtrlPClearCache<CR>:CtrlP<CR>
map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>

" [Ag]
map <leader>f :Ag!<space>
nnoremap <leader>a :Ag! <C-R><C-W>

" WIP - mapping of the macros
" map <leader>xx "Ilet(:<ESC>ea)<ESC>f-f=s<ESC>urR<ESC>ur{A }<ESC>"
" map <leader>zz "Ilet(:^[ea(<80>kb)^[f=r{A }^["
" map <leader>zz "Ilet(:"<CR>

" ctags with rails load path
" map <leader>t :!rails runner 'puts $LOAD_PATH.join(" ")' \| ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp *<CR>
" map <leader>T :!rails runner 'puts $LOAD_PATH.join(" ")' \| xargs rdoc -f tags<CR>

" resizing windows
if bufwinnr(1)
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

" Emacs-like beginning and end of line.
imap <C-e> <C-o>$
imap <C-a> <C-o>^


" ------------------------------------------
" -- Commands ------------------------------
" ------------------------------------------

command! StrSym %s/\(['"]\)\([^ ]*\)\1/:\2/gc " convert string into a symbol
command! SymStr %s/:\([^ ]*\)\(\s*\)/'\1'/gc  " convert symbol into a string
command! RubyHash %s/:\([^ ]*\)\(\s*\)=>/\1:/gc " convert Ruby => to : ' '

command! FormatJson !python -m json.tool
" format JSON

command! Noh noh " bind Noh to noh
command! Q q     " bind :Q to :q

" Qfdo
command! -nargs=1 -complete=command -bang Qfdo exe 'args ' . QuickfixFilenames() | argdo<bang> <args>

" clear white space in the end of lines
autocmd BufWritePre * :%s/\s\+$//e

" associate the .es6 file extension with JavaScript
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" additional Ruby syntax highliting
autocmd BufRead,BufNewFile {Capfile,Gemfile,Gemfile.lock,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" autosave when focus is lost - GUI only :(
autocmd FocusLost * silent! :wa

" make ?s part of words
autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

" allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass setlocal iskeyword+=-

" wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" delete .netrwhist files
autocmd VimLeave * if filereadable(".vim/.netrwhist")|call delete(".vim/.netrwhist")|endif

hi StatusLine ctermfg=black ctermbg=yellow
hi StatusLineNC ctermfg=black ctermbg=darkgray
if version >= 700   " change status line color in insert mode
  au InsertEnter * hi StatusLine term=reverse ctermfg=black ctermbg=darkblue guisp=Blue
  au InsertLeave * hi StatusLine term=reverse ctermfg=black ctermbg=yellow
endif


runtime! init/**.vim    " source initialization files

" local vimrc - keep this at the end
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
