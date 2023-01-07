" ↓↓↓       VIM BASICS (sets; leader, vimrc foldmethod, encoding)
let mapleader = " "
set nocompatible " let's use VIM not Vi
set encoding=utf-8
set foldmethod=marker
set foldmarker=↓↓↓,↑↑↑
set mouse=
"   ↑↑↑     END VIM BASICS
" ↓↓↓ VPASTE.NET BINDINGS
" This section is for dumping text to vpaste.net
" nnoremap <leader>vp :exec "w !vpaste ft=".&ft<CR>
" vnoremap <leader>vp <ESC>:exec "'<,'>w !vpaste ft=".&ft<CR>
" ↑↑↑ END VPASTE.NET BINDINGS
" ↓↓↓ PATHOGEN
filetype off
filetype plugin indent off
execute pathogen#infect()
filetype plugin indent on
syntax on
Helptags
" ↑↑↑ END PATHOGEN
" ↓↓↓ PLUGINS
" ↓↓↓ NERD TREE
" nnoremap <leader>n :NERDTree<CR>
" ↑↑↑ END NERD TREE
"   ↓↓↓     UTILSNIPS
"The default ultisnips triggers most likely need to be remapped.  Below for reference:
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsListSnippets='<c-y>'
" In order to have :UltiSnipsEdit split your window vertically:
"   per https://github.com/SirVer/ultisnips
let g:UltiSnipsEditSplit='vertical'
" Per :h UltiSnips:
" Ensure Vim is looking for Python version actually supported on your machine.
let g:UltiSnipsUsePythonVersion = 3
nnoremap <leader>e :UltiSnipsEdit <cr>
"   ↑↑↑     END UTILSNIPS
" ↓↓↓ TAG BAR
nnoremap <silent><leader>t :TagbarToggle<cr>
" ↑↑↑ END TAG BAR
" " ↓↓↓ AIRLINE
set laststatus=2
" ↑↑↑ END AIRLINE
" " ↓↓↓ CHAPA
let g:chapa_default_mappings = 1
" ↑↑↑ END CHAPA
" ↓↓↓ MUNDO UNDO TREE PLUGIN
nnoremap <F5> :MundoToggle<CR>
" ↑↑↑ END MUNDO UNDO TREE PLUGIN
" ↓↓↓ NETRW OPTIONS
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
"Line stles:
"0: thin listing (one file per line)
"1: long listing (one file per line with time
"   stamp information and file size)
"2: wide listing (multiple files in columns)
"3: tree style listing
"let g:netrw_liststyle=3
let g:netrw_liststyle=0
" ↑↑↑ END NETRW OPTIONS
" ↓↓↓ UTL -- Open in external program.

" Set elinks as the web browser to open links.
let g:utl_cfg_hdl_scm_http_system = "silent !elinks -remote %u " 
" Optionally use firefox by uncommenting this and commenting out the elinks line.
"let g:utl_cfg_hdl_scm_http_system = "silent !firefox -remote 'ping()' && firefox -remote 'openURL( %u )' || firefox '%u#%f' &"

" Map the "open link" to space-enter.
function! UTLAndReDraw() " Redraw after UTL mangles the screen.
    Utl 
    redraw!
endfunction

nnoremap <silent><return> :call UTLAndReDraw()<return>

" ↑↑↑ END UTL -- Open in external program.
" ↑↑↑ END PLUGINS
" ↓↓↓   SPELL CHECK 
" SPELL CHECK per https://danielmiessler.com/study/vim/#spelling
"   in vim toggle with :set spell and :set nospell
set spell spelllang=en_us
" Fix spelling -- toggles list of correct words
nnoremap <leader>f 1z=
" Toggle spelling visuals -- like :set spell and :set nospell
set spellfile=~/.vim/spell/en.utf-8.add
" UTF-8 Encoding per http://stackoverflow.com/questions/16507777/vim-set-encoding-and-fileencoding-utf-8
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
" SETS INITIAL STATE OF THE SPELL CHECK TO OFF.  ACTIVATE WITH <LEADER>S, SET
"   IN THE NEARBY "LEADER MAPS" SECTION.
nnoremap <leader>s :set spell!<CR>
set nospell
set scs
set  complete+=kspell
" ↑↑↑   END SPELL CHECK
" ↓↓↓ SEARCHING
" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase " Searches are case insensitive, unless upercase is specified
" ↑↑↑ SEARCHING
" ↓↓↓ BACKUPS, PERSISTNAT UNDO, HISTORY, and SWAP
set backup		" keep a backup file
set backupdir=~/.vim/backups " Set ~/.vim/backups to be the place to save backups of files we are working on.
"Awesome persistant undo!
" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vim/undo

