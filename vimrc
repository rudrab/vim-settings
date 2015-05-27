"**********************************************************
"                          VIMRC
"                      Rudra Banerjee    
"       Last Modified : Sun 24 May 2015 12:48:49 PM BST
"**********************************************************
"General Settings
"How mani line vim should remember
set history=700
"set undofile
"because vim is not vi
set nocompatible

"Indent smartly
set autoindent
set smartindent

"show current position
set ruler
set nu 

"set paste
" Searching ignore case, be smart, highlight match
set ignorecase
set smartcase
set hlsearch
set incsearch 

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Tabs width
set tabstop=8 shiftwidth=2 softtabstop=4
" but tabs are actually space
set expandtab
set hidden

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fholgado/minibufexpl.vim.git'
Plugin 'xuhdev/SingleCompile.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/gtk-vim-syntax'
Plugin 'taglist.vim'
Plugin 'SirVer/ultisnips'
Plugin 'gerw/vim-latex-suite'
Plugin 'scrooloose/nerdtree.git'
Plugin 'TeX-PDF'
Plugin 'syntastic'
Plugin 'vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'edsono/vim-matchit'
Plugin 'sjl/gundo.vim'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'smancill/conky-syntax.vim'
Plugin 'https://github.com/vim-scripts/DidYouMean'
Plugin 'https://github.com/magic-dot-files/TagHighlight'
"Plugin 'Shougo/neocomplete.vim'
"My personal plugin
Plugin 'SlateDark'
Plugin 'vimf90' , {'pinned' : 1}
Plugin 'vim-gnome-google' , {'pinned' : 1}
call vundle#end()

" Vundle done
" set these on
filetype plugin indent on

"======================
"LANGUAGE SPECIFIC STAFFS
"
augroup VIMRC
  autocmd VimEnter,GUIEnter * set visualbell t_vb=
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  au BufNewFile,BufRead *.page set  ft=mallard 
  au BufNewFile,BufRead *.page so /usr/share/vim/vim73/indent/xml.vim 
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd BufWritePost *.py call Flake8()
  autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
  autocmd FileType python set tabstop=8 expandtab shiftwidth=4 softtabstop=4
  au FileType tex  nnoremap <buffer> <Leader>lm :up!<cr>:! latexmk -pdf -quiet %<cr>
augroup END


" fortran stuff
let fortran_do_enddo = 1
let fortran_more_precise = 1
let fortran_free_source = 1
let fortran_have_tabs = 1

" html
let g:xmledit_enable_html = 1

" python
let g:syntastic_python_checkers = ['pep8']
"
 
"latex stuff
let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'


syntax enable
set omnifunc=syntaxcomplete#Complete

"
"APPERAENCE
"
if has('gui_running')
  colorscheme vimgnome
  set textwidth=99
  set colorcolumn=100
  set lines=38 columns=135
  set guioptions-=a
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
  set guifont=inconsolata
endif   

"Set Spell
set spell spl=en_us
set spell

"
"BUFFERS
"
" Close the current buffer
map <leader>bd :Bclose<cr>
map <leader>ba :1,1000 bd!<cr>
nnoremap <F12>    :bn<CR>
nnoremap <S-F12>  :bp<CR>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :badd <c-r>=expand("%:p:h")<cr>/
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

"wildmenu
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

" super fast search/replace
nnoremap <leader>r :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>R :%s/\<<C-r>=expand('<cword>')<CR>\>/

" Map auto complete of (, ", ', [
inoremap (( ()<++><esc>4hi
inoremap [[ []<++><esc>4hi
inoremap {{ {}<++><esc>4hi
inoremap {} {<esc>o}<++><esc>O
inoremap '' ''<++><esc>4hi
inoremap "" ""<++><esc>4hi
inoremap << <><++><esc>4hi
inoremap <> <><++><esc>4hi

vnoremap y "+y
vnoremap x "+x
vnoremap p "+p


"NerdTree/Project
nnoremap <silent> <C-t> :TlistToggle<CR>
nmap <silent> <C-q> :NERDTreeToggle<cr>
let g:proj_window_width=24
let Tlist_WinWidth = 24

"Move between split windows 
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

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

"ultisnippets
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir="${HOME}/.vim/UltiSnips"
let g:UltiSnips = {}
let g:UltiSnipsalways_use_first_snippet = 1
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<s-tab>"

"let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a& :Tabularize /&\zs<CR>
  vmap <Leader>a& :Tabularize /&\zs<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.f90 :call DeleteTrailingWS()

set completeopt=longest,menuone
autocmd QuitPre * silent! exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")


""Fortran Makefile creator
""Autoconf
"function! MakeAConf()
"python<< EOF
"import vim
"import os
"binname=os.path.basename(os.getcwd())
"with open("configure.ac.gen","w") as con:
"    con.write("#This file is generated by vimf90 plugin\n#This is a bare bone configure.ac file\n")
"    con.write("#AC_PREREQ(2.69)\n")
"    con.write("AC_INIT(["+binname+"],[0.1])\n")
"    con.write("AC_CONFIG_AUX_DIR([build-aux])\nAC_CONFIG_HEADERS([config.h])\nAC_CONFIG_MACRO_DIR([m4])\n")
"    con.write("AM_INIT_AUTOMAKE([1.9.6 dist-bzip2 subdir-objects foreign])\n")
"    con.write("AC_OPENMP\nFCFLAGS=\"$OPENMP_FFLAGS -std=f2008 -g\"\nAC_PROG_FC([gfortran])\n")
"    con.write("AC_CONFIG_FILES([\n\tMakefile\n\t])\nAC_OUTPUT")
"EOF
"endfunction   

""Automake
"function! MakeAMake()
"python<<EOF
"import vim
"import os
"binname=os.path.basename(os.getcwd())
"path = "."
"slsts=[" "]
"s=" "
"for dirs, subdirs, files in os.walk(path):
"  for srcs in files:
"    if srcs.endswith((".f", ".f90", ".F", ".F90")):
"      snm=dirs+"/"+srcs
"      s +=snm+" "
"with open("Makefile.am.gen","w") as mak:
"  mak.write("#This file is generated by vimf90 plugin\n#This is a bare bone Makefile.am file\n")
"  mak.write("bin_PROGRAMS =\t"+binname+"\n")
"  mak.write(binname+"_SOURCES =\t"+s+"\n")
"  #  mak.write(slsts[0:])
"  mak.write("depend depend.mk:\n\tmakedepf90 $("+binname+"_SOURCES) >depend.mk\n")
"  mak.write("@am__include@ @am__quote@depend.mk@am__quote@\n") 
"  mak.write(binname+"_LDADD = \nEXTRA_DIST= \nCLEANFILES =*.mod,*.o")
"EOF
"endfunction
