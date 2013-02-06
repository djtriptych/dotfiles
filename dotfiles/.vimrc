syntax on
set ai
set wrap
set textwidth=80
set bg=dark
set ignorecase
set nohls
set incsearch
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set ruler
set fileencodings=ucs-bom,utf-8,latin,default,utf-16
set fileformat=unix

" Solarized
colorscheme solarized

" Install pathogen
call pathogen#infect()

" Extension -> filetype map
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.tpl  set filetype=jinja
au BufNewFile,BufRead *.mk   set filetype=markdown

" Highlight all the (Python) things.
let python_highlight_all = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps

" Center screen at cursor with space bar
nmap <space> zz

" Center screen at next/previous match
nmap n nzz
nmap N Nzz
