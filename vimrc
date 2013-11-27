" MIT License. Copyright (c) 2013 Xin Lei. <xinleibird@gmail.com>
" vim: et ts=4 sts=4 sw=4


" Environment {{{
" ===========

" Basics
" ------

set nocompatible                        " NO compatible vi

if v:progname=~?($USER=="root")
    set runtimepath+=/home/xinlei/.vim
endif

if v:progname=~?"evim" || $TERM=~?"linux"
    finish
endif

" Setup pathogen support
" ----------------------

runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" }}}



" General {{{
" =======

" Background
" ----------

set background=dark                     " backgroud

" Other
" -----

filetype plugin indent on               " indent

if &t_Co > 2 || has("gui_running")
    syntax on                           " syntax
    set hlsearch                        " search highlight
endif

set incsearch                           " real time search

if has('mouse')
    set mouse=a                         " all mode
    set mousehide                       " hide mouse when typing
endif

set history=1000                        " history
set nobackup                            " nobackup
set backspace=indent,eol,start          " backspace delete
set ruler                               " ruler
set number                              " line number
set showcmd                             " cmd complete

" Ignore file type
" ----------------

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" }}}



" Vim UI {{{
" ======

" Font
" ----

if has("gui_running")
    set guifont=Monaco\ 10
endif

" Color scheme
" ------------

" syntax enable
" if has("gui_running")
"     let g:molokai_original = 1
" else
"     set t_Co=256
"     set background=dark
"     let g:rehash256 = 1
" endif
" colorscheme molokai

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
syntax enable
if $TERM == 'linux'
    set background=dark
else
    set background=light
endif
let g:solarized_hitrail=1
let g:solarized_menu=0
colorscheme solarized

" No menu, no scroll bar
" ----------------------

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=b
endif

" Set columns
" ---------------

if has("gui_running")
    set columns=82
endif

" }}}



" Encoding {{{
" ========

" encoding
" --------

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set fileformat=unix
set nobomb

" }}}



" Formatting {{{
" ==========

" Normal
" ------

set confirm                             "set confirm
set iskeyword+=_,$,@,%,#,-
set showmatch
set matchtime=5

" Indent
" ------

set cindent
set smartindent
set autoindent

" Tab
" ---
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Other
" -----

set wrap
set laststatus=2
set wildmenu
set autoread
set autowrite
set list
set listchars=tab:‣-,extends:»,precedes:«
" set wildmode=list:longest

" }}}



" Plug-in global setting {{{
" ======================

" YouCompleteMe setting
" ---------------------

let g:ycm_key_list_select_completion = ['<TAB>', '<PageUp>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<PageDown>']
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Tagbar
" ------

let g:tagbar_width = 30
let g:tagbar_sort = 0

" IndentLine
" ------------
let g:indentLine_char = '┊'

" Syntastic
" ---------

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_java_checkstyle_classpath =
            \"/opt/eclipse/plugins/net.sf.eclipsecs
            \.checkstyle_5.6.1.201306282206/checkstyle-5.6-all.jar"
let g:syntastic_java_checkstyle_conf_file =
            \"/home/xinlei/.vim/bundle/eclim/sun_checks_eclipse.xml"

" YouCompleteMe
" -------------

let g:ycm_global_ycm_extra_conf =
            \'/home/xinlei/.vim/bundle/
            \YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" Python highlighting
" -------------------

let python_highlight_all = 1
let python_space_error_highlight = 0
let b:python_version_2 = 1

" Rst2Ctags
" ---------

if executable("rst2ctags")
    let g:rst2ctags = 'rst2ctags'
else
    let g:rst2ctags = '/home/xinlei/.vim/bundle/rst2ctags/rst2ctags.py'
endif

" Tagbar setting
" --------------

let g:tagbar_type_rst = {
            \ 'ctagstype': 'rst',
            \ 'ctagsbin' : g:rst2ctags,
            \ 'ctagsargs' : '-f - --sort=yes',
            \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
            \ ],
            \ 'sro' : '|',
            \ 'kind2scope' : {
            \ 's' : 'section',
            \ },
            \ }

