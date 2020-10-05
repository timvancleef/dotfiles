" syntax highlighting
syntax on
set cursorline
set colorcolumn=81
set background=dark
colorscheme gruvbox

" status line
let g:modes={
       \ 'n'  : 'NORMAL',
       \ 'v'  : 'VISUAL',
       \ 'V'  : 'V·Line',
       \ '' : 'V·Block',
       \ 'i'  : 'INSERT',
       \ 'R'  : 'R',
       \ 'Rv' : 'V·Replace',
       \ 'c'  : 'Command',
       \}

hi User1 term=bold,reverse cterm=reverse ctermfg=239 ctermbg=223 gui=reverse guifg=#504945 guibg=#ebdbb2

function! StatusColor()
	let l:mode=mode()
	if (l:mode ==# 'v' || l:mode ==# 'V')
		exec 'hi StatusLine ctermfg=175 ctermbg=239'	
	elseif (l:mode ==# 'i')
		exec 'hi StatusLine ctermfg=214 ctermbg=239'	
	else
		exec 'hi StatusLine ctermfg=109 ctermbg=239'	
	endif
	return ''
endfunction

function! ModeCurrent() abort
  let l:modecurrent = mode()
  let l:modelist = toupper(get(g:modes, l:modecurrent, 'V·Block '))
  return l:modelist
endfunction

set statusline=%#StatusLine#
set statusline+=%{StatusColor()}
set statusline+=\ %{ModeCurrent()}\ 
set statusline+=%1*
set statusline+=\ %f                           " file name
set statusline+=%=                        " align left
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %#StatusLine#
set statusline+=\ %l/%L\ [%p%%]        " line X of Y [percent of file]
set statusline+=\ Col:%c\                     " current column

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" different cursor for insert mode
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

