set nocompatible

call pathogen#infect()
let mapleader = ","
color vividchalk

set cursorline
set hidden
set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
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

" Turn off backup files
set noswapfile
set nobackup
set nowb

" Reload files changed outside vim
set autoread

" Show (partial) command in the status line
set showcmd

" Automatically resize splits when resizing MacVim window
if has("gui_running")
  autocmd VimResized * wincmd =
endif

" With the following mapping a user can press F5 to delete all trailing whitespace.
" The variable _s is used to save and restore the last search pattern register
" (so next time the user presses n they will continue their last search),
" and :nohl is used to switch off search highlighting (so trailing spaces will not be highlighted while the user types).
" The e flag is used in the substitute command so no error is shown if trailing whitespace is not found.
" Unlike before, the substitution text must be specified in order to use the required flag.
nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Command-T configuration
let g:CommandTMaxHeight=20

" NERDTree configuration
nnoremap <silent> <C-\> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

map <Leader>ctf :CommandTFlush<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Disable ugly JSLint highlighting
let g:jslint_highlight_color=""

" % to bounce from do to end etc.
runtime! macros/matchit.vim

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

nnoremap <silent> <leader>bd :Kwbd<CR>

" open up a git grep line, with a quote started for the search
nnoremap <leader>gg :GitGrep 

" git grep the current word using K (mnemonic Kurrent)
nnoremap <silent> K :GitGrep <cword><CR>

" Better key maps for switching between controller and view
nnoremap ,vv :Rview<cr>
nnoremap ,cc :Rcontroller<cr>

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
