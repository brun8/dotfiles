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
local t = ls.text_node
local fmt = require'luasnip.extras.fmt'.fmt
local rep = require('luasnip.extras').rep

-- competitive programming
local cp_template = {

}

ls.snippets = {
  all = {
    s("pens", fmt("let's go pens", {})),
  },
  cpp = {
    s(
      "fori",
      fmt("for (int {}=0; {}<{};{}++) {{\n \n}};", {i(1, "i"), rep(1), i(2, "n"), rep(1)})
    ),
    s(
      "cout",
      fmt("cout << {} << \"\\n\";", {i(0)})
    )
  },
  go = {
    s(
      "func",
      fmt("func {}({}) {} {{\n\t{}\n}}", { i(1, "name"), i(2), i(3), i(0) })
    )
  },
  lua = {
    s(
      "req",
      fmt("local {} = require('{}')", {i(1), rep(1)})
    ),
  },
  typescriptreact = {
    s(
      "state",
      fmt(
        "const [{}, {}] = useState({});",
        {i(1), i(2), i(3)}
      )
    )
  }
}

