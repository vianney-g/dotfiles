local M = {}
local util = require("formatter.util")

function M.yamlfmt()
	return {
		exe = "yamlfmt",
		args = { "-in" },
		stdin = true,
	}
end

function M.fixjson()
	-- I don't use default conf as I always want a 2 spaces indent
	return {
		exe = "fixjson",
		args = { "--stdin-filename", util.get_current_buffer_file_name(), "-i", "2" },
		stdin = true,
		try_node_modules = true,
	}
end

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
			M.fixjson,
		},
		yaml = {
			M.yamlfmt,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
	},
})

vim.keymap.set("n", "<Leader>f", "<Cmd>Format<CR>", { silent = true })

-- autoformat on save
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "FormatWriteLock",
	pattern = { "*.py", "*.lua", "*.sh", "*.ts", "*.json", "*.js", "*.yaml", "*.rs" },
})

return M
