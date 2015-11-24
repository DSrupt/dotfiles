call plug#begin('~/.vim/plugged')
 Plug 'bling/vim-airline'
 Plug 'scrooloose/nerdtree'
 Plug 'tomasr/molokai'
 Plug 'tpope/vim-fugitive'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'pangloss/vim-javascript'
 Plug 'ervandew/supertab' " AutoComplete
 Plug 'kien/ctrlp.vim' "Fuzzy file serach
call plug#end()

set number
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

 colorscheme molokai
 let g:rehash256 = 1
 map <C-j> <C-W>j
 map <C-k> <C-W>k
 map <C-h> <C-W>h
 map <C-l> <C-W>l
 
 filetype indent on

 set foldmethod=syntax 
 set so=999

 autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
