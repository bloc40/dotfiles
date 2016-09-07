" ===========================================================================
" Plugins
" ===========================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

if !has('nvim')
  Plug 'SirVer/ultisnips'
endif
Plug 'bloc40/vim-replace'
Plug 'bloc40/vim-spin', { 'for': 'ruby' }
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" colorschemes
Plug 'nanotech/jellybeans.vim'
call plug#end()

" ===========================================================================
" Settings
" ===========================================================================
let loaded_matchit=1
let mapleader = "\<Space>"

if !has('nvim')
  set nocompatible
  filetype off
  filetype plugin indent on

  set autoread
  set backspace=indent,eol,start
  set encoding=utf-8
  set expandtab
  set hlsearch
  set incsearch
  set laststatus=2
  set mouse=a
  set noeb vb t_vb=
  set ttymouse=xterm2
endif

set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set autowrite
set clipboard=unnamed
set complete+=k,t
set dictionary=/usr/share/dict/words
set diffopt+=vertical
set hidden
set history=200
" set list listchars=tab:»·,trail:·,nbsp:·  " display extra whitespace
set nobackup
set noswapfile
set nowrap
set nowritebackup
set number
set scrolloff=1
set shortmess=at
set splitbelow
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class,.git

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set textwidth=80
set colorcolumn=+1
hi colorcolumn ctermbg=0

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" set spell
set spelllang=en_us

" ===========================================================================
" Mappings
" ===========================================================================
map + <C-W>+
map - <C-W>-
map ( 5<C-W><
map ) 5<C-W>>
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader><leader> :wa<CR>
map <leader>d :Vex ~/Dropbox/vim_notes/<CR>
map <leader>w mzgqap`z:w<CR>
" map <silent><leader>z :ZoomBuffer<CR>
cmap <C-a> <C-b>
imap <C-e> <C-o>$
imap <C-a> <C-o>^
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
cnoremap w!! w !sudo tee % >/dev/null
" nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>
map <silent><leader>/ :Commentary<CR>j
map <leader>e :CtrlPBuffer<CR>
map <leader>f :Ag!<space>
nnoremap <leader>a :Ag! <C-r><C-w>
map <F1> :NERDTreeFind<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTree<CR>
map 0 ^
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" highlight group of words
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>/<C-R>=@/<CR><CR>

" format text without jumping
function! s:ReIndent()
  let winview = winsaveview()
  execute "keepjumps normal! gg=G"
  call winrestview(winview)
endfunction
nnoremap <leader>= :call <SID>ReIndent()<CR>


"!!!!! Experimentals -------------------------
" list lines with word under the cursor
map <F5> [I:let nr = input('Which one: ') <Bar>exe 'normal ' . nr .'[\t'<CR>

" Instead of using man for word lookups, use the OSX dictionary
" nnoremap K :!open dict:///<cword><cr>

" ===========================================================================
" StatusLine
" ===========================================================================
hi User1 ctermbg=90  ctermfg=15
hi User2 ctermbg=Red ctermfg=White

hi StatusLine   ctermbg=214      ctermfg=Black
hi StatusLineNC ctermbg=DarkGray ctermfg=Black

autocmd insertEnter * hi StatusLine ctermbg=21  ctermfg=White
autocmd InsertLeave * hi StatusLine ctermbg=214 ctermfg=Black

set statusline=
set statusline+=\ %*%<%f
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %2*%{&modified?'\ ●\ ':''}%*
" set statusline+=\ %1*%{ZoomedIn()}%*
set statusline+=%=%-5.(%y\ %l,%c%V%)\ %P\ " "

" ===========================================================================
" Commands
" ===========================================================================
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile Gemfile.lock setfiletype ruby
autocmd FocusLost * silent! wa
autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
autocmd FileType css,scss,sass setlocal iskeyword+=-
autocmd FileType qf setlocal wrap linebreak
" autoclosing
autocmd Filetype javascript,json,html inoremap (<CR> (<CR>)<Esc>O
autocmd Filetype javascript,json,html,sh inoremap {<CR> {<CR>}<Esc>O
autocmd Filetype javascript,json,html inoremap [<CR> [<CR>]<Esc>O
autocmd Filetype javascript,json,html inoremap ({<CR> ({<CR>})<Esc>O
autocmd Filetype javascript,json,html inoremap [{<CR> [{<CR>}]<Esc>O

command! Q q
command! Noh noh
" command! StrSym %s/\(['"]\)\([^ ]*\)\1/:\2/gc   " convert string into a symbol
" command! SymStr %s/:\([^ ]*\)\(\s*\)/'\1'/gc    " convert symbol into a string
command! RubyHash %s/:\([^ ]*\)\(\s*\)=>/\1:/gc " convert to Ruby 1.9 syntax
command! JsonPP %!python -m json.tool
command! Tags !ctags -R --languages=-javascript,sql,python,sml --exclude=.git,log,tmp * `bundle show --paths`/../*
command! V tabe $MYVIMRC
command! Vs so $MYVIMRC | echo 'Vimrc sourced :)'


runtime! init/**.vim

if filereadable(glob('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif
