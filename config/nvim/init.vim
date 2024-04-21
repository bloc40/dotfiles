" call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color', { 'for': ['css', 'sass', 'scss'] }
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'preservim/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'yuttie/comfortable-motion.vim'
Plug 'hwartig/vim-seeing-is-believing', { 'for': 'ruby' }
call plug#end()

" ----------------------------------------
" Added for Neovim found in https://builtin.com/software-engineering-perspectives/neovim-configuration
set nocompatible " disable compatibility to old-time vi
set showmatch    " show matching
" set cursorline   " highlight current cursorline

" ----------------------------------------

""" Settings
let loaded_matchit=1
let mapleader = "\<Space>"

set inccommand=nosplit

syntax enable
set path+=**
set background=light
let g:solarized_termtrans=1
colorscheme solarized

set autowrite
" if $TMUX == ''
  set clipboard=unnamed
" end
" set dictionary=/usr/share/dict/words
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
" set showcmd
set splitright
set splitbelow
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class,.git
" set gdefault

set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2

set textwidth=100
set colorcolumn=+1
hi colorcolumn ctermbg=0

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" set spell
set complete+=k,t
set spelllang=en_us


""" Mappings
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
map <leader>ww mzgqap`z:w<CR>
" map <silent><leader>z :ZoomBuffer<CR>
cmap <C-a> <C-b>
" imap <C-e> <C-o>$
imap <C-a> <C-o>^
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
cnoremap w!! w !sudo tee % >/dev/null
" nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>
map <silent><leader>/ :Commentary<CR>j
map <leader>e :CtrlPBuffer<CR>
map <leader>f :Ag!<space>
nnoremap <leader>a :Ag! <C-r><C-w>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <F1> :NERDTreeFind<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTree<CR>

map 0 ^
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Make dot work over visual line selections
xnoremap . :norm.<CR>

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

" Annotate every line
nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR><space><space>
" Remove annotations
nmap <leader>c :%.!seeing_is_believing --clean<CR><space><space>

"!!!!! Experimentals -------------------------
" list lines with word under the cursor
map <F5> [I:let nr = input('Which one: ') <Bar>exe 'normal ' . nr .'[\t'<CR>
" set makeprg=bundle\ exec\ rspec\ %\ -f\ QuickfixFormatter

" Instead of using man for word lookups, use the OSX dictionary
" nnoremap K :!open dict:///<cword><cr>

" set cuc cul" " highlight the current column/row


""" StatusLine
hi User1 ctermbg=178 ctermfg=Black
hi User2 ctermbg=Red ctermfg=White
hi User3 ctermbg=8   ctermfg=7
hi User4 ctermbg=172 ctermfg=Black
hi User5 ctermbg=166 ctermfg=Black

hi StatusLine   ctermbg=251 ctermfg=Black
hi StatusLineNC ctermbg=8 ctermfg=Black

autocmd insertEnter * hi StatusLine ctermbg=21 ctermfg=White
autocmd InsertLeave * hi StatusLine ctermbg=251 ctermfg=Black

" set statusline=
" set statusline+=%4*\ %<%f
" set statusline+=%1*\ %{fugitive#statusline()}
" set statusline+=\ %2*%{&modified?'\ ●\ ':''}%*
" set statusline+=%=%-5.(%1*%y\ %4*\ %l,%c%V%)\ %*
" set statusline+=%5*\ %P\ %*

set statusline=
set statusline+=\ %*%<%f
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %2*%{&modified?'\ ●\ ':''}%*
" set statusline+=\ %1*%{ZoomedIn()}%*
set statusline+=%=%-5.(%y\ %l,%c%V%)\ %P\ " "

hi Search cterm=NONE ctermfg=black ctermbg=70

""" Commands
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.es7 setfiletype javascript
autocmd BufRead,BufNewFile Gemfile.lock setfiletype ruby
autocmd FocusLost * silent! wa
autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
autocmd FileType css,scss,sass setlocal iskeyword+=-
autocmd FileType qf setlocal wrap linebreak
" autoclosing
autocmd Filetype javascript,json,html inoremap (<CR> (<CR>)<Esc>O
autocmd Filetype javascript,json,html,sh,go,elixir,css,scss inoremap {<CR> {<CR>}<Esc>O
autocmd Filetype javascript,json,html,elixir inoremap [<CR> [<CR>]<Esc>O
autocmd Filetype javascript,json,html inoremap ({<CR> ({<CR>})<Esc>O
autocmd Filetype javascript,json,html inoremap [{<CR> [{<CR>}]<Esc>O

function! ElixirTestLine()
  exec ':!mix test %:' . line('.')
endfunction
autocmd Filetype elixir nmap <leader>r :call ElixirTestLine()<CR>
autocmd Filetype elixir nmap <leader>rr :!mix test %<CR>

autocmd VimResized * wincmd = " Automatically equalize splits when Vim is resized

command! Q q
command! Noh noh
" command! StrSym %s/\(['"]\)\([^ ]*\)\1/:\2/gc   " convert string into a symbol
" command! SymStr %s/:\([^ ]*\)\(\s*\)/'\1'/gc    " convert symbol into a string
command! RubyHash %s/:\([^ ]*\)\(\s*\)=>/\1:/gc " convert to Ruby 1.9 syntax
command! JsonPP %!python -m json.tool
command! Tags !ctags -R --languages=-javascript,sql,python,sml --exclude=.git,log,tmp * `bundle show --paths`/../*
command! V tabe $MYVIMRC
command! Vs so $MYVIMRC | echo 'Vimrc sourced :)'

" Create file in a folder if it doesn't exist
function! <SID>AutoMakeDirectory()
  let s:directory = expand('<afile>:p:h')
  if !isdirectory(s:directory)
    call mkdir(s:directory, 'p')
  endif
endfunction
autocmd BufWritePre,FileWritePre * :call <SID>AutoMakeDirectory()


runtime! init/**.vim

if filereadable(glob('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif
