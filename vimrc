set nocompatible    " don't maintain compatibility with vi

filetype off

" Vundle. This must happen first
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" bundles
Bundle 'ap/vim-css-color.git'
Bundle 'ervandew/supertab.git'
Bundle 'itspriddle/ZoomWin.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'

" highlight known syntaxes
syntax on

filetype plugin indent on

let mapleader = "\<Space>"


" Source initialization files
runtime! init/**.vim


" Machine-local vim settings - keep this at the end
" --------------------------
silent! source ~/.vimrc.local
