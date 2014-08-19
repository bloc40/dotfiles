set nocompatible    " don't maintain compatibility with vi
filetype off

" Vundle. This must happen first
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" bundles
Plugin 'ap/vim-css-color.git'
Plugin 'ervandew/supertab.git'
Plugin 'itspriddle/ZoomWin.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'mileszs/ack.vim.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-abolish.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-unimpaired.git'

call vundle#end()
filetype plugin indent on

" highlight known syntaxes
syntax on

let mapleader = "\<Space>"


" Source initialization files
runtime! init/**.vim


" Machine-local vim settings - keep this at the end
" --------------------------
silent! source ~/.vimrc.local
