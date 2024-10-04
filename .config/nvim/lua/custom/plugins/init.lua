-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'mattn/emmet-vim',
    init = function()
      vim.g['user_emmet_leader_key'] = '<C-e>'
    end,
    ft = { 'typescriptreact' },
  },
  {
    'f-person/git-blame.nvim',
    -- load the plugin at startup
    event = 'VeryLazy',
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin wil only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      enabled = true,
      message_template = ' <author> • <summary> • <date> • <<sha>>', -- template for the blame message, check the Message template section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
    config = function()
      vim.keymap.set('n', '<leader>gb', '<cmd>GitBlameToggle<cr>', { desc = '[S]earch [H]elp' })
    end,
  },
}