" set a directory to store the swap files
set directory=~/.vim/swap

set history=500		" keep 500 lines of command line history
" ↑↑↑ END UNDO and HISTORY
" ↓↓↓ SEARCH
set hlsearch
" ↑↑↑ END SEARCH
" ↓↓↓ BUFFERS
set hidden " lets vim use hidden buffers more easily.
" ↑↑↑ END BUFFERS
" ↓↓↓ AUTO RESUME PLACE
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" ↑↑↑ END AUTO RESUME PLACE
" ↓↓↓ TEXT, LINES, AND TABS

" Setting up to use spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" set matching open close "([{ etc..
" source ~/.vim/openclose.vim

" ↑↑↑ END TEXT, LINES, AND TABS
" ↓↓↓ UI SETTINGS
syntax on
:nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>
"set cursorline! cursorcolumn!
set scrolloff=3 " setting that makes the cursser stay 3 lines in from the top/bottom
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ruler		" show the cursor position all the time
set number
set showcmd		" display incomplete commands
set autoindent		" always set autoindenting on
set listchars=trail:_,extends:>,tab:▸\ ,eol:↵
"set listchars=trail:_,tab:>-, extends:>, precedes:<, nbsp:¬,eol:↵
"The following is to toggle between relative and apsolute line numbering
"nnoremap <C-m> :set rnu!<cr> " removed to make return map to colon
"vnoremap <C-m> :set rnu!<cr> " removed to make return map to colon
set mouse=""
set wildmenu
" ↓↓↓2 GUI Gvim settings
if has("gui_running")
    set guifont=Monospace\ 14
endif
" ↑↑↑2 END 
" ↑↑↑ END UI SETTINGS
" ↓↓↓ FUZZY SEARCH
set path+=**
" ↑↑↑ END FUZZY SEARCH
" ↓↓↓ COLOR SCHEME
function! EnableWombatColor() " Dark colorscheme
    set t_Co=256
    color wombat256mod
    "set colorcolumn=80
    highlight ColorColumn ctermbg=233
    "The following makes vim display the background as the background of your terminal
    hi Normal ctermbg=none
    hi NonText ctermbg=none
    hi colorColumn ctermbg=none
    let g:colorscheme = "black" " For the toggle function below.
endfunction
call EnableWombatColor() " Now call the function so it is set this way at startup.

function! EnableDefaultWhiteColor()
    color morning
    let g:colorscheme = "white" " For the toggle function below.
endfunction

" Toggle between light and dark colorscheme
function! ToggleColorscheme()
    if g:colorscheme == "white"
        call EnableWombatColor()
        let g:colorscheme = "black"
    else
        call EnableDefaultWhiteColor()
        let g:colorscheme = "white"
    endif
endfunction
nnoremap <leader>\ :call ToggleColorscheme() <cr>

" ↑↑↑ END COLOR SCHEME
" ↓↓↓ TOGGLE COMMENTS

" Toggle comments visability (purple to black color)
let g:commentColor = 126
function! ToggleCommentColor()
    if g:commentColor == 126
        highlight Comment ctermfg=16
        let g:commentColor = 16
    else
        highlight Comment ctermfg=126
        let g:commentColor = 126
    endif
