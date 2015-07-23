set guifont=Inconsolata:h16
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set hidden      " allow Vim to manage multiple buffers effectively
set hlsearch    " highlight search
set nowrap      " no text wrapping
set nu          " show line numbers

" mouse scrolling
set mouse=a
set ttymouse=xterm

" ignore these files
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class
set wildignore+=.git " ignore these folders

" add git branch to status line
"set statusline=[%n]\ %*%<%f\ %h%m%r%{fugitive#statusline()}%=%-16.(%y\ %l/%L,%c%V%)\ %P
set statusline=\ %*%<%f\ %{fugitive#statusline()}%h%m%r%=%-5.(%y\ %l,%c%V%)\ %P\ " "

set nobackup      " remove swap and backup files from working directory
set nowritebackup

" folding settings
set foldmethod=indent         " fold based on indent
set foldnestmax=10            " deepest fold is 10 levels
set nofoldenable              " dont fold by default
set foldlevel=1               " this is just what i use

set splitbelow                " put the cursor in the split below window

"set clipboard=unnamed         " make all operations work with the OS clipboard.
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set scrolloff=3               " start the scrolling 3 lines before the border
set noeb vb t_vb=             " no error or visual bells please
set autoread                  " auto save files when changed by another editor
set autowrite                 " auto save when switching buffers

au FocusLost * silent! :wa    " autosave when focus is lost

au BufWritePre * :%s/\s\+$//e " clear white space in the end of lines

" additional Ruby syntax highliting
au BufRead,BufNewFile {Capfile,Gemfile,Gemfile.lock,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

au VimLeave * if filereadable(".vim/.netrwhist")|call delete(".vim/.netrwhist")|endif

set guioptions-=r     " hide scroll bars
set guioptions-=L
set guioptions-=T     " hide the toolbar

set noswapfile        " nwswapfile

set expandtab         " indent without hard tab
set shiftwidth=2
set softtabstop=2

"set spell            " check for typos

set laststatus=2      " show a status line even when only one window is shown. (set ls=2)
set shortmess=at      " shortens about every message to a minimum and thus avoids scrolling within the output of messages and the 'press a key' prompt that goes with these. (set shm=at)
set wildmenu          " show possible completions of command line commands, file names, and more

set textwidth=80      " (tw=80) limit the number of characters to 80 per line
set incsearch         " move the cursor to the matched string while typing the search pattern
