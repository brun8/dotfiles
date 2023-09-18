local map = vim.keymap.set

local function set_keymaps()
  local opt = { noremap = true, silent = true }

  map('i', '<C-c>', '<esc>', opt)

  map('t', '<esc>', '<c-\\><c-n>', opt)

  -- copy paste
  -- void
  map('x', '<leader>v', '"_dP', opt)

  -- system
  map('n', '<leader>y', '"+y', opt)
  map('n', '<leader>p', '"+p', opt)
  map('v', '<leader>y', '"+y', opt)
  map('v', '<leader>p', '"+p', opt)
  map('v', '<leader>P', '"+P', opt)

  -- netrw
  map('n', '<leader>nn', '<cmd>:Ex<cr>', opt)
  -- map('n', '<leader>nn', function ()
  --   require('oil').open()
  -- end, opt)

  -- vim surround
  -- muda ' para "
  map("n", "<leader>\"\"", "f'cs'\"", {noremap = false, silent = true, expr = false})
  -- muda " para '
  map("n", "<leader>\''", "f\"cs\"'", {noremap = false, silent = true, expr = false})

  -- worktree
  map('n', '<leader>wc', '<CMD>lua require("git-worktree").create_worktree(vim.fn.input("Worktree name > "), vim.fn.input("Worktree upstream > "))<CR>', opt)
  map('n', '<leader>ws', '<CMD>lua require("git-worktree").switch_worktree(vim.fn.input("Worktree name > "))<CR>', opt)
  map('n', '<leader>wd', '<CMD>lua require("git-worktree").delete_worktree(vim.fn.input("Worktree name > "))<CR>', opt)
  map('n', '<leader>wt', '<CMD>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', opt)


  -- goyo
  map('n', '<leader>go', "<CMD>:Goyo<CR>", opt)

  -- markdown-previwer
  map('n', '<leader>md', "<CMD>:MarkdownPreviewToggle<CR>", opt)
end

set_keymaps()

