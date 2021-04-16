if empty(glob('~/.local/share/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" plugins
call plug#begin()
"lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" harpoon
Plug 'ThePrimeagen/harpoon'
" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" others
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
" colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/edge'
Plug 'ayu-theme/ayu-vim'
Plug 'ghifarit53/tokyonight-vim'
" productivity tools
Plug 'alec-gibson/nvim-tetris'
call plug#end()
" ***** OPTIONS *****

" text
set nowrap
set ignorecase
set smartcase
set scrolloff=8
set guicursor=
set noerrorbells

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
"colorscheme gruvbox
"colorscheme edge
"let ayucolor='mirage'
"colorscheme ayu
let g:tokyonight_style = 'night'
colorscheme tokyonight


lua require('bruno')


lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }


" ***** END OPTIONS *****

" LSP
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect

let mapleader = " "

" splits
nnoremap <A-l> :wincmd l<CR>
nnoremap <A-k> :wincmd k<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <A-h> :wincmd h<CR>
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>ss :split<CR>
" telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep for > ')})<CR>
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" harpoon
nnoremap <leader>m :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-x> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>rr :lua require("harpoon.mark").rm_file()<CR>
nnoremap <leader><C-d> :lua require("harpoon.mark").clear_all()<CR>
nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
" lsp
nnoremap <leader>dd :lua vim.lsp.buf.definition()<CR>
" goyo
nnoremap <leader>go :Goyo<CR>


" lightline
let g:lightline = { 'colorscheme': 'edge' }

" undotree
nnoremap <leader>u :UndotreeToggle<CR>

" netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'
nnoremap <leader>nn :Explore<CR>
nnoremap <leader>bd :bd<CR>

" markdown previewer
let g:mkdp_browser = 'brave-browser'
nnoremap <leader>md :MarkdownPreviewToggle<CR>

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
augroup WhiteSpace
  autocmd!
  autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

augroup WrapInMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
augroup END

nnoremap <CR> :echo "let's go pens"<CR>

