-- auto generate notes files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*note-*.md",
	command = "!/home/vianney/bin/buildNote %:p",
})
