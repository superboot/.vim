" Heading colors to match Obsidian
hi link markdownH1 obsMarkdownH1
hi link markdownH2 obsMarkdownH2
hi link markdownH3 obsMarkdownH3
hi link markdownH4 obsMarkdownH4
hi link markdownH4 obsMarkdownH4
hi link markdownH5 obsMarkdownH5
hi link markdownH6 obsMarkdownH6
hi obsMarkdownH1   ctermfg=Yellow
hi obsMarkdownH2   ctermfg=lightmagenta
hi obsMarkdownH3   ctermfg=lightblue
hi obsMarkdownH4   ctermfg=green
hi obsMarkdownH5   ctermfg=darkmagenta
hi obsMarkdownH6   ctermfg=grey

" List colors to stand out more
hi link markdownListMarker obsMarkdownListMarker
hi obsMarkdownListMarker   ctermfg=red

" ######### Make [links](http://blah.com) to display as link.
" Match the link text between brackets and conceal everything else
syntax match markdownLink '\[\zs.\{-}\ze\]\((.*)\)' conceal
syntax match markdownLink 'dude' conceal

" Set the conceal level to make the concealed text completely hidden
set conceallevel=2
set concealcursor=nvic  " Show concealed text when cursor is on the line
" set conceallevel=2

" Make sure the link text is visible and perhaps underlined
hi def link markdownLink Underlined
