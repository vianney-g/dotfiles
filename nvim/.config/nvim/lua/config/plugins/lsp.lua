require("mason").setup({})
local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gD", "<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ra", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<leader>er", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>es", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	-- buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

lspconfig.pyright.setup({
	cmd = { "pyright-langserver", "--stdio" },
	on_attach = on_attach,
})

lspconfig.ruff_lsp.setup({
	on_attach = on_attach,
})

require("zk").setup({
	picker = "telescope",
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
})

lspconfig.phpactor.setup({
	on_attach = on_attach,
})

lspconfig.html.setup({
	on_attach = on_attach,
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
})

lspconfig.sqlls.setup({
	on_attach = on_attach,
})

lspconfig.elmls.setup({
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("elm.json"),
})

lspconfig.cucumber_language_server.setup({
	on_attach = on_attach,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {

			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

lspconfig.arduino_language_server.setup({
	cmd = {
		"arduino-language-server",
		"-cli-config",
		"~/.arduino15/~/.arduino15/arduino-cli.yaml",
		"-fqbn",
		"arduine:avr:uno",
		"-cli",
		"arduino-cli",
		"-clangd",
		"clangd",
	},
	on_attach = on_attach,
})
