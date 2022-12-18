require'harpoon'.setup {
  global_settings = {
    enter_on_sendcmd = true,
  }
}

local opt = {
  silent = true,
  noremap = true
}
vim.keymap.set('n', '<leader>mm', "<cmd>lua require'harpoon.mark'.add_file()<cr>", opt)
vim.keymap.set('n', '<C-x>', function() require'harpoon.ui'.toggle_quick_menu() end)
vim.keymap.set('n', '<C-h>', function() require'harpoon.ui'.nav_file(1) end)
vim.keymap.set('n', '<C-j>', function() require'harpoon.ui'.nav_file(2) end)
vim.keymap.set('n', '<C-k>', function() require'harpoon.ui'.nav_file(3) end)
vim.keymap.set('n', '<C-l>', function() require'harpoon.ui'.nav_file(4) end)
vim.keymap.set('n', '<leader>rr', function() require'harpoon.mark'.rm_file() end)
vim.keymap.set('n', '<leader><C-r>', function() require'harpoon.mark'.clear_all() end)
-- terminal
vim.keymap.set('n', '<leader>tu', ":lua require'harpoon.term'.gotoTerminal(1)<cr>i", opt)



