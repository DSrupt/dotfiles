call plug#begin('~/.vim/plugged')
 Plug 'bling/vim-airline'
 Plug 'scrooloose/nerdtree'
 Plug 'tomasr/molokai'
 Plug 'tpope/vim-fugitive'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'pangloss/vim-javascript'
 Plug 'ervandew/supertab' " AutoComplete
 Plug 'kien/ctrlp.vim' "Fuzzy file serach
 Plug 'tpope/vim-fugitive'
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
 
 map <C-\> :!g++ % && ./a.out <CR> "TODO look into options for compiling projects. 
 filetype indent on

 set foldmethod=syntax 
 set so=999
