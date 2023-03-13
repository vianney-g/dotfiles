require("nvim-treesitter.configs").setup({
	ensure_installed = { "help", "lua", "python", "rust" },
	sync_install = false,
	auto_install = false,
	textobjects = {
		enable = true,
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>o"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>O"] = "@parameter.inner",
			},
		},
	},
	highlight = { enable = true },
	-- indent = { enable = true },  # does not work well with python
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>D",
			node_incremental = "<leader>v",
			-- scope_incremental = "<leader>D",
			node_decremental = "<leader>d",
		},
	},
})
