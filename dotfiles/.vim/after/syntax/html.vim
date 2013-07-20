
" HTML wraps at 100 characters.
set textwidth=100

" Disable silly highlighting of HTML CDATA sections.
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