" Marktag
" -------

if executable('marktag')
    let g:tagbar_type_markdown = {
                \ 'ctagstype' : 'markdown',
                \ 'ctagsbin' : 'marktag',
                \ 'kinds' : [
                \ 'h:header'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \ 'h' : 'header'
                \  },
                \ 'scope2kind' : {
                \ 'header' : 'h'
                \ }
                \ }
endif


" Eclim
" -----

let g:EclimQuickfixSignText = '⚠'
let g:EclimLoclistSignText = '✗'
let g:EclimUserSignText = '✍'
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimWarningHighlight = "Question"
let g:EclimProjectTreeActions = [
            \ {'pattern': '.*', 'name': 'Edit', 'action': 'edit'},
            \ {'pattern': '.*', 'name': 'Split', 'action': 'split'},
            \ {'pattern': '.*', 'name': 'VSplit', 'action': 'vsplit'},
            \ {'pattern': '.*', 'name': 'Tab', 'action': 'tablast | tabnew'}
            \ ]

" CtrlP
"-----

let g:ctrlp_custom_ignore = {
            \ 'dir': '\/home\/xinlei$\|\.git$\|\.hg$\|\.svn$',
            \ 'file': '.rvm$\|.class$\|tags$\|tags-cn$\|.swp$'
            \ }
let g:ctrlp_extensions = ['sample']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_use_caching = 1
let g:ctrlp_root_markers = ['.project']

" DelimitMate
" -----------

let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 1

" }}}



" Key mapping {{{
" ===========

