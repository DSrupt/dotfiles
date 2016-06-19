call plug#begin('~/.vim/plugged')
	Plug 'bling/vim-airline'
	Plug 'scrooloose/nerdtree'
	Plug 'tomasr/molokai'
	Plug 'tpope/vim-fugitive'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'pangloss/vim-javascript'
	Plug 'ervandew/supertab' " AutoComplete
	Plug 'kien/ctrlp.vim' "Fuzzy file serach
	Plug 'qpkorr/vim-bufkill' "Kill buffer without removing window
call plug#end()

let g:rehash256 = 1 "Enables 256 color version of molokai in terminals
set t_Co=256 
colorscheme molokai
let g:molokai_original = 0 "Molokai with OG dark grey background

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

set number
set splitbelow
set splitright
set foldmethod=syntax 
set so=999
set hlsearch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

filetype indent on

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
