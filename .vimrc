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
    " Plug 'ervandew/supertab' " AutoComplete
    " Plug 'ycm-core/YouCompleteMe'
    Plug 'kien/ctrlp.vim' "Fuzzy file serach
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'gabrielelana/vim-markdown'
	Plug 'avakhov/vim-yaml'
	Plug 'beautify-web/js-beautify'
	Plug 'bfrg/vim-cpp-modern'
    Plug 'rhysd/vim-clang-format'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'

    " Plug 'ajh17/vimcompletesme'


    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-python'

    Plug 'tpope/vim-commentary'
    Plug 'liuchengxu/vista.vim'
    Plug 'jeetsukumaran/vim-pythonsense'
    Plug 'jiangmiao/auto-pairs'
    Plug 'dense-analysis/ale'

call plug#end()

au BufNewFile,BufRead *.py set foldmethod=indent
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4

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
set foldmethod=indent
set hlsearch


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


" Check Python files with flake8 and pylint.
let b:ale_linters = ['yapf', 'flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
"let b:ale_fixers = ['autopep8', 'yapf']

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace', 'yapf']
\}
let g:ale_fix_on_save = 1
set statusline^=%{coc#status()}

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