endfunction
" Map leader-c to togle comment visability.
nnoremap <leader>c :call ToggleCommentColor() <cr>
" ↑↑↑ END TOGGLE COMMENTS
" ↓↓↓ IO Settings 
" Sets the time vim will wait to see the end of ambiguous commands:
"set timeoutlen=180 " This was nice for escaping insert mode with ff, but it
"is too short for the <leader> shortcuts etc.
" ↑↑↑ END IO Settings 
" ↓↓↓ FILETYPE SPECIFIC AUTO COMMANDS
" ↓↓↓ TMUX CONFIG
autocmd BufRead ~/.tmux.conf setlocal foldmethod=marker
autocmd BufRead ~/.tmux.conf setlocal foldmarker=///,\\\\
" ↑↑↑ END TMUX CONFIG
" ↓↓↓ APACHE CONFIG
autocmd BufRead */apache2.conf setlocal keywordprg=~/bin/apacheHelp
" ↑↑↑ END APACHE CONFIG
" ↓↓↓ PYTHON SETTINGS
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal iskeyword+=.
autocmd FileType python setlocal keywordprg=pydoc3
autocmd FileType python nnoremap <leader>vp :exec "w !vpaste foldmethod=indent background=dark number ft=".&ft<CR>
autocmd FileType python vnoremap <leader>vp <ESC>:exec "'<,'>w !vpaste foldmethod=indent background=dark number ft=".&ft<CR>
autocmd FileType python nnoremap <F4> :!clear; python3 -m ptpython -i % <cr>
"autocmd FileType python nnoremap <leader>r :!clear; python3 -m ptpython -i % <cr>
"autocmd FileType python nnoremap <F4> :terminal python3 -m ptpython -i % <cr>
"autocmd FileType python nnoremap <leader>d :terminal pudb3 % <cr>
autocmd FileType python nnoremap gd :!pudb3 % <cr>
"nnoremap <S-F4> :echo 'this is crap' <cr>
" ↑↑↑ END PYTHON SETTINGS
" ↓↓↓ C SETTINGS
autocmd FileType c nnoremap <F4> :!clear; gcc -o f4compile % && ./f4compile <cr>
autocmd FileType c set noexpandtab
" ↑↑↑ END C SETTINGS
" ↓↓↓ PHP SETTINGS
autocmd FileType php nnoremap <F4> :!clear; php % <cr>
" ↑↑↑ END PHP SETTINGS
" ↓↓↓ BASH SETTINGS
" ↓↓↓ AUTO COMMANDS
autocmd FileType bash nnoremap <F4> :!clear; bash  % <cr>
autocmd FileType bash let b:is_bash = 1
autocmd FileType bash setlocal complete=.,w,b,u,t,i
autocmd FileType bash setlocal keywordprg=man

autocmd FileType sh nnoremap <F4> :!clear; bash % <cr>
autocmd FileType sh setlocal keywordprg=man
autocmd FileType sh setlocal complete=.,w,b,u,t,i
autocmd FileType sh let b:is_bash = 1
"autocmd FileType bash setlocal foldtext=BashFoldText()
"autocmd FileType sh setlocal foldtext=BashFoldText()
" ↑↑↑ END AUTO COMMANDS
" ↓↓↓ BASH FOLDING
" See :h ft-sh-syntax for explenation of these settings.
autocmd FileType sh let g:is_bash= 1
autocmd FileType bash let g:is_bash= 1
" Set folding for docherestrings and functions
autocmd FileType sh let g:sh_fold_enabled= 3
autocmd FileType bash let g:sh_fold_enabled= 3
" Set vim to fold based on syntax
" This worked for like an hour and refuses to work now. Switching to marker
" folding.
" autocmd FileType sh setlocal foldmethod=syntax
" autocmd FileType bash setlocal foldmethod=syntax

" set to marker style folding.
autocmd FileType sh setlocal fdm=marker
autocmd FileType bash setlocal fdm=marker
autocmd FileType sh setlocal foldmarker=↓↓↓,↑↑↑
autocmd FileType bash setlocal foldmarker=↓↓↓,↑↑↑
autocmd FileType sh setlocal nowrap
autocmd FileType bash setlocal nowrap

" This is set for the nerdcomment plugin used to comment in/out code.
" ↓↓↓ Foldtext format
function! BashFoldText()
    let line = getline(v:foldstart + 1)
    let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    "return v:folddashes . sub
    return sub
