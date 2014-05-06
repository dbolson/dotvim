set nocompatible

execute pathogen#infect()
let mapleader = ","
color vividchalk
set guifont=monaco:h16

set cursorline
set hidden
set number
set ruler
set encoding=utf-8
syntax on

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%100v.*/
augroup END

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

" Status bar
set laststatus=2
set showcmd

" Turn off backup files
set noswapfile
set nobackup
set nowb

" Speed up
set ttyfast
set ttyscroll=3
set lazyredraw

" Reload files changed outside vim
set autoread

" Paste last contents of what was yanked regardless of what was deleted after
nnoremap <leader>R "0p

" Open current file in marked
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Delete all trailing whitespace
nnoremap <silent> <leader>ws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>

" Vertical split and move to new window
nnoremap <leader>v <c-w>v<C-w>l

" Horizontal split and move to new window
nnoremap <leader>h :split<cr><c-w>j

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Control-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <leader>b :CtrlPBuffer<CR>
map <leader>cpc :CtrlPClearCache<CR>

" NERDTree configuration
nnoremap <silent> <C-\> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <leader>nt :NERDTreeToggle<CR>

" ZoomWin configuration
map <leader><leader> :ZoomWin<CR>

nnoremap <silent> <leader>bd :Kwbd<CR>

" CTags
map <leader>rt :!ctags --extra=+f --exclude=tmp --exclude=node_modules -R * <CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Syntax coloring lines that are too long just slows down macvim
set synmaxcol=200

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Add eco template syntax highlighting
au BufRead,BufNewFile *.jst set ft=html

" Add markdown syntax highlighting and spellcheck
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal wrap

" Load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" open up a git grep line, with a quote started for the search
nnoremap <leader>gg :GitGrep 
nnoremap <leader>ag :Ag 

let g:rspec_command = "!zeus rspec {spec}"
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>

" Better key maps for switching between controller and view
nnoremap <leader>rv :Rview<cr>
nnoremap <leader>rc :Rcontroller<cr>

" Find the related spec for any file you open. Requires
"  * Your specs live in spec/ or fast_spec/
"  * Your pwd (current dir) is the project root
"  * You use the same dir structure in your code and specs so that
"    code living at lib/foo/bar.rb has a spec at spec/lib/foo/bar.rb
"
" This method handles files in fast_spec unlike the :A and :AV functions
" that ship with rails.vim
function! FindSpec()
  let s:fullpath = expand("%:p")
  let s:filepath = expand("%:h")
  let s:fname = expand("%:t")

  " Possible names for the spec/test for the file we're looking at
  let s:test_names = [substitute(s:fname, ".rb$", "_spec.rb", ""), substitute(s:fname, ".rb$", "_test.rb", "")]

  " Possible paths
  let s:test_paths = ["spec", "fast_spec", "test"]
  for test_name in s:test_names
    for path in s:test_paths
      let s:filepath_without_app = substitute(s:filepath, "app/", "", "")
      let s:spec_path = path . "/" . s:filepath_without_app . "/" . test_name
      let s:full_spec_path = substitute(s:fullpath, s:filepath . "/" . s:fname, s:spec_path, "")
      if filereadable(s:full_spec_path)
        execute ":botright vsp " . s:full_spec_path
        return
      endif
    endfor
  endfor
endfunction

nnoremap <C-s> :call FindSpec()<CR>
