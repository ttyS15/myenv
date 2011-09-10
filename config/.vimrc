
let g:Perl_MapLeader=","

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set ls=2

filetype on                    " enable filetype detection
filetype plugin on

set fileencodings=utf-8,koi8-r

set nocompatible
set backspace=indent,eol,start " backspace for dummys
set showmatch                  " show matching brackets/parenthesis
set wildmode=list:longest,full " comand <Tab> completion, list matches and
                               "   complete the longest common part, then,
			       "   cycle through the matches
set showmode                   " display the current mode
set wrap                       " wrap long lines
set autoindent                 " indent at the same level of the previous line
set shiftwidth=4               " use indents of 4 spaces
set textwidth=80               " the text width
set formatoptions+=tcq         " basic formatting of text and comments
set matchpairs+=<:>            " match, to be used with % 
set ignorecase

" syntax highlighting
" set bg=light
syntax on

" color scheme
colo wombat256
" use visual bell instead of beeping
set vb
" incremental search
set incsearch
" swhith off menu & toolbar
set go-=T
set go-=m

set gfn=DejaVu\ Sans\ Mono\ 10

"
" Perl
"

" autoindent
autocmd FileType perl set autoindent|set smartindent

" 4 space tabs
autocmd FileType perl set tabstop=4|set shiftwidth=4|set softtabstop=4

" show matching brackets
autocmd FileType perl set showmatch

" show line numbers
autocmd FileType perl set number

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite
" replace tab with spaces
autocmd FileType perl set expandtab

"
" C/C++/CUDA
"

" autoindent
autocmd FileType cpp,c,cuda set autoindent|set smartindent
" 4 space tabs
autocmd FileType cpp,c,cuda set tabstop=4|set shiftwidth=4|set softtabstop=4
" show matching brackets
autocmd FileType cpp,c,cuda set showmatch
" show line numbers
autocmd FileType cpp,c,cuda set number
" replace tab with spaces
autocmd FileType cpp,c,cuda set expandtab 
" replace tab with spaces
autocmd FileType cpp,c,cuda set syntax=cpp 

"
" C/C++ Headers
"

" autoindent
autocmd FileType h set autoindent|set smartindent
" 4 space tabs
autocmd FileType h set tabstop=4|set shiftwidth=4|set softtabstop=4
" show matching brackets
autocmd FileType h set showmatch
" show line numbers
autocmd FileType h set number
" replace tab with spaces
autocmd FileType h set expandtab 

"
" Haskell
"

" autoindent
autocmd FileType haskell set autoindent|set smartindent
" 2 space tabs
autocmd FileType haskell set tabstop=2|set shiftwidth=2|set softtabstop=2
" show matching brackets
autocmd FileType haskell set showmatch
" show line numbers
autocmd FileType haskell set number
" replace tab with spaces
autocmd FileType haskell set expandtab 

"
" Shell
"

" autoindent
autocmd FileType sh set autoindent|set smartindent
" 2 space tabs
autocmd FileType sh set tabstop=4|set shiftwidth=4|set softtabstop=4
" show matching brackets
autocmd FileType sh set showmatch
" show line numbers
autocmd FileType sh set number
" replace tab with spaces
autocmd FileType sh set expandtab 

"
" Template-toolkit
"

" filetype
au BufNewFile,BufRead *.tt setf tt2html 
" autoindent
autocmd FileType tt2html set autoindent|set smartindent
" 4 space tabs
autocmd FileType tt2html set tabstop=4|set shiftwidth=4|set softtabstop=4
" show matching brackets
autocmd FileType tt2html set showmatch
" no text width
autocmd FileType tt2html set textwidth=0 
" dont replace tab with spaces
autocmd FileType sh set noexpandtab 

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
"nmap <tab> I<tab><esc>
"nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" my perl includes pod
let perl_include_pod = 1
" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" folding
"let perl_fold=1
"let perl_fold_blocks=1
"set foldmethod=marker
"nmap <F2> 0v/{<CR>%zf

" run srcipt from Vim pressing F5
map <silent> <F5> :!perl ./%<CR>

"
" Source Explorer 
"

" The switch of the Source Explorer                                         
"nmap <F8> :SrcExplToggle<CR>
                                                                             
" Set the height of Source Explorer window                                  
let g:SrcExpl_winHeight = 8
                                                                             
" Set 100 ms for refreshing the Source Explorer                             
let g:SrcExpl_refreshTime = 100
                                                                             
" Set "Enter" key to jump into the exact definition context                 
let g:SrcExpl_jumpKey = "<ENTER>"
                                                                             
" Set "Space" key for back from the definition context                      
let g:SrcExpl_gobackKey = "<SPACE>"
                                                                             
" In order to Avoid conflicts, the Source Explorer should know what plugins 
" are using buffers. And you need add their bufname into the list below     
" according to the command ":buffers!"                                      
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]
                                                                             
" Enable/Disable the local definition searching, and note that this is not  
" guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" It only searches for a match with the keyword according to command 'gd'   
let g:SrcExpl_searchLocalDef = 1
                                                                             
" Do not let the Source Explorer update the tags file when opening          
let g:SrcExpl_isUpdateTags = 1
                                                                             
" Use program 'ctags' with argument '--sort=foldcase -R' to create or       
" update a tags file                                                        
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
                                                                             
" Set "<F12>" key for updating the tags file artificially                   
let g:SrcExpl_updateTagsKey = "<F12>"

"
" Trinity
"

" The switch of all panels (Source Explorer, NERDtree, TagList) 
nmap <F8> :TrinityToggleAll<CR>

"
" Buffer Explorer
"

" Show buffers list
nmap <F2> :BufExplorer<CR>


"
" Taglist
"

let g:Tlist_Ctags_Cmd = "ctags"
let g:Tlist_Inc_Winwidth = 1