endfunction
" ↑↑↑ END Foldtext format
" ↑↑↑ END BASH FOLDING
" ↑↑↑ END BASH SETTINGS
" ↓↓↓ R SETTINGS
" nnoremap <leader>i :setlocal titlestring=rprogrampad | set title
" vnoremap <leader>r "+y | :!run-in-rstudio
" ↑↑↑ END R SETTINGS
" ↓↓↓ GOLANG SETTINGS
autocmd FileType go nnoremap <F4> :!clear; go run  % <cr>
autocmd FileType go set nowrap
autocmd FileType go set softtabstop=2
autocmd FileType go set tabstop=2
" ↑↑↑ END GOLANG SETTINGS
" ↓↓↓ TEXT FILES FORMAT
autocmd FileType text setlocal wrap
autocmd FileType text setlocal linebreak
autocmd FileType text setlocal nolist " list disables linebreak, so we disable it
"autocmd FileType text setlocal textwidth=78
" ↑↑↑ END TEXT FILES FORMAT
" ↓↓↓ WIKI SETTINGS
"autocmd BufRead,BufNewFile */itsalltext/daveyweb*.txt set filetype=html
"autocmd BufRead,BufNewFile */*-temp-files/daveyweb*.txt set filetype=html
"autocmd BufRead,BufNewFile */*-temp-files/*/daveyweb/*.txt set filetype=html
"autocmd BufRead,BufNewFile */tmpFiles/*/*/daveyweb/*.txt setlocal fdm=marker
"autocmd BufRead,BufNewFile */tmpFiles/*/*/daveyweb/*.txt setlocal foldmarker=↓↓↓,↑↑↑
function! Mediawikidocs(kw)
    !firefox 'https://www.mediawiki.org/wiki/Manual:$' . kw 
