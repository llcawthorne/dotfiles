" This must be first, because it changes other options as side effect
set nocompatible

" I never turn these off
syntax on
filetype plugin indent on

" pathogen makes handling bundles clean and easy
call pathogen#infect()
call pathogen#helptags()

" Unless I find myself missing easy repeats of f/t/F/T
" map ; :
" noremap ;; ;
" change the mapleader from \ to ,
" let mapleader=","
" let g:mapleader=","
" fast save
nmap <leader>w :w!<cr>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
inoremap <C-e> <C-o>$

set gfn=Menlo\ for\ Powerline:h13

set wrap          " wrap lines
set linebreak
set nolist

set colorcolumn=78
set tabstop=2     " a tab is four spaces
set expandtab     " tabs to spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set si
set number        " always show line numbers
set relativenumber
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set matchpairs+=<:>
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class,*.aux,*.pdfsync,*.pdf
set wildignore+=*.o,*.so,*~,*.gz,*.zip,*.tgz,*.log,.git,*.exe,*/tmp/*
set wildignore+=*.ind,*.idx,*.ilg,*.inx,*.out,*.toc,*.ln,*.dvi,*.bbl
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb
set suffixes+=.ind,.idx,.ilg,.inx,.out,.toc,.ln,.class,.pdf,.pdfsync
set suffixes+=.pyc,*.gz,*.tgz
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set ruler                " display line/col in bottom right

"set hid             " A buffer becomes hidden when abandoned (testing)
set lazyredraw

set encoding=utf8
set nobackup
set noswapfile

set background=dark
colorscheme railscasts
"colorscheme gotham256

if &t_Co > 256 || has("gui_running")
   colorscheme railscasts
   "colorscheme gotham
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

set mouse=a

" keymaps
"map <C-e> $
"map <C-a> <Home>
map <SPACE> 20gjzz
map <S-SPACE> 20gkzz

" clear last search (to remove highlight)
map <F3> :let @/ = ""<CR>

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" make tab in visual mode indent code
vmap <tab> >gv
vmap <s-tab> <gv
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline=%([%-n]%y\ %f%M%R%)\ \ %=\ %(%l,%c%V\ %P\ [0x%02.2B]%)
"" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
nmap <leader>/ :nohlsearch<CR>

" run pdflatex
map <leader>p :w<CR>:!pdflatex % &<CR> 

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" move through buffers
nmap <C-n> :bnext<CR>  " next buffer
nmap <C-p> :bprev<CR>  " prev buffer

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" http://vimdoc.sourceforge.net/htmldoc/vimfaq.html
" 5.5 How do I configure Vim to open a file at the last edited location?
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

"""
" Another small useful feature
"""
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

filetype plugin indent on

set nocompatible
set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000
set clipboard+=unnamedplus

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after 
endif

set nocp
execute pathogen#infect()

set background=dark
colorscheme railscasts

if !has("gui_running")
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme railscasts 
endif

let mapleader=" "

