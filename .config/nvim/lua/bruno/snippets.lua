--if vim.g.snippets ~= "luasnip" then
  --return
--end
local ls = require'luasnip'
local types = require'luasnip.util.types'

ls.config.set_config({
	history = true,

	updateevents = "TextChanged,TextChangedI",

	delete_check_events = "TextChanged",

	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},

	enable_autosnippets = true,
})

vim.keymap.set({"i", "s"}, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true})

vim.keymap.set({"i", "s"}, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true})

vim.keymap.set({"i", "s"}, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true})

vim.keymap.set(
  "n",
  "<leader><leader>s",
  "<cmd>source ~/.config/nvim/lua/bruno/snippets.lua<cr>"
)

local s = ls.s
local i = ls.insert_node
local fmt = require'luasnip.extras.fmt'.fmt
local rep = require('luasnip.extras').rep

ls.snippets = {
  all = {
    s("pens", fmt("let's go pens", {}))
  },

  lua = {
    s(
      "req",
      fmt("local {} = require('{}')", {i(1), rep(1)})
    ),
  },
}