" Normal
" ------
noremap <silent> <leader>= <ESC>mRgg=G`R<ESC>
noremap <leader>tt :tabnew<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>fd :set fileformat=dos<CR>
noremap <leader>fu :set fileformat=unix<CR>

" Syntastic
" ---------

noremap <leader>st :SyntasticToggleMode<CR>

" Tagbar
" ------

noremap <silent> <F5> :TagbarToggle<CR>

" CtrlP
" -----

noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>

noremap <C-W><C-B> :CtrlPBuffer<CR>
nnoremap <C-W>b :CtrlPBuffer<CR>

" Eclim
" -----

map <leader><Enter> :JavaImportOrganize<CR>

" DelimitMate
" -----------

imap <expr> <CR> pumvisible()
            \ ? "\<C-Y>"
            \ : "<Plug>delimitMateCR"
imap <expr> <Backspace> pumvisible()
            \ ? "\<C-Y><Plug>delimitMateBS"
            \ : "<Plug>delimitMateBS"
imap <expr> <C-H> pumvisible()
            \ ? "\<C-Y><Plug>delimitMateS-BS"
            \ : "<Plug>delimitMateS-BS"
imap <expr> <C-L> pumvisible()
            \ ? "\<C-Y><Plug>delimitMateS-Tab"
            \ : "<Plug>delimitMateS-Tab"

" }}}



" Utility function {{{
" ================

" Windows maximum
" ---------------

function MaxinumGvimWindow()
    if has("gui_running")
        silent exec "!wmctrl -i -r " . v:windowid .
                    \ " -b add,maximized_vert,maximized_horz"
    endif
endfunction

if has('gui_running') && !exists('s:loaded_maxinum_gvim_window')
    let s:loaded_maxinum_gvim_window = 1
    autocmd VimEnter * :call MaxinumGvimWindow()
endif

" Toggle gvim fullscreen
" ----------------------

let s:fullscreen = 0
function! ToggleFullscreen()
    if s:fullscreen == 1
        let s:fullscreen = 0
        let mod = "remove"
    else
        let s:fullscreen = 1
        let mod = "add"
    endif
    call system("wmctrl -ir " . v:windowid . " -b " . mod . ",fullscreen")
endfunction
if has("gui_running")
    nmap <silent> <F11> :call ToggleFullscreen()<CR>
endif

" Eclim projects tree toggle
" --------------------------

function! ToggleEclimProjectsTree()
    if !exists('s:tree_loaded')
        let s:tree_loaded = 0
    endif
    if s:tree_loaded == 0
        :ProjectsTree
        if &ft == 'tree'
            let s:tree_loaded = 1
        else
            echo "Please run the 'eclimd' first and then confirm the project is created already!"
        endif
    else
        call eclim#project#tree#ProjectTreeClose()
        let s:tree_loaded = 0
    endif
endfunction
nmap <silent> <F4> :call ToggleEclimProjectsTree()<CR>

" Add trailing bracket
" ----------------------

function! AppendBrackets()
    let movePos = col('$') - col('.')
    let currentLine = getline('.')
    let lineCharList = split(currentLine, '\zs')
    let repeatTimes = count(lineCharList, "\(") - count(lineCharList, "\)")
    if repeatTimes > 0
        return repeat("\<Right>", movePos) . repeat(")", repeatTimes)
    endif
    return ""
endfunction

if has("autocmd") && !exists("loaded_append_brackets")
    let loaded_append_brackets = 1
    autocmd FileType c,cc,cpp,java,js,html,css,ruby,python
                \ inoremap <buffer> <C-J> <C-R>=AppendBrackets()<CR>
endif

" Remove trailing whitespace
" --------------------------

function RemoveTrailingWhitespace()
    let b:curcol = col(".")
    let b:curline = line(".")
    silent! %s/\s\+$//
    silent! %s/\(\s*\n\)\+\%$//
    call cursor(b:curline, b:curcol)
endfunc
noremap <silent> <leader><leader>= :call RemoveTrailingWhitespace()<CR>

" | and Tabular
" -------------

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' &&
                \ (getline(line('.')-1) =~# p
                \ || getline(line('.')+1) =~# p)
        let column = strlen(substitute
                    \(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],
                    \'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'
                    \.repeat('.',position),'ce',line('.'))
    endif
endfunctio
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

" }}}



" Auto Group {{{
" ==========

" Performance and colorcolumn
" ---------------------------

if has("autocmd")
    augroup bufenterGroup
        autocmd!
        autocmd BufEnter * if
                    \ &filetype == "java" ||
                    \ &filetype == "vim" ||
                    \ &filetype == "python" ||
                    \ &filetype == "c" ||
                    \ &filetype == "cpp" ||
                    \ &filetype == "ruby" ||
                    \ &filetype == "txt" ||
                    \ &filetype == "markdown" ||
                    \ &filetype == "rst"
                    \ | setlocal colorcolumn=79 | endif
    augroup END
endif

" Astyle and autopep8 and ruby type and commentstring
" ---------------------------------------------------

if has("autocmd")
    augroup filetypeGroup
        autocmd!
        autocmd FileType java setlocal
                    \ equalprg=astyle
                    \\ -A2s4CSLwYm2pHUyjcxy\ --mode=java
        autocmd FileType java
                    \ noremap <buffer> <leader><leader>= :%JavaFormat<CR>
        autocmd FileType c,cpp setlocal
                    \ equalprg=astyle
                    \\ -A1s4CSNLwYm2M78pHUk3W3yjcxyxC78\ --mode=c
        autocmd FileType python setlocal
                    \ equalprg=autopep8\ --ignore=W191\ /dev/stdin
        autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
        autocmd FileType apache,cfg,cmake,desktop,gitconfig,gtkrc,upstart
                    \ setlocal commentstring=#\ %s
    augroup END
endif


" Go to the last post when you open the buffer
" --------------------------------------------

if has("autocmd")
    augroup vimrcEx
        autocmd!
        autocmd BufReadPost * if line("'\"") > 1
                    \ && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
endif

" MAYBE can improve performance....
" ---------------------------------

if has("autocmd")
    augroup performanceGroup
        autocmd!
        autocmd BufEnter * :syntax sync minlines=256
    augroup END
endif

" }}}