endfunction
autocmd BufRead,BufNewFile *daveyweb/*.txt set filetype=html
autocmd BufRead,BufNewFile */daveyweb/*.txt setlocal fdm=marker
autocmd BufRead,BufNewFile */daveyweb/*.txt setlocal foldmarker=↓↓↓,↑↑↑
autocmd BufRead,BufNewFile */daveyweb/*.txt setlocal keywordprg=Mediawikidocs
autocmd BufRead,BufNewFile */daveyweb/*.txt nnoremap <leader>a i<font color=red>✓</font> <esc>BB
" make 'chk' expand to a check mark. Moved to an ultisnip.
"autocmd BufRead,BufNewFile */daveyweb/*.txt iab chk <font color=red>✓</font> 
" ↑↑↑ END WIKI SETTINGS
" ↓↓↓ YAML SETTINGS
autocmd FileType yaml set sw=2
autocmd FileType yaml set ts=2
autocmd FileType yaml set sts=2
" ↑↑↑ END Code to be folded
" ↓↓↓ VIM HELP
" Follow link under cursor.
autocmd FileType help nnoremap <return> <C-]>
" Go to next matching help article.
autocmd FileType help nnoremap <silent> <c-n> :tnext<CR> 
" ↑↑↑ END 

" ↑↑↑ END FILETYPE SPECIFIC AUTO COMMANDS
" ↓↓↓ BINDINGS
" ↓↓↓ BASIC BINDINGS
map Y y$ " Make Y act like other upper commands
map F1 <esc> " Make f1 act like escape. I hate pulling up the help screen with f1.
nnoremap F1 <esc> " Make f1 act like escape. I hate pulling up the help screen with f1.
nnoremap <c-s> :w <return>
"Make kj like escape
"inoremap kj <esc>
"vnoremap kj <esc>
" ↑↑↑ END BASIC BINDINGS
" ↓↓↓ UI BINDINGS
nmap <leader>l :set list!<CR>
inoremap jk <ESC>
inoremap kj <ESC>
nnoremap <leader>z :let &scrolloff=999-&scrolloff<CR>
nnoremap ds <S-a>
nnoremap <silent><leader>w :set wrap!<CR>
" ↑↑↑ END UI BINDINGS
" ↓↓↓ WORKSPACE MOVMENT BINDINGS
" Make < and > navigate tabs like elinks. Just use visual mode for indenting.
nnoremap <lt> gT
nnoremap > gt
" THese would be nice, but they don't work.
"nnoremap <C->> :tabmove +1
"nnoremap <C-<lt>> :tabmove -1
" Set alt-tab to switch to the alternate buffer. Usefull if not on a window
" manager that uses alt-tab (like awesome).
"map <esc><Tab> <C-^>
" ↑↑↑ END WORKSPACE MOVMENT BINDINGS
" ↓↓↓ WINDOW BINDINGS
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
nmap <c-j> <c-w>j " conflicts with ultisnips
nmap <c-k> <c-w>k " conflicts with ultisnips
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <leader>n <c-^>
" ↑↑↑ END WINDOW BINDINGS
" ↓↓↓ VIMRC BINDINGS ETC
nmap <leader>v :tabedit $MYVIMRC<CR>
autocmd BufRead $MYVIMRC setlocal foldmethod=marker
autocmd BufRead $MYVIMRC setlocal foldmarker=↓↓↓,↑↑↑
nnoremap <F9> :source $MYVIMRC<CR>
" ↑↑↑ END VIMRC BINDINGS ETC
" ↓↓↓ SESSION FILE BINDINGS
"Session file handling maped to F keys
nnoremap <F10> :mksession! <cr>
nnoremap <F11> :source ./Session.vim
" ↑↑↑ END SESSION FILE BINDINGS
" ↓↓↓ UN-HIGHLIGHT LAST SEARCH BINDINGS
noremap <silent><C-n> :nohl<CR>
vnoremap <silent><C-n> :nohl<CR>
"inoremap <silent><C-n> :nohl<CR>
" ↑↑↑ END UN-HIGHLIGHT LAST SEARCH BINDINGS
" ↓↓↓ COUNT NUMBER OF SEARCH RESULTS BINDINGS
" The empty search pattern defaults to the last search made with the / * or #
"     operations.
nnoremap <silent><leader>3 :%s///gn<CR>
" ↑↑↑ END COUNT NUMBER OF SEARCH RESULTS BINDINGS
" ↓↓↓ SPECIAL TEXT MANIPULATION BINDINGS
" map sort function to a key
vnoremap <leader>sn :sort n<CR>
vnoremap <leader>sa :sort<CR>
" binding to make <leader>W remove trailing whitespce from all of file.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
" Binding to search/replace the word under the cursor.
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
" Binding to reflow text to 72 character lines
vnoremap <Leader>f :!fmt<cr>
" ↑↑↑ END SPECIAL TEXT MANIPULATION BINDINGS
" ↓↓↓ COMMAND-MODE BINDINGS
cnoremap <C-A>		<Home>
cnoremap <C-B>		<Left>
"cnoremap <C-D>		<Del>
cnoremap <C-E>		<End>
cnoremap <C-F>		<Right>
cnoremap <C-N>		<Down>
cnoremap <C-P>		<Up>
cnoremap <Esc><C-B>	<S-Left>
cnoremap <Esc><C-F>	<S-Right>
" ↑↑↑ COMMAND-MODE BINDINGS
" ↓↓↓ INSERT MODE BINDINGS
" Bindings to mimic the GDP Pocket 2 Max.   
"inoremap <c-v> {
"inoremap <c-b> {
"inoremap <c-n> [
"inoremap <c-m> ]
inoremap <silent> <C-e> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
" ↑↑↑ END INSERT MODE BINDINGS
" ↓↓↓ VISUAL MODE BINDINGS
vnoremap Y "+y
vnoremap D "+d
vnoremap <leader>. :normal .<cr>
" vnoremap <leader>b y:! pastebin '<c-r>"'
" Added from SO: https://stackoverflow.com/questions/1497958/how-do-i-use-vim-registers
vnoremap p "_dP
vnoremap . :normal .
" ↑↑↑ END VISUAL MODE BINDINGS
" ↓↓↓ FILETYPE MODIFICATION BINDINGS
nnoremap <leader>o :silent set filetype=votl<cr>
" ↑↑↑ END FILETYPE MODIFICATION BINDINGS
" ↓↓↓ ABREVIATIONS
iab <expr> dts strftime("%m/%d/%y %I:%M:%P")"
iab <expr> dtsm strftime("%m/%d/%y %T") \&mdash\; "
iab teh the
"iab ~~ Superboot
" ↑↑↑ END ABREVIATIONS
" ↓↓↓ MISC
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue 
" Commented out to use the UTL plugin mapping <return> to :Utl (see the
" Plugins section.)
"nnoremap <return> :
"vnoremap <return> :
" ↑↑↑ END MISC
" ↓↓↓ X CLIPBOARD
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>p \"+p
set pastetoggle=<F2>
" ↑↑↑ END X CLIPBOARD
" ↓↓↓ RANGER
"map <leader>r :call RangerChooser()<CR>
" Move macro recording to leader-q to free up q for ranger.
nnoremap <leader>q q 
nnoremap <silent>q :RangerOpenCurrentDir<CR>
" ↑↑↑ END RANGER
" ↓↓↓ MACROS
"map <leader>j @a
" ↑↑↑ END MACROS
" ↓↓↓ QUICK ACCESS TO SPECIFIC FILES
nnoremap <leader>ou :edit ~/.bash_utility_functions <return>
nnoremap <leader>ob :edit ~/.bashrc <return>
" ↑↑↑ END QUICK ACCESS TO SPECIFIC FILES
" ↓↓↓ BUFFER MANIPULATION
nnoremap <leader>j :bn <return>
nnoremap <leader>k :bp <return>
nnoremap <leader>d :bd <return>
nnoremap <leader><space> <c-^>
" ↑↑↑ END BUFFER MANIPULATION
" ↓↓↓ TMUX COPY BUFFER
"  This doesn't work yet. It's close, but not quite there. It enters the
"  buffer on the next line, rather than at the curser position. This is due to
"  the fact that the command escapes insert mode to execute a cmd mode
"  command. That command (read, or 'r') opens a new line under the cursor and places the
"  output there.
" inoremap <c-t> <esc>:r !tmux saveb -
" ↑↑↑ END TMUX COPY BUFFER 
" ↓↓↓ READLINE BINDINGS
nnoremap <c-u> c^
nnoremap <c-y> p
nnoremap <c-k> c$
" ↑↑↑ END READLINE BINDINGS
" ↓↓↓ TEXT FORMATTING BINDINGS
inoremap <C-u> <Esc>gUiw`]a<space>
" ↑↑↑ END TEXT FORMATTING BINDINGS
" ↓↓↓ SYNTAX HIGHLIGHTING BINDINGS
nnoremap <silent><leader>b :let b:is_bash=1 \| setlocal filetype=sh <cr>
nnoremap <silent><leader>gff :setlocal filetype=html <cr>
" ↑↑↑ END SYNTAX HIGHLIGHTING BINDINGS
" ↓↓↓ CTAGS BINDINGS
nnoremap <leader>] <c-w><c-]>
" ↑↑↑ END CTAGS BINDINGS
" ↓↓↓ DAD'S BINDINGS
"nnoremap ds <S-a>
" ↑↑↑ END DAD'S BINDINGS
" ↓↓↓ ESCAPE CURSED F1 KEY
nnoremap <F1> <esc>
inoremap <F1> <esc>
vnoremap <F1> <esc>
" ↑↑↑ END ESCAPE CURSED F1 KEY
" ↓↓↓ UTL PLUGIN -- LAUNCH EXTERNAL HANDLER
" ↑↑↑ END UTL PLUGIN -- LAUNCH EXTERNAL HANDLER

" ↑↑↑ END BINDINGS
" ↓↓↓ COLOR AUDITION
function! NextFoldColor()
    let g:colorValue = g:colorValue + 1
    exec 'hi Folded ctermbg = none ctermfg = ' . g:colorValue
    echo g:colorValue
endfunction

function! PreviousFoldColor()
    let g:colorValue = g:colorValue - 1
    exec 'hi Folded ctermbg = none ctermfg = ' . g:colorValue
    echo g:colorValue
endfunction

function! NextFoldBGColor()
    let g:colorValue = g:colorValue + 1
    exec 'hi Folded ctermbg = ' . g:colorValue
    echo g:colorValue
endfunction

function! PreviousFoldBGColor()
    let g:colorValue = g:colorValue - 1
    exec 'hi Folded ctermbg = ' . g:colorValue
    echo g:colorValue
endfunction

function! NextCommentColor()
    let g:colorValue = g:colorValue + 1
    exec 'hi Comment ctermbg = none ctermfg = ' . g:colorValue
    echo g:colorValue
endfunction

function! PreviousCommentColor()
    let g:colorValue = g:colorValue - 1
    exec 'hi Comment ctermbg = none ctermfg = ' . g:colorValue
    echo g:colorValue
endfunction

function! NextCommentBGColor()
    let g:colorValue = g:colorValue + 1
    exec 'hi Comment ctermbg = ' . g:colorValue
    echo g:colorValue
endfunction

function! PreviousCommentBGColor()
    let g:colorValue = g:colorValue - 1
    exec 'hi Comment ctermbg = ' . g:colorValue
    echo g:colorValue
endfunction

let g:colorValue = 0
"nnoremap <c-n> :call NextCommentColor() <cr>
"nnoremap <c-p> :call PreviousCommentColor() <cr>
" ↑↑↑ END COLOR AUDITION
" ↓↓↓ SYNTAX HIGHLIGHTING
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" ↑↑↑ END Code to be folded
" ↓↓↓ IMPORTS
"let repo="~/.vim/rc.d"
"source repo . "/vimwiki.conf"

" ↑↑↑ IMPORTS
