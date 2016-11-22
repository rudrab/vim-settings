"**********************************************************
"                          VIMRC
"                      Rudra Banerjee    
"       Last Modified : Tue 22 Nov 2016 14:45:11 CET
"**********************************************************
"General "{{{
set history=700                      "  How many line Vim should remember
set nocompatible                     "  because vim is not vi
set autowrite                        "  write on shell commands
set autoread                         "  read on change outside vim
set clipboard+=unnamed               "  Yanks go on clipboard instead.


set ignorecase                       "  Searching ignore case, be smart, highlight match
set smartcase
set hlsearch
set incsearch
set fdm=marker
set magic                            "  For regular expressions turn magic on
set whichwrap+=<,>,h,l
set spell spl=en_us                  "  Set Spell
set spell
syntax enable
set omnifunc=syntaxcomplete#Complete
"}}}

"Formatting {{{
set fo+=o                            "  Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                            "  Do not automatically insert a comment leader after an enter
set tabstop=2                        "  Tabs width
set shiftwidth=2                     "  Default shift width for indents
set softtabstop=2
set expandtab                        "  but tabs are actually space
set hidden

set autoindent                       "  Indent smartly
set smartindent
set backspace=eol,start,indent       "  Configure backspace so it acts as it should act
set encoding=utf8
""}}}

"Visuals {{{
set ruler                            "  show current position
set nu                               "  show line numbers
set novisualbell                     "  No blinking
set noerrorbells                     "  No noise.
set laststatus=2                     "  Always show status line.
set vb t_vb=                         "  disable any beeps or flashes on error
set showcmd                          "  Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI                    "  Shortens messages
"set splitbelow
set splitright
"}}}

"Kay Mappings {{{
"NB: More mappings on Tabularize
"Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"super fast search/replace
nnoremap <leader>r :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>R :%s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <esc> :noh<return><esc>

