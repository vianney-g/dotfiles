require("refactoring").setup({})
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap(
	"v",
	"<leader>xf",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>xF",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>xv",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>xV",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap(
	"n",
	"<leader>xb",
	[[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>xB",
	[[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap(
	"n",
	"<leader>xv",
	[[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
