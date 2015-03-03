"General Settings
"
"How mani line vim should remember
set history=700

"because vim is not vi
set nocompatible

"Indent smartly
set autoindent
set smartindent

"show current position
set ruler
set nu 

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
set tabstop=8 shiftwidth=2 softtabstop=2
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
"My personal plugin
Plugin 'SlateDark'
Plugin 'file:///home/rudra/Devel/vimf90'
call vundle#end()

" Vundle done
" set these on
filetype plugin indent on
syntax enable
set omnifunc=syntaxcomplete#Complete

"
"APPERAENCE
"
if has('gui_running')
  colorscheme SlateDark
  set textwidth=99
  set colorcolumn=100
  set lines=38 columns=135
  set guioptions-=a
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
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
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
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
inoremap >> <><++><esc>4hi

vnoremap y "+y
vnoremap x "+x
vnoremap p "+p
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


" Fortran stuff
:let fortran_do_enddo=1
:let fortran_more_precise=1
:let fortran_free_source=1
:let fortran_have_tabs=1

":nnoremap <Leader>lw :up!<cr>:call Tex_RunLaTeX()<cr>


"html
let g:xmledit_enable_html = 1

"python
let g:syntastic_python_checkers = ['pep8']
"============================
"
"lATEX 
"latex only
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'

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
":nnoremap <Leader>lf :up!<cr>:! ifort %<cr>
"au FileType fortran nnoremap <buffer> <Leader>lm :up!<cr>:! ifort %<cr>
nmap <F10> :SCCompile<cr>:cw<cr> 
nmap <F11> :SCCompileRun<cr> 
let g:tex_pdf_map_keys = 0
au FileType tex inoremap <silent> <F10> <Esc>:BuildTexPdf<CR>
"autocmd Filetype tex nmap <buffer> <F9> :SCCompileAF -quiet <cr>:cw<cr>


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

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.f90 :call DeleteTrailingWS()

" Create a scratch buffer with a list of files (full path names).
" Argument is a specification like '*.c' to list *.c files (default is '*').
" Can use '*.[ch]' to find *.c and *.h (see :help wildcard).
" If command uses !, list includes matching files in all subdirectories.
" If filespec contains a slash or backslash, the path in filespec is used;
" otherwise, start searching in directory of current file.
function! s:Listfiles(bang, filespec)
  if a:filespec =~ '[/\\]'  " if contains path separator (slash or backslash)
    let dir = fnamemodify(a:filespec, ':p:h')
    let fnm = fnamemodify(a:filespec, ':p:t')
  else
    let dir = expand('%:p:h')  " directory of current file
    let fnm = a:filespec
  endif
  if empty(fnm)
    let fnm = '*'
  endif
  if !empty(a:bang)
    let fnm = '**/' . fnm
  endif
  let files = map(globpath(dir, fnm, 0, 1), 'fnamemodify(v:val, ":t:r")')  
  echo files len(files)
  echo 'dir=' dir ' fnm=' fnm ' len(files)=' len(files)
  if empty(files)
    echo 'No matching files'
    return
  endif
  new
  setlocal buftype=nofile bufhidden=hide noswapfile
  call append(line('$'), files)
  1d  " delete initial empty line
  " sort i  " sort, ignoring case
endfunction
command! -bang -nargs=? Listfiles call s:Listfiles('<bang>', '<args>')

set completeopt=longest,menuone
"fun! CompleteUse(findstart, base)
"  if a:findstart
"    " locate the start of the word
"    let line = getline('.')
"    let start = col('.') - 1
"    while start > 0 && line[start - 1] =~ '\a'
"      let start -= 1
"    endwhile
"    return start
"  else
"    " find months matching with "a:base"
"    let res = []
"    let dir = "./src/"
"    let fnm = "*.f90"
"    let files = map(globpath(dir, fnm, 0, 1), 'fnamemodify(v:val, ":t:r")')
"    for m in files
"      if m =~ '^' . a:base
"        call add(res, m)
"      endif
"    endfor
"    return res
"  endif
"endfun
"command! Common call CompleteMonths('<bang>', '<args>')
"set completefunc=CompleteUse

inoremap \use use <C-R>=ListMods()<CR>
"func! ListMods()
  "let dir = "./src/"
  "let dir2 = "./"
  "let fnm = "*.f90"
  "let files = map(globpath(dir, fnm, 0, 1), 'fnamemodify(v:val, ":t:r")')
  "let files2 = map(globpath(dir2, fnm, 0, 1), 'fnamemodify(v:val, ":t:r")')
  "call extend(files, files2)
  "call complete(col('.'), files)
  "return ''
"endfunc


func! ListMods()
  if ! exists('g:modpath')
    let g:modpath = 'src,,.'
  endif
  call complete(col('.'), map(globpath(g:modpath, '*.f90', 0, 1), 'fnamemodify(v:val, ":t:r")'))
  return ''
endfunc
