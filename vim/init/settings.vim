colorscheme railscasts
set guifont=Inconsolata:h15

set hidden      " allow Vim to manage multiple buffers effectively
set hlsearch    " highlight search
set nowrap      " no text wrapping
set nu          " show line numbers
set autoread    " auto save files when changed by another editor

" ignore these files
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class
set wildignore+=.git " ignore these folders

" add git branch to status line
set statusline=[%n]\ %*%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set nobackup      " remove swap and backup files from working directory
set nowritebackup

" folding settings
set foldmethod=indent           "fold based on indent
set foldnestmax=10              "deepest fold is 10 levels
set nofoldenable                "dont fold by default
set foldlevel=1                 "this is just what i use

set splitbelow                  " put the cursor in the split below window
set clipboard=unnamed           " make all operations work with the OS clipboard.
set scrolloff=3                 " start the scrolling 3 lines before the border
set noeb vb t_vb=               " no error bell please

au BufWritePre * :%s/\s\+$//e   " clear white space in the end of lines

au focuslost * silent! :wa      " autosave when focus is lost

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

" check for typos
"set spell
