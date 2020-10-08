" plugins and indentation based on filetype
filetype off

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'niftylettuce/vim-jinja'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

" FZF
let g:fzf_preview_window = ''

" Markdown
let g:vim_markdown_folding_disabled = 1

filetype plugin indent on
