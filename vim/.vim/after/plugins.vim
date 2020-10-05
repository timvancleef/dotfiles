" plugins and indentation based on filetype
filetype off

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'tpope/vim-commentary'
"Plug 'niftylettuce/vim-jinja'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" FZF
let g:fzf_preview_window = ''

filetype plugin indent on
