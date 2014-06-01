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

if v:progname=~?"evim"
    finish
endif

" Setup pathogen support
" ----------------------
runtime bundle/pathogen/autoload/pathogen.vim

if $TERM == 'linux'
    let g:pathogen_disabled = ["vim-cdoc", "lightline", "lightline-extension"]
else
    let g:pathogen_disabled = ["statline"]
endif

execute pathogen#infect()

" }}}

" General {{{
" =======

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
    set guioptions-=e   " gui tabline close
endif

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

set history=100                         " history
set backup
set backupdir=/home/xinlei/.backfile
set backspace=indent,eol,start          " backspace delete
set ruler                               " ruler
set number                              " line number
set showcmd                             " cmd complete

" Ignore file type
" ----------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" }}}

" Vim Appearance {{{
" ======

" Font
" ----
if has("gui_running")
    set guifont=Monaco\ 10
endif

" Color scheme
" ------------
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
    set background=dark
    colorscheme jellybeans
    let g:jellybeans_background_color_256 = "None"
endif

if has("gui_running")
    set background=dark
    colorscheme jellybeans
endif

if &term is# "linux"
    set background=dark
    colorscheme jellybeans
    let g:jellybeans_use_lowcolor_black = 0
endif

syntax enable

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
" language en_US.UTF-8

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
set listchars=tab:‣-,extends:»,precedes:«,trail:\ ,

" }}}

" Key mapping {{{
" ===========

