set nocompatible

let mapleader = ","
color vividchalk
set guifont=monaco:h16
let &t_Co=256

filetype plugin indent on

set cursorline
set hidden
set number
set ruler
set encoding=utf-8
set backspace=indent,eol,start " Fix problems with backspace in insert mode
syntax on

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set laststatus=2 " Status bar
set showcmd " Display incomplete commands

" Turn off backup files
set noswapfile
set nobackup
set nowb

" Speed up
set ttyfast
set ttyscroll=3
set lazyredraw
set re=1

" Highlight after 100 characters
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
  autocmd BufEnter * match OverLength /\%100v.*/
augroup END

" Reload files changed outside vim
set autoread

" Automatically :write before running commands
set autowrite

" Remove trailing whitespace when manually saving a buffer
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Copy current filename into system clipboard
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>

" Paste last contents of what was yanked regardless of what was deleted after
nnoremap <leader>p "0p
nnoremap <leader>P "0P

" Copy to clipboard
vnoremap <C-C> "*y

" Vertical split and move to new window
nnoremap <leader>v <C-W>v<C-W>l

" Horizontal split and move to new window
nnoremap <leader>h :split<CR><C-W>j

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Control-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*
map <leader>b :CtrlPBuffer<CR>
map <leader>cpc :CtrlPClearCache<CR>

" Make CtrlP use Ag for listing the files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" CtrlP auto cache clearing.
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" NERDTree configuration
nnoremap <silent> <C-\> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <leader>nt :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

" ZoomWin configuration
map <leader><leader> :ZoomWin<CR>

" Delete buffer without closing window
nnoremap <silent> <leader>bd :Kwbd<CR>

" CTags
map <leader>rt :!ctags --extra=+f --exclude=tmp --exclude=node_modules -R * <CR><CR>
map <leader>lt :TlistToggle<CR>
let Tlist_Use_Right_Window = 1

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Add markdown syntax highlighting and spellcheck
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal wrap
map <leader>M :set syntax=markdown<CR>:set wrap<CR>:set spell<CR>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

" % to bounce from do to end etc.
runtime! macros/matchit.vim

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" Open up a git grep line, with a quote started for the search
nnoremap <leader>ag :Ag<space>

" Toggle pasting to preserve format when pasting from clipboard into buffer
nnoremap <leader>pt :set invpaste paste?<cr>
set pastetoggle=<leader>pt
set showmode

" Run RSpec tests with Vroom
nnoremap <unique> <leader>t :VroomRunTestFile<CR>
map <unique> <leader>s :VroomRunNearestTest<CR>

let g:vroom_map_keys = 0
let g:vroom_clear_screen = 0
let g:vroom_detect_spec_helper = 1

:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
