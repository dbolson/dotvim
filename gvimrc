color vividchalk

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T
set guifont=Menlo\ Regular:h16

" Automatically resize splits when resizing MacVim window
if has("gui_running")
  autocmd VimResized * wincmd =
endif

" Command-T for ControlP
macmenu &File.New\ Tab key=<D-T>
map <D-t> :CtrlP<CR>
imap <D-t> <Esc>:CtrlP<CR>

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Command-][ to increase/decrease indentation
vmap <D-]> >gv
vmap <D-[> <gv

" Command-Option-ArrowKey to switch viewports
map <D-M-Up> <C-w>k
imap <D-M-Up> <Esc> <C-w>k
map <D-M-Down> <C-w>j
imap <D-M-Down> <Esc> <C-w>j
map <D-M-Right> <C-w>l
imap <D-M-Right> <Esc> <C-w>l
map <D-M-Left> <C-w>h
imap <D-M-Left> <C-w>h
