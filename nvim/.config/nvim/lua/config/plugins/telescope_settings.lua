require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("frecency")
vim.keymap.set("n", "<Leader>tt", "<Cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tT", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", { silent = true })
vim.keymap.set(
	"n",
	"<Leader>tg",
	"<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ silent = true }
)
-- vim.keymap.set("n", "<Leader>tg", "<Cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tG", "<Cmd>Telescope grep_string<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tb", "<Cmd>Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tr", "<Cmd>Telescope registers<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tm", "<Cmd>Telescope marks<CR>", { silent = true })
vim.keymap.set("n", "<Leader>td", "<Cmd>Telescope diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tu", "<Cmd>Telescope lsp_references<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tp", "<Cmd>Telescope planets<CR>", { silent = true })
vim.keymap.set("n", "<Leader>to", "<Cmd>Telescope vim_options<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tk", "<Cmd>Telescope keymaps<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tS", "<Cmd>Telescope treesitter<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ts", "<Cmd>Telescope symbols<CR>", { silent = true })


-- grep in current buffer
vim.keymap.set("n", "<Leader>tq", "<Cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>", { silent = true })
