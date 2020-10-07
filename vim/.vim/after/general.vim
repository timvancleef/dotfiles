" disable vi mode
set nocompatible

"
set encoding=utf-8
set nobackup
set nowb
set noswapfile
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set laststatus=2
set ruler
set hidden
"set updatetime=300
set esckeys
set shortmess+=c
set autoread

" show linenumbers and wrapping
set number
set relativenumber
set wrap
set linebreak

" searching
set ignorecase
set smartcase
set incsearch
set hlsearch
set noshowmatch

" indentation
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" no error bells
set noerrorbells
set novisualbell
set t_vb=

" enable autocompletion
set wildmenu
set wildignore=*.o,*~,*.pyc,*/node_modules/*,*/build/*,*/dist/*
set wildmode=longest:full,full
set splitbelow splitright

" command bar
set showcmd
set noshowmode
set cmdheight=1
