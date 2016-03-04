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

" Git
Plugin 'tpope/vim-fugitive'

" Utilities
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'rgarver/Kwbd.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ZoomWin'

" Ruby
Plugin 'ruby-matchit'
Plugin 'tpope/vim-rails'
Plugin 'skalnik/vim-vroom'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

source ~/.vim/bundles-clojure.vimrc

call vundle#end()
filetype plugin indent on
