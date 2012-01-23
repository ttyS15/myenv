
let g:Perl_MapLeader=","

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set ls=2

filetype on                " enable filetype detection
filetype plugin on
filetype plugin indent on  " LaTeX support

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
set textwidth=0                " the text width
set tabstop=4
set softtabstop=4
set formatoptions+=tcq         " basic formatting of text and comments
set matchpairs+=<:>            " match, to be used with % 
set incsearch                  " incremental search

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" folding
set foldmethod=marker
set foldcolumn=1
set foldlevel=1
" fold selection
nmap <F3> 0v/{<CR>%zf

" syntax highlighting
" set bg=light
syntax on

" 256 colors
set t_Co=256

" color scheme
colo wombat256

set gfn=DejaVu\ Sans\ Mono\ 10

" use visual bell instead of beeping
set vb
" incremental search
set incsearch
" swhith off menu & toolbar
set go-=T
set go-=m

"
" Perl
"

autocmd FileType perl set autoindent|set smartindent " autoindent
autocmd FileType perl set tabstop=4|set shiftwidth=4|set softtabstop=4 " 4 space tabs
autocmd FileType perl set showmatch " show matching brackets
autocmd FileType perl set number    " show line numbers
autocmd FileType perl set autowrite
autocmd FileType perl set expandtab " spaces as tab

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m

"
" Python
"

"Настройки табов, согласно рекоммендациям PEP-8
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set smarttab
autocmd FileType python set expandtab "Ставим табы пробелами
autocmd FileType python set softtabstop=4 "4 пробела в табе
autocmd FileType python set textwidth=80
autocmd FileType python set number
autocmd FileType python set autoindent|set smartindent

"Подсвечиваем все что можно подсвечивать
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let b:did_pyflakes_plugin = 0 

" PyLint
autocmd FileType python compiler pylint


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

"Настройка omnicomletion для Python (а так же для js, html и css)
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Для открытия связаннных файлов Django
let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("urls.py")<cr>
nnoremap \4 :call RelatedFile ("admin.py")<cr>
nnoremap \5 :call RelatedFile ("tests.py")<cr>
nnoremap \6 :call RelatedFile ( "templates/" )<cr>
nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap \8 :call RelatedFile ( "management/" )<cr>
nnoremap \0 :e settings.py<cr>
nnoremap \9 :e urls.py<cr>

fun! RelatedFile(file)
    #This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" my perl includes pod
let perl_include_pod = 1
" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" folding
let perl_fold=1
let perl_fold_blocks=1

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
