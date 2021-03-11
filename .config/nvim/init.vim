" vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin()

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'mattn/emmet-vim'
Plug 'styled-components/vim-styled-components'



Plug 'ThePrimeagen/harpoon'

" colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }


call plug#end()
" ***** OPTIONS *****

" text
set nowrap
set ignorecase
set smartcase
set scrolloff=8
set guicursor=

" tabs
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" numbers
set nu
set relativenumber

" search
set nohlsearch
set incsearch

" buffers
set hidden
set noswapfile
set signcolumn=yes
set colorcolumn=80

" colors
set termguicolors
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox



set noerrorbells


" ***** END OPTIONS *****

" bindings

let mapleader = " "

inoremap <C-c> <esc>

" clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep for > ')})<CR>
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" harpoon
nmap <leader>tu :call GotoBuffer(0)<CR>
nmap <leader>te :call GotoBuffer(1)<CR>
nmap <leader>to :call GotoBuffer(2)<CR>
nmap <leader>ta :call GotoBuffer(3)<CR>

" undotree
nnoremap <leader>u :UndotreeToggle<CR>

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
nmap <silent> <C-m> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['^node_modules$']

fun! TrimWhiteSpace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
endfun

" erases all trailing white spaces from all file types
augroup bruno
  autocmd!
  autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

