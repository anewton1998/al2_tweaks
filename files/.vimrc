call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/DrawIt'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

call plug#end()

if has('gui_running')
    " GUI colors
    colorscheme evening
else
    " Non-GUI (terminal) colors
    " e.g. colorscheme default
endif

set rnu

let g:airline#extensions#tabline#enabled = 1
map <c-l> :bn<CR>
map <c-h> :bp<CR>

