
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc
" ------
"   An opinionated .vimrc by Kenan Banks <http://github.com/djtriptych>
"
"
" Format:
"   - Use long-form options always.
"   - Comment all the things.
"   - Sort blocks where possible.
"
" Inspiration:
"   - https://github.com/Apreche/vim/blob/master/vimrc
"   - https://github.com/skwp/dotfiles/blob/master/vimrc
"
" TODO: ctags.
" TODO: Tab navigation.
" TODO: Sensible makeprg defaults.
" TODO: Filetype-specific textwidth options.
" TODO: Project-specific format/lint options.
" TODO: Store sensitive options that cannot be made public.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically indent new lines aoccording to current line.
set autoindent
" Copy indentation characters from current line for new lines.
set copyindent
" Show tabs as two spaces, trailing whitespace as a dot.
set list listchars=tab:\ \ ,trail:·
" Use spaces in place of <TAB> characters.
set expandtab
" Round indent to multiple of shiftwidth.
set shiftround
" Indenting with >> or << indents 2 spaces.
set shiftwidth=2
" Let vim guess when we want to indent another level.
set smartindent
" Delete by 'shiftwidth' spaces at a time.
set smarttab
" Pressing <TAB> indents 2 spaces.
set tabstop=2



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set buffer encoding to utf-8.
set encoding=utf-8
" Expect file encoding to be utf-8 (this is converted to 'encoding')
set fileencodings=ucs-bom,utf-8,latin,default,utf-16
" Assume we're using a utf-8 terminal.
set termencoding=utf-8



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use case-insensitive search patterns.
set ignorecase
" Search as we type.
set incsearch
" Don't highlight all search matches.
set nohlsearch
" Show matching bracket when inserting a new one.
set showmatch
" Override 'ignorecase' if pattern contains upper case characters.
set smartcase



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Beauty Options (Syntax, Highlighting, Colors, etc)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized
" cf. http://ethanschoonover.com/solarized
"
" Bold fonts look kinda bad.
let g:solarized_bold=0
" NOTE: This line should appear before any other highlighting / color
" information, as it changes the values of terminal colors.
colorscheme solarized

" Turn on syntax highlighting.
syntax enable

" Let us not stare into a lightbulb all day.
set background=dark

" Highlights trailing whitespace.
highlight! SpecialKey ctermfg=white ctermbg=red
" Italicized comments on supported terminals (e.g. urxvt)
highlight! Comment cterm=italic ctermfg=10
" Highlight selected text with black background.
highlight! Visual term=none cterm=none ctermfg=none ctermbg=16
" Subtle vertical split.
highlight! VertSplit ctermbg=8 ctermfg=13
" Subtle line numbers
highlight! LineNr ctermbg=8 ctermfg=10
" Highlight matching parens in bold white
highlight! MatchParen cterm=bold ctermbg=8 ctermfg=15

" Set vertical split char to full pipe.
set fillchars=vert:│,fold:-

" Highlight all the Python things.
let python_highlight_all=1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous Options.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sensible multiline backspace behavior.
set backspace=indent,eol,start
" Use UNIX line endings.
set fileformat=unix
" Use ack.
set grepprg=ack
" Read modelines from files.
set modeline
" Show number lines.
set number
" Show row/col cursor position.
set ruler
" Never put the cursor at the very top or bottom.
set scrolloff=10
" Wrap lines at 80 chars by defauilt.
set textwidth=80
" Don't make noise when I make a mistake in vim.
set visualbell
" Wrap long lines in the buffer.
set wrap

" Sane text wrapping for code files including comments.
" c  Auto-wrap comments.
" o  Insert comment leader when 'o'pening new line.
" q  Allow formatting of commnets with gq.
" r  Insert comment leader for new lines in insert mode.
" t  Wrap text.
set formatoptions=croqt

" Stop using swap files.
set noswapfile

" Persistent Undo.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen & Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install pathogen for package management.
" cf. https://github.com/tpope/vim-pathogen
execute pathogen#infect()

filetype plugin on
filetype indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype detection.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.less     set filetype=less
autocmd BufNewFile,BufRead *.tpl      set filetype=jinja
autocmd BufNewFile,BufRead *.mk       set filetype=markdown
autocmd BufNewFile,BufRead *.i3       set filetype=i3
autocmd BufNewFile,BufRead *.tmux     set filetype=tmux
autocmd BufNewFile,BufRead *.json     set filetype=json
autocmd BufNewFile,BufRead *.less     set filetype=less
autocmd BufNewFile,BufRead .tmux.conf set filetype=tmux



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jasmine testing.
ab beforeEach beforeEach(function() {<CR>});<esc>O<TAB>
ab afterEach afterEach(function() {<CR>});<esc>O<TAB>
ab it( it('should ', function() {<CR>});<esc>O<TAB><UP><ESC>f<SPACE>i
ab describe( describe('', function() {<CR>});<esc>O<TAB><UP><ESC>wlli



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create and store a code snippet to share later :)
function! Snip(name) range
  let l:cmdparts = ["!snippet", expand('%:p'), a:firstline, a:lastline, a:name]
  let l:cmd = join(l:cmdparts, " ")
  execute l:cmd
  " Check exit code for errors.
  " Otherwise flash success method.
endfunction
command! -range -nargs=1 Snip <line1>,<line2>call Snip(<f-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Previous tab
map <S-TAB> :tabp<CR>
" Next tab
map <TAB> :tabn<CR>
" CommandT file window
nmap <F12> :CommandT<CR>

" Buffer navigation.
nmap <C-P> :bp<CR>
nmap <C-N> :bn<CR>
nmap <C-D> :bd<CR>

