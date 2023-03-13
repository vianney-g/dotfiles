return require("packer").startup({
	function()
		local p = function(name)
			return require(string.format("config.plugins.%s", name))
		end

		use({ "lewis6991/impatient.nvim" })
		use({ "wbthomason/packer.nvim" })
		-- use({ "ellisonleao/gruvbox.nvim" })
		-- use({ "wojciechkepka/vim-github-dark" })
		-- use({ "rose-pine/neovim" })
		use({ "rafamadriz/neon" })
		use({ "kyazdani42/nvim-web-devicons" })
		-- a zk note helper
		use({ "mickael-menu/zk-nvim" })
		-- formatters
		use({
			"mhartington/formatter.nvim",
			config = p("format"),
		})
		-- lsp stuff
		use({
			"williamboman/mason.nvim",
			{
				"neovim/nvim-lspconfig",
				config = p("lsp"),
			},
		})
		-- completer
		use({
			"ms-jpq/coq_nvim",
			{
				"ms-jpq/coq.artifacts",
				config = p("coq_settings"),
			},
		})
		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				config = p("treesitter_settings"),
			},
		})
		-- status line
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = p("lualine_settings"),
		})
		-- colorize hexa colors
		use({
			"norcalli/nvim-colorizer.lua",
			config = require("colorizer").setup(),
		})
		-- add surround operations
		use({
			"tpope/vim-surround",
		})
		-- file explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			config = require("nvim-tree").setup({}),
		})
		-- telescope stuff
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-live-grep-args.nvim" },
			},

			config = p("telescope_settings"),
		})
		use({
			"nvim-telescope/telescope-symbols.nvim",
		})
		-- git
		use({
			"tpope/vim-fugitive",
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = p("gitsigns_settings"),
		})
		-- quick comment
		use({
			"numToStr/Comment.nvim",
			config = require("Comment").setup({}),
		})
		-- quick pair
		use({
			"windwp/nvim-autopairs",
			config = require("nvim-autopairs").setup({}),
		})
		-- test suite
		use({
			"nvim-neotest/neotest",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"antoinemadec/FixCursorHold.nvim",
				"nvim-neotest/neotest-python",
			},
			config = p("tests_settings"),
		})
		-- markdown
		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
		})
		-- copilot
		use({ "github/copilot.vim" })
	end,
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua/config/plugins/packer_compiled.lua",
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
