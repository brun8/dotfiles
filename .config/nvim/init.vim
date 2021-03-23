if empty(glob('~/.local/share/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" plugins
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" telescope
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
Plug 'itchyny/lightline.vim'


Plug 'ThePrimeagen/harpoon'

" colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/edge'
Plug 'ayu-theme/ayu-vim'

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


set noerrorbells

" colors
set termguicolors
"set t_Co=256


set background=dark

" GRUVBOX
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

" Edge
"colorscheme edge

" ayu
"let ayucolor='dark'
"let ayucolor='light'
let ayucolor='mirage'
colorscheme ayu


lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }


" ***** END OPTIONS *****

" LSP
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect

lua local on_attach = require'completion'.on_attach
lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.solargraph.setup{on_attach=require'completion'.on_attach}
"lua require'lspconfig'.tsserver.setup{ on_attach=on_attach }
"lua require'lspconfig'.solargraph.setup{ on_attach=on_attach }
"lua require'lspconfig'.pyright.setup{ on_attach=on_attach }


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
nnoremap <C-i> :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-x> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <C-g> :lua require("harpoon.mark").rm_file()<CR>
nnoremap <leader>r :lua require("harpoon.mark").promote()<CR>
nnoremap <leader><C-d> :lua require("harpoon.mark").clear_all()<CR>

nnoremap <leader>dd :lua vim.lsp.buf.definition()<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'edge',
      \ }



" undotree
nnoremap <leader>u :UndotreeToggle<CR>

" netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'
nnoremap <leader>nn :Explore<CR>
nnoremap <leader>bd :bd<CR>

" nerdtree
nmap <silent> <C-n> :NERDTreeToggle<CR>
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

nnoremap <CR> :lua print("let's go pens")<CR>

