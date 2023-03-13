require("telescope").load_extension("live_grep_args")

-- grep
vim.keymap.set("n", "<Leader>tG", "<Cmd>Telescope grep_string<CR>", { silent = true })
vim.keymap.set(
	"n",
	"<Leader>tg",
	"<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ silent = true }
)
vim.keymap.set("n", "<Leader>tq", "<Cmd>Telescope quickfix theme=ivy<CR>", { silent = true })

-- find files
vim.keymap.set("n", "<Leader>S", "<Cmd>Telescope oldfiles<CR>", { silent = true })
vim.keymap.set("n", "<Leader>s", "<Cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gf", "<Cmd>Telescope git_status<CR>", { silent = true })

-- vim stuff
vim.keymap.set("n", "<Leader>b", "<Cmd>Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tm", "<Cmd>Telescope marks<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tr", "<Cmd>Telescope registers theme=ivy<CR>", { silent = true })
vim.keymap.set("n", "<Leader>to", "<Cmd>Telescope vim_options theme=ivy<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tk", "<Cmd>Telescope keymaps theme=ivy<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ts", "<Cmd>Telescope symbols theme=cursor<CR>", { silent = true })

-- diagnostics
vim.keymap.set("n", "<Leader>td", "<Cmd>Telescope diagnostics theme=ivy<CR>", { silent = true })

-- find symbols
vim.keymap.set("n", "<Leader>tS", "<Cmd>Telescope treesitter<CR>", { silent = true })
vim.keymap.set("n", "<Leader>u", "<Cmd>Telescope lsp_references theme=ivy<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tfs", "<Cmd>Telescope lsp_document_symbols<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tfc", "<Cmd>Telescope lsp_dynamic_workspace_symbols symbols=class<CR>", { silent = true })
vim.keymap.set(
	"n",
	"<Leader>tff",
	"<Cmd>Telescope lsp_dynamic_workspace_symbols symbols=method,function<CR>",
	{ silent = true }
)
