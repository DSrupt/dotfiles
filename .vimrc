" source ~/.govimrc
call plug#begin('~/.vim/plugged')
    Plug 'liuchengxu/eleline.vim'
    Plug 'mhinz/vim-startify'
    Plug 'felikz/ctrlp-py-matcher'
    Plug 'scrooloose/nerdtree'
    Plug 'xuyuanp/nerdtree-git-plugin'
    Plug 'liuchengxu/space-vim-dark'
    Plug 'itchyny/vim-cursorword'
    Plug 'danro/rename.vim'
    Plug 'anyakichi/vim-surround'
    Plug 'liuchengxu/vim-better-default'
    Plug 'haya14busa/incsearch.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'tpope/vim-fugitive'
    Plug 'ervandew/supertab' " AutoComplete
    Plug 'kien/ctrlp.vim' "Fuzzy file serach
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'gabrielelana/vim-markdown'
	Plug 'avakhov/vim-yaml'
    Plug 'fatih/vim-go'
    Plug 'majutsushi/tagbar'
    Plug 'chriskempson/base16-vim'
	Plug 'beautify-web/js-beautify'
    Plug 'nightsense/office'
call plug#end()

let mapleader = '`'
map <Leader> t :Tags<CR>

set t_Co=256
set termguicolors
set background=dark
colo office-light 

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" M-h go to tab left
noremap ;h :tabprevious<CR>
" M-l go to tab right
noremap ;l :tabnext<CR>

" M-n create new tab
nnoremap <Leader>; :tabnew<CR>
" M-c close current tab
nnoremap ç :tabclose<CR>

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
set textwidth=80

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"colorscheme space-vim-dark
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
