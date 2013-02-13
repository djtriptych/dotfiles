filetype on
syntax on

set autoindent
set bg=dark
set encoding=utf-8
set expandtab
set fileencodings=ucs-bom,utf-8,latin,default,utf-16
set fileformat=unix
set ignorecase
set incsearch
set nohls
set ruler
set shiftwidth=4
set tabstop=4
set termencoding=utf-8
set textwidth=80
set wrap

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Install pathogen
execute pathogen#infect()

" Solarized
colorscheme solarized

" Extension -> filetype map
autocmd BufNewFile,BufRead *.less     set filetype=less
autocmd BufNewFile,BufRead *.tpl      set filetype=jinja
autocmd BufNewFile,BufRead *.mk       set filetype=markdown

" Specific files -> filetype map
autocmd BufNewFile,BufRead .tmux.conf set filetype=tmux

" Highlight all the (Python) things.
let python_highlight_all = 1

" Highlight trailing whitespace.
set list
set listchars=tab:\ \ ,trail:·
hi SpecialKey ctermfg=white ctermbg=red

" Know what's cool? Italic comments.
highlight Comment cterm=italic


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps

" Center screen at cursor with space bar
nmap <space> zz
