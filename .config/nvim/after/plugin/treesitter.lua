require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'help',
    'python',
    'go',
    'lua',
    'typescript',
    'tsx',
    'javascript',
    'json',
  },
  sync_install = false,

  highlight = { 
    enable = true,
    additional_vim_regex_highlighting = false,
  },


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

