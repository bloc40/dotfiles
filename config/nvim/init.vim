"==========================================
" Plugins (using vim-plug)
"==========================================
call plug#begin(stdpath('data') . '/plugged')

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
Plug 'github/copilot.vim'
Plug 'folke/tokyonight.nvim'
" Plug 'neoclide/coc.nvim'
Plug 'SirVer/ultisnips'

call plug#end()

"==========================================
" General Settings
"==========================================
let mapleader = " "

set showmatch
set inccommand=nosplit
set hidden
set history=200

set background=light
colorscheme tokyonight-night

set autowrite
set clipboard=unnamedplus
set diffopt+=vertical
set nobackup noswapfile nowritebackup
set nowrap
set number
set scrolloff=1
set shortmess=at
set splitright splitbelow
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class,.git

" Indentation
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2

" Text formatting
set textwidth=100
set colorcolumn=+1
hi ColorColumn ctermbg=0

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
nnoremap <leader>f :Ag!<space>
nnoremap <leader>a :Ag! <C-r><C-w>

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

" Seeing is believing
nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>
nmap <leader>c :%.!seeing_is_believing --clean<CR>

"==========================================
" StatusLine
"==========================================
hi User1 ctermbg=178 ctermfg=Black
" hi User2 ctermbg=Red  ctermfg=White
hi User2 guifg=red    ctermfg=red
hi User3 ctermbg=8    ctermfg=7
hi User4 ctermbg=172  ctermfg=Black
hi User5 ctermbg=166  ctermfg=Black

" hi StatusLine   ctermbg=220 ctermfg=Black
" hi StatusLineNC ctermbg=8   ctermfg=Black
hi StatusLine guibg=#ffd787   guifg=#000000   " focused = gold bg
hi StatusLineNC guibg=#333333 guifg=#808080   " unfocused = dim

augroup StatusLineColors
  autocmd!
  autocmd InsertEnter * highlight StatusLine ctermbg=21  ctermfg=Yellow
  autocmd InsertLeave * highlight StatusLine ctermbg=251 ctermfg=Black
augroup END

set statusline=
set statusline+=\ %*%<%f
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %2*%{&modified?'\ ●\ ':''}%*
set statusline+=%=%-5.(%y\ %l,%c%V%)\ %P\

hi Search cterm=NONE ctermfg=black ctermbg=70

"==========================================
" Autocommands
"==========================================
augroup MyAutoCmds
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufRead,BufNewFile *.es7 setfiletype javascript
  autocmd BufRead,BufNewFile Gemfile.lock setfiletype ruby
  autocmd FocusLost * silent! wa
  autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
  autocmd FileType css,scss,sass setlocal iskeyword+=-
  autocmd FileType qf setlocal wrap linebreak
  autocmd FileType javascript,json,html inoremap (<CR> (<CR>)<Esc>O
  autocmd FileType javascript,json,html,sh,go,elixir,css,scss inoremap {<CR> {<CR>}<Esc>O
  autocmd FileType javascript,json,html,elixir inoremap [<CR> [<CR>]<Esc>O
  autocmd FileType javascript,json,html inoremap ({<CR> ({<CR>})<Esc>O
  autocmd FileType javascript,json,html inoremap [{<CR> [{<CR>}]<Esc>O
  autocmd FileType elixir nmap <buffer> <leader>r :call ElixirTestLine()<CR>
  autocmd FileType elixir nmap <buffer> <leader>rr :!mix test %<CR>
  autocmd VimResized * wincmd =
  autocmd BufWritePre,FileWritePre * call <SID>AutoMakeDirectory()
augroup END

function! ElixirTestLine()
  exec ':!mix test %:' . line('.')
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
command! RubyHash %s/:$begin:math:text$[^ ]*$end:math:text$$begin:math:text$\\s*$end:math:text$=>/\1:/gc
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
