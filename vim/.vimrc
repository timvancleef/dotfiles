let mapleader = ","
let g:mapleader = ","

" NETRW Settings
"
let g:netrw_banner = 1
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
"let g:netrw_winsize   = 30
" open files from netrw in a previous window, unless we're opening the current dir
"if argv(0) ==# '.'
"    let g:netrw_browse_split = 0
"else
"    let g:netrw_browse_split = 4
"endif
let g:netrw_altv=1
let g:netrw_alto=1
let g:netrw_browse_split = 4
let g:typescript_indent_disable = 1

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
" Initialize plugin system
call plug#end()
" Gruvbox Settings
"
"let g:gruvbox_contrast_dark="hard"

" Some basics:
"
set nocompatible
filetype off
syntax on
set encoding=utf-8
set number relativenumber
set autoread
set notimeout ttimeout
set path=.,**
set background=dark
colorscheme gruvbox

filetype plugin indent on

nnoremap <C-t> :Vex<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Fast existing
nmap <leader>q :q<cr>
nmap <leader>a :qa<cr>

" Enable autocompletion:
set wildmenu
set wildignore=*.o,*~,*.pyc,*/node_modules/*,*/build/*,*/dist/*
set wildmode=longest:list,full
set splitbelow splitright

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" When searching try to be smart about cases 
set ignorecase
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=120

" Indentation
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Show command useful for <leader> commands
set showcmd

" STATUSLINE
"
" Always show the status line
set laststatus=2
set ruler

" Format the status line
set clipboard^=unnamed

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Fira\ Code:h12
endif

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<space>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /

" Replace all is aliased to S.
nnoremap S :%s//gc<Left><Left><Left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*<left><left><left><left><left><left>
nnoremap gr :vimgrep <cword> **<left><left>
nnoremap gR :vimgrep '\b<cword>\b' **<left><left>

" Jump to tag
nnoremap t <c-]>

" Resize
nnoremap <leader>* :vert res +
nnoremap <leader>+ :vert res +50<CR>
nnoremap <leader>_ :vert res -
nnoremap <leader>- :vert res -50<CR>

"au BufRead,BufNewFile *.ts   setfiletype typescript
"au BufRead,BufNewFile *.tsx   setfiletype typescript
