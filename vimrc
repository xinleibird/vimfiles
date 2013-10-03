" Maintainer: Xin Lei <xinleibird@gmail.com>
" ------------------------------------------


" Environment {{{
" ===============

" Basics
" ------
set nocompatible    " Must be first line
if v:progname=~?"evim"
    set nobackup
    finish
endif

if $USER=="root"
    set nobackup
    finish
endif

" Setup pathogen support
" ----------------------
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
" }}}

" General {{{
" ===========

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
set backup                              " backup
set backupcopy=yes
set backupdir=/home/xinlei/.vimbackfile/

set backspace=indent,eol,start          " backspace delete
set ruler                               " ruler
set number                              " line number
set showcmd                             " cmd complete

" Ignore file type
" ----------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" }}}

" Vim UI {{{
" ==========

" Font
" ----
if has("gui_running")
    set guifont=Monaco\ 10
endif

" Color scheme
" ------------
if has("gui_running")
    syntax enable
    let g:molokai_original = 1
else
    syntax enable
    set t_Co=256
    let g:rehash256 = 1
endif
colorscheme molokai

" Fcitx terminal vim leave insert mode timeout
" --------------------------------------------
set timeout timeoutlen=2000 ttimeoutlen=5

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

" Set Colorcolumn
" ---------------
if has("gui_running")
    set columns=82
endif

if has("autocmd")
    autocmd BufEnter * if
                \ &filetype == "java" ||
                \ &filetype == "vim" ||
                \ &filetype == "python" ||
                \ &filetype == "c" ||
                \ &filetype == "cpp" ||
                \ &filetype == "ruby" ||
                \ &filetype == "txt" ||
                \ &filetype == "text" ||
                \ &filetype == "markdown" ||
                \ &filetype == "rst"
                \ | setlocal colorcolumn=79 | endif
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
" ==============

" Normal
" ------
set confirm                             "set cursorline
set iskeyword+=_,$,@,%,#,-
set showmatch
set matchtime=5

" Indent
" ------
set autoindent
set cindent
set smartindent

" Tab
" ---
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

if has("autocmd")
    autocmd FileType ruby setlocal      " ruby indent
                \ tabstop=2
                \ softtabstop=2
                \ shiftwidth=2
endif

" Other
" -----
set wrap
set laststatus=2
set wildmenu
set autoread
set list
set listchars=tab:‣-,extends:»,precedes:«
" }}}


" Astyle and autopep8 {{{
" =======================

" Astyle
" ------
if has("autocmd")
    autocmd FileType java setlocal
                \ equalprg=astyle
                \\ -A2s4CSLwYm2M78pHUxeyjcxyxC78xL\ --mode=java
    autocmd FileType c,cpp setlocal
                \ equalprg=astyle
                \\ -A1s4CSNLwYm2M78pHUxek3W3yjcxyxC78xL\ --mode=c
endif

" Autopep8
" --------
if has("autocmd")
    autocmd FileType python setlocal
                \ equalprg=autopep8\ --ignore=W191\ /dev/stdin
endif
" }}}

" Plugins global setting {{{
" ===========

" Airline
" -------
let g:airline_theme = "powerlineish"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.whitespace = '♻ '

" YouCompleteMe setting
" ---------------------
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
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
" }}}

" CtrlP
"-----
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$\|.class$'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['sample']
let g:ctrlp_open_new_file = 'r'

" DelimitMate
" -----------
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
" }}}

" Key mapping {{{
" ===============

" Normal
" ------
noremap <silent> <leader>= :<ESC>mP<ESC> gg=G<ESC>`P<ESC>
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
" =================

" Windows maximum
" ---------------
function MaxinumGvimWindow()
    if has("gui_running")
        let s:win_name = system("wmctrl -lp | grep " . getpid())
        let s:win_list = split(s:win_name)
        let s:win_name_after = s:win_list[0]
        silent exec "!wmctrl -i -r " . shellescape(s:win_name_after) .
                    \ " -b add,maximized_vert,maximized_horz"
    endif
endfunction

if has('gui_running') && !exists('s:loaded_maxinum_gvim_window')
    let s:loaded_maxinum_gvim_window = 0
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
if !has("s:eclim_projects_tree_opened")
    let s:eclim_projects_tree_opened = 0
endif

function! ToggleEclimProjectsTree()
    if s:eclim_projects_tree_opened == 0
        :ProjectsTree
        let s:eclim_projects_tree_opened = 1
    else
        :ProjectTreeToggle
        let s:eclim_projects_tree_opened = 0
    endif
endfunction
nmap <silent> <F4> :call ToggleEclimProjectsTree()<CR>

" Add trailing semicolon
" ----------------------
function! AppendSemicolon()
    let len = col('$') - col('.')
    let line = getline('.')
    let lineLen = strlen(line)
    if matchend(line,"[;{]\\s\*$") == lineLen
        return ";"
    endif
    if matchend(line,"\^\\s*for\\s\*(.\*)\\s\*$") == lineLen
        return ";"
    endif
    if matchend(line,"([^)]*$") == lineLen
        return repeat("\<Right>",len).");".repeat("\<Left>",len+2)
    endif
    if matchend(line,"([^)]*[)][^;]*$") == lineLen
        return repeat("\<Right>",len).";".repeat("\<Left>",len+1)
    endif
    return ";"
endfunction

if !exists("autocommands_semicolon")
    let autocommands_semicolon = 1
    autocmd FileType c,cc,cpp,java,js,html,css
                \ inoremap <buffer> ; <C-R>=AppendSemicolon()<CR>
endif

" Go to the last post when you open the buffer
" --------------------------------------------
if has("autocmd")
    augroup vimrcEx
        au!
        autocmd BufReadPost * if line("'\"") > 1
                    \ && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
endif

" Set non-filetype to text
" ------------------------
autocmd BufEnter * if &filetype == "" | setlocal filetype=text | endif

" Remove trailing whitespace
" --------------------------
function RemoveTrailingWhitespace()
    if &filetype == "java" ||
                \ &filetype == "python" ||
                \ &filetype == "vim" ||
                \ &filetype == "c" ||
                \ &filetype == "cpp" ||
                \ &filetype == "ruby" ||
                \ &filetype == "txt" ||
                \ &filetype == "text"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunc
"autocmd BufWritePre *
"\ call RemoveTrailingWhitespace()

" | and Tabular
" -------------
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
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
" }}}

" Highlighting {{{
" ============

" Tailing white space highlighting
" -----------
" if has('gui_running')
"     highlight   everyThingSpaceError    guifg=#960050   guibg=#1E0010
" endif
" if exists("g:rehash256") && g:rehash256 == 1
"     highlight   everyThingSpaceError    ctermfg=125     ctermbg=233
" else
"     highlight   everyThingSpaceError    ctermfg=219     ctermbg=89
" endif
" match           everyThingSpaceError     "\s\+$"

" Highlight terminal vim colorcolumn
" ---------------------
if !has("gui_running")
    highlight ColorColumn ctermbg=236
endif

" Syntax performance
" ------------------
syntax sync minlines=512 maxlines=4096
let java_minlines = 512
let java_maxlines = 4096
" }}}
