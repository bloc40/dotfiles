" ------------------------------------------
" Plugins (using vim-plug)
" ------------------------------------------
call plug#begin(stdpath('data') . '/plugged')

Plug 'ap/vim-css-color', { 'for': ['css', 'sass', 'scss'] } " highlight CSS colors
Plug 'ctrlpvim/ctrlp.vim'    " fuzzy file finder
Plug 'ervandew/supertab'     " use tab for completion
Plug 'folke/tokyonight.nvim' " provide Tokyo Night color scheme
Plug 'github/copilot.vim'    " integrate GitHub Copilot
Plug 'godlygeek/tabular'     " align text
Plug 'karb94/neoscroll.nvim' " provide smooth scrolling
Plug 'neovim/nvim-lspconfig' " configure LSP
Plug 'preservim/nerdtree'    " explore the filesystem
Plug 'SirVer/ultisnips'      " provide snippet support
Plug 'sheerun/vim-polyglot'  " support multiple languages
Plug 'tpope/vim-abolish'     " easily search and replace words
Plug 'tpope/vim-commentary'  " comment out code
Plug 'tpope/vim-endwise'     " automatically add 'end' in Ruby, etc.
Plug 'tpope/vim-fugitive'    " integrate Git
Plug 'tpope/vim-rails'       " support Ruby on Rails
Plug 'tpope/vim-repeat'      " repeat commands
Plug 'tpope/vim-surround'    " easily manipulate surrounding characters
Plug 'tpope/vim-unimpaired'  " provide handy mappings

call plug#end()

" ------------------------------------------
" General Settings
" ------------------------------------------
let mapleader = " "

set showmatch

" Load the colorscheme only when it isn't already active, so re-sourcing
" (:Vs) doesn't run :hi clear and flash the buffer's colors off.
if !exists('g:colors_name') || g:colors_name !=# 'tokyonight-night'
  colorscheme tokyonight-night
endif

set autowrite
set clipboard=unnamedplus
set diffopt+=vertical
set noswapfile nowritebackup
set undofile                      " undo history survives closing the file
set nowrap
set number
set scrolloff=1
set shortmess+=a
set splitright splitbelow
set signcolumn=yes                " gutter always open, so text doesn't shift with diagnostics
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
set complete+=t
set spelllang=en_us

" ------------------------------------------
" Key Mappings
" ------------------------------------------
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
" move the selected lines down / up, re-indenting
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv
tnoremap <Esc> <C-\><C-n>

" %% on the command line expands to the current file's directory, e.g. :e %%
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h') ==# '' ? '.' : expand('%:h')).'/' : '%%'

" Visual search mappings
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" Re-indent without moving cursor
function! s:ReIndent()
  let winview = winsaveview()
  execute "keepjumps normal! gg=G"
  call winrestview(winview)
endfunction
nnoremap <leader>= :call <SID>ReIndent()<CR>

" Substitute the whole word under the cursor across the file; type the
" replacement, then <CR>. e.g. cursor on 'total' -> :%s/\<total\>//g
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" ------------------------------------------
" StatusLine
" ------------------------------------------
hi User1 guifg=red

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
set statusline+=\ %1*%{&modified?'\ ●\ ':''}%*
set statusline+=%=%-5.(%y\ %l,%c%V%)\ %P\

hi Search gui=NONE guifg=#000000 guibg=#5faf00

" ------------------------------------------
" Autocommands
" ------------------------------------------
augroup MyAutoCmds
  autocmd!
  autocmd BufWritePre * call <SID>StripTrailingWhitespace()
  autocmd BufRead,BufNewFile Gemfile.lock setfiletype ruby
  autocmd FocusLost * silent! wa
  autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
  autocmd FileType scss setlocal iskeyword+=-
  autocmd FileType qf setlocal wrap linebreak
  autocmd FileType javascript,json,html inoremap <buffer> (<CR> (<CR>)<Esc>O
  autocmd FileType javascript,json,html,sh,go inoremap <buffer> {<CR> {<CR>}<Esc>O
  autocmd FileType javascript,json,html inoremap <buffer> [<CR> [<CR>]<Esc>O
  autocmd FileType javascript,json,html inoremap <buffer> ({<CR> ({<CR>})<Esc>O
  autocmd FileType javascript,json,html inoremap <buffer> [{<CR> [{<CR>}]<Esc>O
  autocmd FileType ruby nnoremap <buffer> <leader>r :call <SID>RubyTest(0)<CR>
  autocmd FileType ruby nnoremap <buffer> <leader>rr :call <SID>RubyTest(1)<CR>
  autocmd TextYankPost * silent! lua vim.hl.on_yank()
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype !~# 'commit' | execute 'normal! g`"' | endif
  autocmd VimResized * wincmd =
  autocmd BufWritePre,FileWritePre * call <SID>AutoMakeDirectory()
augroup END

" Run the current test file (or the test at the cursor line) with RSpec when
" the project has a spec/ directory, otherwise with Rails' minitest runner.
" Output goes to a terminal split below; <Esc> (or q inside the split) closes it.
function! <SID>RubyTest(line)
  let runner = isdirectory('spec') ? 'bundle exec rspec' : 'bin/rails test'
  let cmd = runner . ' ' . expand('%') . (a:line ? ':' . line('.') : '')
  " run in a terminal split (a real TTY, so the output is colored); reuse the
  " split from the previous run, whose finished terminal buffer is wiped
  if !(exists('s:test_win') && win_gotoid(s:test_win))
    botright 15split
    let s:test_win = win_getid()
  endif
  execute 'terminal ' . cmd
  setlocal bufhidden=wipe
  nnoremap <buffer> q <Cmd>quit!<CR>
  normal! G
  wincmd p
endfunction

" <Esc> in normal mode closes the test split from anywhere
function! <SID>RubyTestClose()
  if exists('s:test_win') && win_id2win(s:test_win) > 0 && winnr('$') > 1
    call win_execute(s:test_win, 'quit!')
  endif
endfunction
" <Esc> closes the test split and clears search highlighting
nnoremap <Esc> <Cmd>call <SID>RubyTestClose()<CR><Cmd>nohlsearch<CR>

function! <SID>StripTrailingWhitespace()
  " markdown uses trailing spaces for line breaks; diffs need theirs intact
  if !&modifiable || &binary || index(['markdown', 'diff', 'git'], &filetype) >= 0
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

" ------------------------------------------
" Commands
" ------------------------------------------
command! Q q
command! JsonPP %!python3 -m json.tool
command! Tags silent execute '!ctags -R' .
      \ ' --languages=-javascript,sql,python,sml' .
      \ ' --exclude=.git --exclude=log --exclude=tmp' .
      \ ' -f tags ' .
      \ ' . ' .
      \ join(split(system('bundle show --paths'), "\n"), ' ')

command! V tabe $MYVIMRC
command! Vs execute 'source ' . fnameescape($MYVIMRC) | redraw! | echom 'Vimrc sourced :)'

" ------------------------------------------
" Source additional configs
" ------------------------------------------
runtime! init/**.vim
