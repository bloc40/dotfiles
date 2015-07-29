" --- don't maintain compatibility with vi
set nocompatible
filetype off

" --- Vundle. This must happen first
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" --- let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" --- bundles
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

call vundle#end()
filetype plugin indent on

" --- highlight known syntaxes
syntax on

let mapleader = "\<Space>"


" --- Source initialization files
runtime! init/**.vim

" --- Machine-local vim settings - keep this at the end
silent! source ~/.vimrc.local
