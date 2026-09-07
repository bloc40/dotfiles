"==========================================
" Plugins (using vim-plug)
"==========================================
call plug#begin(stdpath('data') . '/plugged')

Plug 'ap/vim-css-color', { 'for': ['css', 'sass', 'scss'] }
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'github/copilot.vim'
Plug 'folke/tokyonight.nvim'
Plug 'SirVer/ultisnips'

call plug#end()

"==========================================
" General Settings
"==========================================
let mapleader = " "

set showmatch
" set history=200

colorscheme tokyonight-night

set autowrite
set clipboard=unnamedplus
set diffopt+=vertical
set nobackup noswapfile nowritebackup
set nowrap
set number
set scrolloff=1
set smoothscroll
set shortmess=at
set splitright splitbelow
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class,.git

" Indentation
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2

" Text formatting
set textwidth=100
set colorcolumn=+1

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Spell and completion
set complete+=k,t
set spelllang=en_us

"==========================================
" Key Mappings
"==========================================
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap ( 5<C-W><
nnoremap ) 5<C-W>>
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader><leader> :wa<CR>
nnoremap <leader>d :Vex ~/Dropbox/vim_notes/<CR>
nnoremap <leader>ww mzgqap`z:w<CR>
" Single line comment
nnoremap <silent><leader>/ :Commentary<CR>j
" Multiple lines comment
xnoremap <silent><leader>/ :Commentary<CR>j
nnoremap <leader>e :CtrlPBuffer<CR>
nnoremap <leader>f :silent grep!<space>
nnoremap <leader>a :silent grep! <C-r><C-w>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <F1> :NERDTreeFind<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTree<CR>

nnoremap 0 ^
xnoremap . :norm.<CR>
tnoremap <Esc> <C-\><C-n>

" Visual search mappings
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>/<C-R>=@/<CR><CR>

" Re-indent without moving cursor
function! s:ReIndent()
  let winview = winsaveview()
  execute "keepjumps normal! gg=G"
  call winrestview(winview)
endfunction
nnoremap <leader>= :call <SID>ReIndent()<CR>

"==========================================
" StatusLine
"==========================================
hi User2 guifg=red

hi StatusLine guibg=#ffd787   guifg=#000000   " focused = gold bg
hi StatusLineNC guibg=#333333 guifg=#808080   " unfocused = dim

augroup StatusLineColors
  autocmd!
  autocmd InsertEnter * highlight StatusLine guibg=#0000ff guifg=#ffff00
  autocmd InsertLeave * highlight StatusLine guibg=#ffd787 guifg=#000000
augroup END

set statusline=
set statusline+=\ %*%<%f
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %2*%{&modified?'\ ●\ ':''}%*
set statusline+=%=%-5.(%y\ %l,%c%V%)\ %P\

hi Search gui=NONE guifg=#000000 guibg=#5faf00

"==========================================
" Autocommands
"==========================================
augroup MyAutoCmds
  autocmd!
  autocmd BufWritePre * call <SID>StripTrailingWhitespace()
  autocmd BufRead,BufNewFile *.es7 setfiletype javascript
  autocmd BufRead,BufNewFile Gemfile.lock setfiletype ruby
  autocmd FocusLost * silent! wa
  autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
  autocmd FileType css,scss,sass setlocal iskeyword+=-
  autocmd FileType qf setlocal wrap linebreak
  autocmd FileType javascript,json,html inoremap <buffer> (<CR> (<CR>)<Esc>O
  autocmd FileType javascript,json,html,sh,go,elixir,css,scss inoremap <buffer> {<CR> {<CR>}<Esc>O
  autocmd FileType javascript,json,html,elixir inoremap <buffer> [<CR> [<CR>]<Esc>O
  autocmd FileType javascript,json,html inoremap <buffer> ({<CR> ({<CR>})<Esc>O
  autocmd FileType javascript,json,html inoremap <buffer> [{<CR> [{<CR>}]<Esc>O
  autocmd FileType elixir nmap <buffer> <leader>r :call ElixirTestLine()<CR>
  autocmd FileType elixir nmap <buffer> <leader>rr :!mix test %<CR>
  autocmd VimResized * wincmd =
  autocmd BufWritePre,FileWritePre * call <SID>AutoMakeDirectory()
augroup END

function! ElixirTestLine()
  exec ':!mix test %:' . line('.')
endfunction

function! <SID>StripTrailingWhitespace()
  if !&modifiable || &binary
    return
  endif
  let view = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(view)
endfunction

function! <SID>AutoMakeDirectory()
  let s:directory = expand('<afile>:p:h')
  if !isdirectory(s:directory)
    call mkdir(s:directory, 'p')
  endif
endfunction

"==========================================
" Commands
"==========================================
command! Q q
command! Noh noh
command! RubyHash %s/:\([^ ]*\)\(\s*\)=>/\1:/gc
command! JsonPP %!python3 -m json.tool
" command! Tags !ctags -R --languages=-javascript,sql,python,sml --exclude=.git,log,tmp * `bundle show --paths`/../*
command! Tags silent execute '!ctags -R' .
      \ ' --languages=-javascript,sql,python,sml' .
      \ ' --exclude=.git --exclude=log --exclude=tmp' .
      \ ' -f tags ' .
      \ ' . ' .
      \ join(split(system('bundle show --paths'), "\n"), ' ')

command! V tabe $MYVIMRC
command! Vs execute 'source ' . fnameescape($MYVIMRC) | redraw! | echom 'Vimrc sourced :)'

"==========================================
" Source additional configs
"==========================================
runtime! init/**.vim
