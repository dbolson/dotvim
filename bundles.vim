call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim' " => neovim-ghcmod
Plug 'airblade/vim-gitgutter'
Plug 'derekwyatt/vim-scala'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
Plug 'neovim/node-host', { 'do': 'npm install' } " mdown.vim
Plug 'neovimhaskell/neovim-ghcmod' " haskell
Plug 'pangloss/vim-javascript'
Plug 'rgarver/Kwbd.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'vimlab/split-term.vim'

call plug#end()
