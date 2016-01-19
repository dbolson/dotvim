set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Files
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'

" Text
Plugin 'itspriddle/vim-marked'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'

" Utilities
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'rgarver/Kwbd.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'ZoomWin'

" Git
Plugin 'tpope/vim-fugitive'

" Syntax
Plugin 'ekalinin/Dockerfile.vim'

" Ruby
Plugin 'tpope/vim-rails'
Plugin 'skalnik/vim-vroom'
Plugin 'ruby-matchit'

" JavaScript
Plugin 'pangloss/vim-javascript'

source ~/.vim/bundles-clojure.vimrc

call vundle#end()
filetype plugin indent on