" Normal
" ------
noremap <silent> <leader>= <ESC>mRgg=G`R<ESC>

" Syntastic
" ---------
noremap <leader>st :SyntasticToggleMode<CR>

" Tagbar
" ------
noremap <silent> <F9> :TagbarToggle<CR>

" CtrlP
" -----
noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>

noremap <C-W><C-B> :CtrlPBuffer<CR>
nnoremap <C-W>b :CtrlPBuffer<CR>

" Eclim
" -----
noremap <leader><leader><Enter> :JavaImportOrganize<CR>
noremap <F5> :ProjectRefresh<CR>
noremap <F6> :ProjectBuild<CR>
noremap <F7> :ProjectRefresh<CR> :ProjectBuild<CR>
noremap <F8> :Java<CR>

" Matchem
" -------
" imap <c-l> <Plug>MatchemSkipNext
" imap <c-j> <Plug>MatchemSkipAll

" Zeal
nnoremap gz :!zeal --query "<cword>"&<CR> :redraw!<CR>

" }}}

" Plug-in global setting {{{
" ======================

" YouCompleteMe setting
" ---------------------
let g:ycm_key_list_select_completion = ['<TAB>', '<PageUp>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<PageDown>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf =
            \ '/home/xinlei/.vim/bundle/util/ycm/c_conf.py'
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'tree' : 1,
      \ 'mail' : 1
      \}

" Tagbar
" ------
let g:tagbar_width = 30
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['▸', '▾']

" Syntastic
" ---------
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'

" Python highlighting
" -------------------
let python_highlight_all = 1
let python_space_error_highlight = 0
let b:python_version_2 = 1

" Tagbar setting
" --------------
let g:tagbar_type_rst = {
            \ 'ctagstype': 'rst',
            \ 'ctagsbin' : '/home/xinlei/.vim/bundle/rst2ctags/rst2ctags.py',
            \ 'ctagsargs' : '-f - --sort=yes',
            \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
            \ ],
            \ 'sro' : '|',
            \ 'kind2scope' : {
            \ 's' : 'section',
            \ },
            \ 'sort': 0,
            \ }

" Markdown2Ctags
" --------------
let g:tagbar_type_markdown = {
            \ 'ctagstype': 'markdown',
            \ 'ctagsbin' :
            \ '/home/xinlei/.vim/bundle/markdown2ctags/markdown2ctags.py',
            \ 'ctagsargs' : '-f - --sort=yes',
            \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
            \ ],
            \ 'sro' : '|',
            \ 'kind2scope' : {
            \ 's' : 'section',
            \ },
            \ 'sort': 0,
            \ }

" Ruby
" ----
let g:tagbar_type_ruby = {
            \ 'kinds' : [
            \ 'm:modules',
            \ 'c:classes',
            \ 'd:describes',
            \ 'C:contexts',
            \ 'f:methods',
            \ 'F:singleton methods'
            \ ]
            \ }

" Eclim
" -----
let g:EclimTempFilesEnable = 0 " Important! Do *NOT* use temp file!
let g:EclimQuickfixSignText = '!'
let g:EclimLoclistSignText = 'x'
let g:EclimUserSignText = 'u'
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimWarningHighlight = 'Question'
let g:EclimBrowser = 'webbrowser-app'
let g:EclimProjectTreeActions = [
            \ {'pattern': '.*', 'name': 'Edit', 'action': 'edit'},
            \ {'pattern': '.*', 'name': 'Split', 'action': 'split'},
            \ {'pattern': '.*', 'name': 'VSplit', 'action': 'vsplit'},
            \ {'pattern': '.*', 'name': 'Tab', 'action': 'tablast | tabnew'}
            \ ]

" Vim-markdown
" ------------
let g:markdown_fenced_languages = ["ruby", "python", "java", "sh", "c", "cpp",
            \ "vim"]

" CtrlP
" -----
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_use_caching = 1
let g:ctrlp_root_markers = ['.project']
let g:ctrlp_lazy_update = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
            \'dir':'
            \Video\|Music\|\.git\|\.hg\|\.svn\|_darcs\|\.bzr\|\.cdv\|\~\.dep\|
            \\~\.dot\|\~\.nib\|\~\.plst\|\.pc\|_MTN\|blib\|CVS\|RCS\|
            \SCCS\|_sgbak\|autom4te\.cache\|cover_db\|_build
            \',
            \'file':'
            \\~$\|#.+#$\|[._].*\.swp$\|core\.\d+$\|\.exe$\|\.so$\|\.bak$\|
            \\.png$\|\.jpg$\|\.jpeg$\|\.swf$\|\.gif$\|\.zip$\|\.rar$\|\.tar$\|
            \\.gz$\|\.bz2$\|\.jar$\|.7z$\|
            \\.xmi$\|\.class$\|\.classpath$\|\.project$\|\.svg$\|\.ico$\|
            \\.pdf$\|\.out$\|\.chm$\|\.deb$\|\.fskin$\|\.ttf$
            \'}

" CtrlP Matcher Settings
" ----------------------
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

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

" if has('gui_running') && !exists('s:loaded_maxinum_gvim_window')
"     let s:loaded_maxinum_gvim_window = 1
"     autocmd VimEnter * :call MaxinumGvimWindow()
" endif

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
            :wincmd p
        else
            let avaiableEclim = eclim#EclimAvailable()
            if avaiableEclim
                echo "Please confirm the project is created already!"
            endif
        endif
    else
        call eclim#project#tree#ProjectTreeClose()
        let s:tree_loaded = 0
    endif
endfunction
nmap <silent> <F4> <ESC>:call ToggleEclimProjectsTree()<CR>

" Remove trailing whitespace
" --------------------------
function RemoveTrailingWhitespace()
    let b:curcol = col(".")
    let b:curline = line(".")
    silent! %s/\s\+$//
    silent! %s/\(\s*\n\)\+\%$//
    call cursor(b:curline, b:curcol)
endfunc
noremap <silent> <leader><Space> :call RemoveTrailingWhitespace()<CR>

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

" Gollum auto commit
" ------------------
function! AutoCommitGollum()
    :w
    !cd %:h && git add -A && git commit -m 'update'
    :redraw
endfunction

if has("autocmd") && !exists("s:loaded_markdown_make")
    let s:loaded_markdown_make = 1
    autocmd FileType markdown,rst
                \ command! -buffer Gollum :call AutoCommitGollum()
    autocmd FileType markdown,rst let &l:makeprg=
                \"cd %:h && git add -A && git commit -m 'update'"
endif
" }}}

" Auto Group {{{
" ==========

" Set conf filetype
" -----------------
if has("autocmd")
    augroup bufReadGroup
        autocmd!
        " set conf filetype
        autocmd BufNewFile,BufRead *.conf
                    \ if &ft =~# '^\%(conf\|modula2\)$' |
                    \   set ft=conf |
                    \ else |
                    \   setf conf |
                    \ endif
    augroup END
endif

" Astyle, autopep8, JavaFormat, ruby type, commentstring, colorcolumn, synmaxcol
" ------------------------------------------------------------------------------
if has("autocmd")
    augroup filetypeGroup
        autocmd!
        autocmd FileType java setlocal
                    \ equalprg=astyle
                    \\ -A2s4CSLwYm2pHUyjcxy\ --mode=java
        autocmd FileType plantuml setlocal
                    \ equalprg=astyle
        autocmd FileType java
                    \ noremap <buffer> <leader><leader>= :%JavaFormat<CR>
        autocmd FileType c,cpp setlocal
                    \ equalprg=astyle
                    \\ -A2s4CSNLwYm2M80pHUk3W3yjcxyxC80\ --mode=c
        autocmd FileType python setlocal
                    \ equalprg=autopep8\ --ignore=W191\ /dev/stdin
        autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
        autocmd FileType apache,conf,cfg,cmake,desktop,dnsmasq,gitconfig,gtkrc,
                    \upstart
                    \ setlocal commentstring=#\ %s
        autocmd FileType c
                    \ setlocal commentstring=//\ %s
        " autocmd FileType java,vim,python,c,cpp,ruby,markdown,rst,txt
        "             \ setlocal colorcolumn=81
        " autocmd FileType markdown,rst,txt
        "             \ setlocal synmaxcol=256
    augroup END
endif

" Terminal ttimeout
" -----------------
if !has('gui_running')
    set ttimeoutlen=100
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Fcitx setting
" -------------
set imdisable

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
        autocmd BufEnter * :syntax sync minlines=1024 maxlines=4096
    augroup END
endif

" }}}
