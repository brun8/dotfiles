local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
       vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    --['<C-CR>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer'},
    { name = 'path'},
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

