-- commands 
-- teste colorscheme
vim.cmd([[
  augroup colorscheme_opts
  au!
  au ColorScheme * hi! Normal guibg=None
  au ColorScheme * hi! SignColumn guibg=None
  au ColorScheme * hi! CursorColumn guibg=#404040
  au ColorScheme * hi! CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=White
  augroup end
  colo onedark
]])

vim.cmd([[
  augroup WrapInMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
  augroup END
]])

local g = vim.g
local o = vim.o

g.mapleader = ' '

local options = {
  completeopt = "menuone,noselect,noinsert",
  backup = false,
  errorbells = false,
  hidden = true,

  -- search
  hlsearch = false,
  incsearch = true,
  hidden = true,
  smartcase = true,
  ignorecase = true,

  scrolloff = 5,
  sidescrolloff = 5,

  guicursor = '',
  cursorline = true,
  nu = true,
  relativenumber = true,
  termguicolors = true,
  cursorline = true,
  --cursorcolumn = true,
  cc = '80',

  autoindent = true,
  smartindent = true,

  -- tabs
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,


  splitright = true,
  splitbelow = true,
}

for k, v in pairs(options) do
  o[k] = v
end

require'bruno'
