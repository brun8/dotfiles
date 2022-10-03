require 'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  ensure_installed = {
    'astro',
    'javascript',
    'json',
    'tsx',
    'typescript',
    'lua',
    'python',
    'go',
    'ruby',
    'cpp'
  },
}

local ft_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername
ft_to_parser.astro = "tsx"