"Map auto complete of (, ", ', [
inoremap (( ()<++><esc>4hi
inoremap [[ []<++><esc>4hi
inoremap {{ {}<++><esc>4hi
inoremap '' ''<++><esc>4hi
inoremap "" ""<++><esc>4hi
inoremap << <><++><esc>4hi
inoremap <> <><++><esc>4hi

vnoremap y "+y
vnoremap x "+x
vnoremap p "+p

"Move between split windows 
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"}}}

"Vundle Plugins" {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter.git'  "  Comment a line or block
Plugin 'taglist.vim'                   "  Tags
Plugin 'scrooloose/nerdtree.git'
Plugin 'fholgado/minibufexpl.vim.git'  "  Buffer explorer
Plugin 'xuhdev/SingleCompile.git'      "  Compilers
Plugin 'TeX-PDF'                       "  Compilers
Plugin 'syntastic'                     "  Syntax checker
"Plugin 'vim-flake8'                   "  python standard
Plugin 'klen/python-mode'              "  python IDE
"Plugin 'davidhalter/jedi-vim'
Plugin 'sjl/gundo.vim'                 "  git
Plugin 'tpope/vim-fugitive'            "  git
Plugin 'tpope/vim-surround'            "  Surround
Plugin 'tpope/vim-endwise'
Plugin 'edsono/vim-matchit'
Plugin 'bling/vim-airline'             "  Statusline
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'plasticboy/vim-markdown'       "  Markdown
Plugin 'shime/vim-livedown'            "  Markdown Preview
"Plugin 'vim-latex/vim-latex'          "  Latex IDE
Plugin 'gerw/vim-latex-suite'
"Plugin 'vim-scripts/c.vim'            "  C_C++ IDE
Plugin 'smancill/conky-syntax.vim'     "  Syntax Highlighter
"Plugin 'vim-scripts/gtk-vim-syntax'   "  Syntax Highlighter
Plugin 'magic-dot-files/TagHighlight'  "  Syntax Highlighter
Plugin 'SirVer/ultisnips'              "  Snippets
Plugin 'honza/vim-snippets'            "  Snippets
"My personal plugin
"Plugin 'SlateDark'                    "  vim theme(OLD)
Plugin 'vimf90' , {'pinned' : 1}       "  Fortran IDE
Plugin 'gtk-py-syntax', {'pinned' : 1}
Plugin 'vim-coogle', {'pinned' : 1}    "  vim theme
call vundle#end()
filetype plugin indent on
" Vundle done
" "}}}

augroup VIMRC
  autocmd VimEnter,GUIEnter * set visualbell t_vb=
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  au BufNewFile,BufRead *.page set  ft=mallard 
  au BufNewFile,BufRead *.page so /usr/share/vim/vim73/indent/xml.vim 
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  "autocmd BufWritePost *.py call Flake8()
  autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
  "autocmd FileType python setl sw=2 sts=2 et
  au FileType tex  nnoremap <buffer> <Leader>lm :up!<cr>:! latexmk -pdf -quiet %<cr>
augroup END

set laststatus=2


"language specific staffs:

"Fortran: {{{ 
let fortran_do_enddo = 1
let fortran_more_precise = 1
let fortran_free_source = 1
let fortran_have_tabs = 1
"}}}

"HTML: {{{
let g:xmledit_enable_html = 1
"}}}

" Python: {{{
"let g:syntastic_python_checkers = ['pep8']

"Pymode_config:
let g:pymode = 1
let g:pymode_rope = 0
let g:pymode_rope_autoimport = 0
let g:pymode_warnings = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_lint = 1
let g:pymode_lint_checkers = 'pep8'
let g:pymode_lint_on_fly = 0
let g:pymode_lint_unmodified = 0
let g:pymode_lint_ignore = "E111"
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \  softtabstop=4
    \  shiftwidth=4
    \  textwidth=79
    \  expandtab
    \  autoindent
    \  fileformat=unix
"}}}
"
"LaTeX: {{{
let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'
"}}}

"APPERAENCE {{{
if has("gui_running")
  if has("gui_gtk3")
    colorscheme vimgnome
    set textwidth=99
    set colorcolumn=100
    set lines=50 columns=135
    set guioptions-=a
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=inconsolata
  endif   
endif   
"}}}

"BUFFERS  {{{
map <leader>bd :Bclose<cr>      " Close the current buffer
map <leader>ba :1,1000 bd!<cr>  " Close all buffer
nnoremap <F12>    :bn<CR>       " Next buffer
nnoremap <S-F12>  :bp<CR>       " Previous buffer
"Opens a new tab with the current buffer's path
"Super useful when editing files in the same directory
map <leader>te :badd <c-r>=expand("%:p:h")<cr>/
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
"}}}

" wildmenu {{{
set wildmenu
set wildcharm=<C-z>
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.o,*.mod
set wildignore+=*.aux,*.bbl,*.blg,*.log,*.dbj,*.fdb_latexmk,*.fls
set wildignore+=tags
set wildignore+=*.tar.*
set wildignorecase
set wildmode=list:full
"}}}

"NerdTree/Project {{{
nnoremap <silent> <C-t> :TlistToggle<CR>
nmap <silent> <C-q> :NERDTreeToggle<cr>
let g:proj_window_width=24
let Tlist_WinWidth = 24
"}}}


"SingleCompile
nmap <F10> :SCCompile<cr>:cw<cr> 
nmap <F11> :SCCompileRun<cr> 
let g:tex_pdf_map_keys = 0
au FileType tex inoremap <silent> <F10> <Esc>:BuildTexPdf<CR>
"
"Neocomplete
let g:neocomplete#enable_at_startup = 1
"
"gundo-visualize your Vim undo tree
nnoremap <F6> :GundoToggle<CR>
let g:gundo_width = 24
let g:gundo_preview_height = 20
let g:gundo_preview_bottom = 1

"Ultisnippets {{{
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir="${HOME}/.vim/UltiSnips"
let g:UltiSnips = {}
let g:UltiSnipsalways_use_first_snippet = 1
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<s-tab>"
"}}}
" Tabularize {{{
"let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a& :Tabularize /&\zs<CR>
  vmap <Leader>a& :Tabularize /&\zs<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
"}}}
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd BufWrite *.f90 :call DeleteTrailingWS()

set completeopt=longest,menuone
autocmd QuitPre * silent! exe "1," . 10 . "g/Last Change:.*/s/Last Change:.*/Last Change: " .strftime("%c")
autocmd QuitPre * silent! exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
"autocmd CursorMovedI *.f90  :call FixName("Program")
"autocmd CursorMovedI *.f90  :call FixName("Module")
"

"Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}
"au FileType python hi def gtk3Function Function
"Many updates
