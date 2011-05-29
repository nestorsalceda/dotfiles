set nocompatible 
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'snipMate'
Bundle 'mako.vim'
Bundle 'pyflakes.vim'
Bundle 'nestor-salceda/dotfiles', {'rtp':'vim/'}

filetype plugin on

syntax on

set number
set smartindent
set showmatch
set textwidth=80
set cursorline
set visualbell
set incsearch
set hlsearch

colorscheme evening
