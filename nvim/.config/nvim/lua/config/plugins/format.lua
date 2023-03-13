local M = {}
function M.yamlfmt()
	return {
		exe = "yamlfmt",
		args = { "-in" },
		stdin = true,
	}
end

function M.elmfmt()
	return {
		exe = "elm-format",
		args = { "--yes", "--stdin" },
		stdin = true,
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
			require("formatter.filetypes.json").fixjson,
		},
		yaml = {
			M.yamlfmt,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		elm = {
			M.elmfmt,
		},
	},
})

vim.keymap.set("n", "<Leader>f", "<Cmd>Format<CR>", { silent = true })

-- autoformat on save
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "FormatWriteLock",
	pattern = { "*.py", "*.lua", "*.sh", "*.ts", "*.json", "*.js", "*.yaml", "*.rs", "*.elm" },
})

return M
