" vim-plug
"if empty(glob('~/.vim/autoload/plug.vim'))
  "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

"plugins
"call plug#begin()

"Plug 'raimondi/delimitmate'
"Plug 'mattn/emmet-vim'
"Plug 'itchyny/lightline.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'preservim/nerdcommenter'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'sainnhe/gruvbox-material'
"call plug#end()

"colorscheme gruvbox-material


set number
set rnu
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set backspace=2
set background=dark
syntax on
set nohlsearch
set ignorecase
set smartcase
set incsearch
set splitright
set splitbelow
set noerrorbells
set scrolloff=8

let mapleader = " "
inoremap <C-c> <esc>
nnoremap <leader>nn :Explore<CR>

autocmd filetype cpp nnoremap <leader>cpp :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').''<CR>

