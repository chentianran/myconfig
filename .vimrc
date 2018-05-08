call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug '29decibel/codeschool-vim-theme'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'vhdirk/vim-cmake'
Plug 'majutsushi/tagbar'
call plug#end()

syntax enable
colorscheme solarized

set expandtab
set shiftwidth=4
set tabstop=4
set autoindent

"=== navigation ===
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"=== panels ======
" C-p toggles NERDTree
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

nmap <F8> :TagbarToggle<CR>

