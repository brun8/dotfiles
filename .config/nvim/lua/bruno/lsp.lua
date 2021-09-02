local function setup_lsp()
  local nvim_lsp = require'lspconfig'

  local function default_on_attach(client)
    --print('Attaching to ' .. client.name)

    --map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
    --map('n', '<leader>de', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opt)
    --map('n', '<leader>dd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
    --map('n', '<leader>dc', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opt)
    --map('n', '<leader>di', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    --map('n', '<leader>dh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opt)
    --map('n', '<leader>dr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opt)
    --map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
    --map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
  end

  local default_config = {
    on_attach = default_on_attach
  }

  local servers = { "gopls", "solargraph", "tsserver", "pyright" }
  for _, server in ipairs(servers) do
    nvim_lsp[server].setup {}
  end
end

setup_lsp()
