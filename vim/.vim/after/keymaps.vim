" keyboard remaps and shortcuts
let mapleader = " "
let g:mapleader = " "

nnoremap - /

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>r :so ~/.vim/vimrc<CR>
nnoremap <silent> <leader>v :tabedit ~/.vim/vimrc<CR>
nnoremap <leader><cr> :noh<CR>
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>t <c-]>
nnoremap <silent> <C-n> :Lex<CR>

nnoremap <leader>b :Buffers<CR>
nnoremap <silent> <C-p> :GFiles<CR>

nnoremap <leader>gc :Commentary<CR>

" VIM-COC
inoremap <silent><expr> <c-@> coc#refresh()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>a :CocDiagnostics<CR>
