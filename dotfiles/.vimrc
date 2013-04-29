syntax enable

set autoindent
set bg=dark
set encoding=utf-8
set expandtab
set fileencodings=ucs-bom,utf-8,latin,default,utf-16
set fileformat=unix
set ignorecase
set incsearch
set nohls
set number
set ruler
set shiftwidth=2
set tabstop=2
set termencoding=utf-8
set textwidth=80
set wrap


" Install pathogen
execute pathogen#infect()

" Solarized
set t_Co=16
set background=dark
let g:solarized_bold=0
colorscheme solarized

" Extension -> filetype map
autocmd BufNewFile,BufRead *.less     set filetype=less
autocmd BufNewFile,BufRead *.tpl      set filetype=jinja
autocmd BufNewFile,BufRead *.mk       set filetype=markdown
autocmd BufNewFile,BufRead *.i3       set filetype=i3
autocmd BufNewFile,BufRead *.tmux     set filetype=tmux
autocmd BufNewFile,BufRead *.json     set filetype=json
autocmd BufNewFile,BufRead *.less     set filetype=less

" Specific files -> filetype map
autocmd BufNewFile,BufRead .tmux.conf set filetype=tmux
" TODO: .i3/config file takes type i3

set grepprg=ack

" Highlight all the (Python) things.
let python_highlight_all = 1

" Highlight trailing whitespace.
set list
set listchars=tab:\ \ ,trail:·

highlight SpecialKey ctermfg=white ctermbg=red

" Know what's cool? Italic comments.
highlight Comment cterm=italic ctermfg=10

" Know what's not cool. Special rendering of HTML CDATA
let html_no_rendering=1


" Attempting to get html syntax highlighting working with vim/solarized/rxvt.

" Bit of trickery: the match includes the leading space, because otherwise it
" loses to the data htmlArg, which is defined as a keyword.
syn match ngAttr containedin=htmlTag " \(data[a-zA-z-]\+\>\)"

hi! htmlTag ctermfg=12
hi! htmlEndTag ctermfg=12
hi! htmlTagN ctermfg=white
hi! htmlTagName ctermfg=3
hi! htmlSpecialTagName ctermfg=5
hi! htmlArg ctermfg=4
hi! ngAttr ctermfg=red

hi! Visual term=none cterm=italic ctermfg=7 ctermbg=5


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps

" Center screen at cursor with space bar
nmap <space> zz
" Previous tab
map <F10> :tabp<CR>
" Next tab
map <F11> :tabn<CR>
" CommandT file window
nmap <F12> :CommandT<CR>
