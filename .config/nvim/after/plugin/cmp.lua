local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `luasnip` user.
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-CR>'] = cmp.mapping.close(),
    --['<C-CR>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp'},
    { name = 'path'},
    { name = 'buffer'},
    { name = 'nvim_lua' },

    -- For vsnip user.
    --{ name = 'vsnip' },
  },
  experimental = {
    ghost_text = true,
  }
})


-- Setup lspconfig.
local servers = require'bruno.servers'

for _, s in ipairs(servers) do
  require('lspconfig')[s].setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
end

