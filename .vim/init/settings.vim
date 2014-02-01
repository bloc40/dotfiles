colorscheme railscasts
set guifont=Inconsolata:h15

" allow Vim to manage multiple buffers effectively
set hidden

" no text wrapping
set nowrap

" show line numbers
set nu

" auto save files when changed by another editor
set autoread

" ignore these files
set wildignore+=*/tmp/*,*/public/uploads/*,*.swp,*.bak,*.pyc,*.class

" add git branch to status line
set statusline=[%n]\ %*%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" remove swap and backup files from working directory
set nobackup
set nowritebackup

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" put the cursor in the split below window
set splitbelow

" make all operations work with the OS clipboard.
set clipboard=unnamed

" start the scrolling 3 lines before the border
set scrolloff=3

" no error bell please
set noeb vb t_vb=

" clear white space in the end of lines
au BufWritePre * :%s/\s\+$//e

" autosave when focus is lost
au focuslost * silent! :wa

" additional Ruby syntax highliting
au BufRead,BufNewFile {Capfile,Gemfile,Gemfile.lock,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" hide scroll bars
set guioptions-=r
set guioptions-=L
" hide the toolbar
set guioptions-=T
