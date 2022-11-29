require("nvim-treesitter.configs").setup({
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
	indent = { enable = true },
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
