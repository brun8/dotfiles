" UBUNTU NVIM CONFIG

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
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

command! -nargs=0 Format :call CocAction('format')


" fzf
set rtp+=~/.fzf
nnoremap <silent> <C-p> :FZF -m<cr>
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }


" coc
" tab e shift tab navegam pelo autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" carriage return confirma o autocomplete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }


" NERDTree
" Bind CTRL N pra abrir o nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1


" emmet
let g:user_emmet_leader_key='<C-e>'


" linha nova entre chaves
inoremap {<CR> {<CR>}<ESC>O


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

" linha nova entre {[( e )]}
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko

" bind pra mudar de split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-W> <C-W><C-W>
nnoremap <leader>w <C-W><C-W>
