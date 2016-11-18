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
"Plugin 'scrooloose/syntastic'

" Git
Plugin 'tpope/vim-fugitive'

" Utilities
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'rgarver/Kwbd.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ZoomWin'
Plugin 'metakirby5/codi.vim'

" Ruby
Plugin 'ruby-matchit'
Plugin 'tpope/vim-rails'
Plugin 'janko-m/vim-test'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Clojure
Plugin 'tpope/vim-dispatch'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'paredit.vim'

" Scala
Plugin 'derekwyatt/vim-scala'

" Python
Plugin 'indentpython.vim'

" Docker
Plugin 'ekalinin/Dockerfile.vim'

call vundle#end()
filetype plugin indent on
