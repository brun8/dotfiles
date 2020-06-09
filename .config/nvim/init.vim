" vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"plugins
call plug#begin()

Plug 'raimondi/delimitmate'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ddollar/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" tab e shift tab navegam pelo autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" carriage return confirma o autocomplete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" prettier (java formatter)
autocmd BufWritePre *.js Neoformat


" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }


" NERDTree
" Bind CTRL N pra abrir o nerdtree
map <C-n> :NERDTreeToggle<CR>

" muda o dir atual para o dir do arquivo aberto
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif


"tamanho da identaçao
"identaçao do tamanho do TAB
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

"colore o editor
set background=dark
syntax on

"comportamento usual do backspace
set backspace=2

"numerador de linhas
set number
set rnu

"split pra direita
set splitright


set ttimeoutlen=100

" mapeando jj pra fazer a função do esc
inoremap jj <esc>

" bind pra mudar de split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-W> <C-W><C-W>
nnoremap <leader>w <C-W><C-W>
