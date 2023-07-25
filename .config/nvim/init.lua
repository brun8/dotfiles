require 'bruno.plugins'.setup()

require 'impatient'

local colorscheme = "kbones"
local colorscheme_configs = {
  kanagawa = function()
    local kanagawa = require 'kanagawa'
    if kanagawa then
      vim.o.background = "dark"
      vim.api.nvim_command('colo kanagawa')
    end
  end,
  zenbones = function()
    local zenbones = require 'zenbones'
    if zenbones then
      vim.o.background = "light"
      vim.api.nvim_command('colo zenbones')
    end
  end,
  darkbones = function()
    local zenbones = require 'zenbones'
    if zenbones then
      vim.o.background = "dark"
      vim.api.nvim_command('colo zenbones')
    end
  end,
  kbones = function()
    local zenbones = require 'zenbones'
    if zenbones then
      vim.o.background = "dark"
      vim.api.nvim_command('colo kanagawabones')
    end
  end,
}

colorscheme_configs[colorscheme]()


vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- seta o compilador g++ pra arquivos c++
-- :make compila o arquivo e gera o excecutavel com o mesmo nome
--vim.api.nvim_create_autocmd({'BufEnter'}, {
--pattern = "*.cpp",
--callback = function ()
--vim.api.nvim_command("set makeprg=g++\\ %\\ -o\\ %<")
----vim.api.nvim_command("set makeprg=pctest\\ %")
--vim.api.nvim_set_keymap('n', '<leader>cpp', '<cmd>make<cr>', {silent=true})
--end
--})

--commands
vim.cmd([[
  augroup WrapInMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
  augroup END
]])


--vim.cmd([[
--fun! TrimWhiteSpace()
--let l:save = winsaveview()
--keeppatterns %s/\s\+$//e
--endfun
--augroup WhiteSpace
--autocmd!
--autocmd BufWritePre * :call TrimWhiteSpace()
--augroup END
--]])



local g = vim.g
local o = vim.o

g.mapleader = ' '

local options = {
  filetype = 'on',
  backup = false,
  errorbells = false,
  hidden = false,

  -- search
  hlsearch = false,
  incsearch = true,
  smartcase = true,
  ignorecase = true,

  scrolloff = 5,
  sidescrolloff = 5,

  --guicursor = '',
  --list = true,
  cursorline = true,
  nu = true,
  relativenumber = true,
  termguicolors = true,
  --cursorcolumn = true,
  cc = '80',
  signcolumn = 'yes',
  wrap = false,

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

--vim.api.nvim_command [[set lcs=eol:~,space:.]]

vim.o.shortmess = vim.o.shortmess .. 'c'

require 'bruno'
