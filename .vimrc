" set encoding=utf-8

"  Searching
set nohlsearch  " do not highlight search patterns
set incsearch   " incremental search (search while pattern is typed)
set smartcase   " case-insensitive searching until pattern is in lower case

" Misc
set laststatus=2    " always display the status line
set title titlestring=vim\ -\ %F\ %h " format of the window title
set nofoldenable          " use folding
set foldmethod=syntax   " use language syntax for folding
set visualbell      " Don't beep me, you beep!
set shiftwidth=4        " Width of text shift - <, <<, > or >>.

colorscheme elflord

 " Coloring
syntax on       " switch on syntax highlighting
"set bg=         " use colors for the dark background

"Highlighting

 " Options


set nu!         " Show number of row
set nowrap              " Set no wrapping strings
set autoindent  " automatic indenting of new lines
set autowrite   " saves unwritten buffers
set nobackup    " do not create backup files
set bs=2        " backspace over everything in insert mode
set ruler       " show cursor position in the file
set history=50  " keep last 50 commands
" set showcmd=1 " show command autocompletion
" set wildmenu=1    " show autocompetion in status menu
set tabstop=4   " tabs are 4 characters long
set wrapmargin=1    " margin from the right to show wrapping
"set formatoptions=tcrqn

highlight Comment ctermfg=green
"set colorscheme elflord

" EmbPerl highlight
"let perl_fold=1
augroup filetypedetect
autocmd BufNewFile,BufRead * setf mason
autocmd BufNewFile,BufRead *.p?,*.cgi setf perl
autocmd! BufNewFile,BufRead *.epl setf embperl
autocmd! BufNewFile,BufRead *.mas,*.html setf mason
augroup END

" Configuration of tag list plugin
" Key map on open/close taglist
nnoremap <silent> <F8> :Tlist<CR>       
"nnoremap <silent> <F9> :WMClose<CR>            " Key map on synchronization
map <silent> <F4> :!perl -c %<ENTER>
" Key map for run current file
map <silent> <F5> :!perl %<ENTER>
map <silent> <F3> :!php -l %<ENTER>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let winManagerWindowLayout = 'TagList|BufExplorer'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"                    " Sort of function list by name
let Tlist_Use_Horiz_Window = 0                  " Horizont split of window
"let Tlist_Use_Right_Window = 1                 " Functions list is on right
"let Tlist_Auto_Open = 1                                " 0 by default
"let Tlist_Display_Prototype = 1                " 0 by default
let Tlist_WinWidth = 20                                 " Width of tag list window
let Tlist_Compact_Format = 1
"let Tlist_Use_SingleClick = 1

let winManagerWidth=20
let winManagerHeight=20

 map <C-d> :call SwitchDB()<CR>
 :function SwitchDB()
 : let g:current_db = input("Database > ") . " -uroot"
 :endfunction

 map <C-m> :call Doquery()<CR>
 :function Doquery()
 : if !exists("g:current_db")
 : call SwitchDB()
 : endif
 : let query_string = input(g:current_db . " > " )
 : if query_string != ""
 : exe "!mysql " . g:current_db . " -e \"" . escape(query_string, '"') . "\""
 : endif
 :endfunction
