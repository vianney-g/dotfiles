require("formatter").setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").black,
			require("formatter.filetypes.python").isort,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		json = {
			require("formatter.filetypes.json").fixjson,
		},
	},
})

vim.keymap.set("n", "<Leader>f", "<Cmd>Format<CR>", { silent = true })

-- autoformat on save
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "FormatWriteLock",
	pattern = { "*.py", "*.lua", "*.sh", "*.ts", "*.json", "*.js", "*.ino" },
})
