" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"plugins
call plug#begin()

Plug 'raimondi/delimitmate'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'



call plug#end()


" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }


" NERDTree
" Bind CTRL N pra abrir o nerdtree
map <C-n> :NERDTreeToggle<CR>

"tamanho da identaçao
"identaçao do tamanho do TAB
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

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

inoremap <C-c> <esc>

" bind pra mudar de split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-W> <C-W><C-W>
nnoremap <leader>w <C-W><C-W>
nnoremap <leader>t gt
nmap <C-P> :FZF<CR> 
