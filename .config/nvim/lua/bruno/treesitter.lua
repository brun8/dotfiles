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

--local ft_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername
--ft_to_parser.astro = "tsx"

require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = ".",
      scope_incremental = "grc",
      node_decremental = ",",
    },
  },
}

