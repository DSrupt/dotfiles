call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'mhinz/vim-startify'
    Plug 'felikz/ctrlp-py-matcher'
    Plug 'scrooloose/nerdtree'
    Plug 'xuyuanp/nerdtree-git-plugin'
    Plug 'itchyny/vim-cursorword'
    Plug 'danro/rename.vim'
    Plug 'anyakichi/vim-surround'
    Plug 'liuchengxu/vim-better-default'
    Plug 'haya14busa/incsearch.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'tpope/vim-fugitive'
    Plug 'ervandew/supertab' " AutoComplete
    " Plug 'ycm-core/YouCompleteMe'
    Plug 'kien/ctrlp.vim' "Fuzzy file serach
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'gabrielelana/vim-markdown'
	Plug 'avakhov/vim-yaml'
    Plug 'majutsushi/tagbar'
	Plug 'beautify-web/js-beautify'
    Plug 'nightsense/office'
	Plug 'bfrg/vim-cpp-modern'
    Plug 'rhysd/vim-clang-format'
	Plug 'kana/vim-operator-user'
    Plug 'scrooloose/nerdcommenter'
    Plug 'altercation/vim-colors-solarized'
    Plug 'aradunovic/perun.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'sjl/badwolf'
    Plug 'Chiel92/vim-autoformat'
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'ajh17/vimcompletesme'
call plug#end()

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

let mapleader = '`'

let g:onedark_hide_endofbuffer=1

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"set t_Co=256
"set termguicolors
colo onedark

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


nnoremap ;h gT
nnoremap ;l gt

nnoremap <leader>t :tabnew<CR>

nnoremap <leader>n :NERDTreeToggle <CR>

nnoremap ;w :w<CR>
nnoremap ;q :q<CR>

nnoremap ;n :noh<CR>
nnoremap ;t :Tags<CR>
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Use | and _ to split windows (while preserving original behaviour of [count]bar and [count]_).
nnoremap <expr><silent> <Bar> v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"
nnoremap <expr><silent> _     v:count == 0 ? "<C-W>s<C-W><Down>"  : ":<C-U>normal! ".v:count."_<CR>"

set number
set splitbelow
set splitright
set foldmethod=syntax
set hlsearch

set tabstop=4
set softtabstop=4
set shiftwidth=2
set expandtab

filetype indent on
set textwidth=80

autocmd FileType *.c setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


autocmd BufWritePre *cc :ClangFormat
autocmd BufWritePost *vimrc :so %


iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

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


