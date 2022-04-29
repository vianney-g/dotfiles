call plug#begin('~/.local/share/nvim/plugged')
" LSP features
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer', {'branch': 'main'}
Plug 'tami5/lspsaga.nvim', { 'branch': 'main' }
" send errors to quickfix and local list
Plug 'folke/trouble.nvim', { 'branch': 'main' }

" autocompletion
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Treesitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" look & feel
Plug 'hoob3rt/lualine.nvim'
"    theme
Plug 'morhetz/gruvbox'
"Plug 'rktjmp/lush.nvim', {'branch': 'main'}
"Plug 'rafamadriz/neon', {'branch': 'main'}
" Plug 'arcticicestudio/nord-vim', {'branch': 'master'}

"     background for hexa colors
Plug 'norcalli/nvim-colorizer.lua'

"    tab line
Plug 'kyazdani42/nvim-web-devicons'
Plug 'alvarosevilla95/luatab.nvim'

"    surround
Plug 'tpope/vim-surround'

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" Git stuf
Plug 'sindrets/diffview.nvim', {'branch': 'main'}
Plug 'nvim-lua/plenary.nvim', {'branch': 'master'}
Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}
Plug 'tpope/vim-fugitive'

" Telescope stuff!
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'xiyaowong/telescope-emoji.nvim'

" editing
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
" Plug 'b3nj5m1n/kommentary', {'branch': 'main' }
Plug 'phaazon/hop.nvim'
Plug 'numToStr/Comment.nvim'

" tests suite
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

" debugger
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'

" auto pair
Plug 'windwp/nvim-autopairs'

" tmux commands
Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'

" zk (notes taker)
Plug 'mickael-menu/zk-nvim'

call plug#end()

let g:coq_settings = { 'auto_start': 'shut-up' }

lua << EOF
local nvim_lsp = require('lspconfig')

-- improve UI
require('lspsaga').init_lsp_saga {
	error_sign = '',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	border_style = "round",
	}

require('coq')
require("telescope").load_extension("emoji")
require('colorizer').setup()
require('Comment').setup()
require('nvim-tree').setup {}
require('nvim-autopairs').setup{}
require('trouble').setup{}
require('zk').setup{
	picker = "telescope"
}

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>:NvimTreeToggle<CR>', opts)

-- active lsp servers

local lsp_installer = require'nvim-lsp-installer'

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

require'nvim-web-devicons'.setup {
	-- your personnal icons can go here (to override)
	-- DevIcon will be appended to `name`
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			name = "Zsh"
			}
		};
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true;
	}

-- Git diff
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
	diff_binaries = false,    -- Show diffs for binaries
	use_icons = true,         -- Requires nvim-web-devicons
	enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
	signs = {
		fold_closed = "",
		fold_open = "",
		},
	file_panel = {
		position = "left",      -- One of 'left', 'right', 'top', 'bottom'
		width = 35,             -- Only applies when position is 'left' or 'right'
		height = 10,            -- Only applies when position is 'top' or 'bottom'
		},
	file_history_panel = {
		position = "bottom",
		width = 35,
		height = 16,
		log_options = {
			max_count = 256,      -- Limit the number of commits
			follow = false,       -- Follow renames (only for single file)
			all = false,          -- Include all refs under 'refs/' including HEAD
			merges = false,       -- List only merge commits
			no_merges = false,    -- List no merge commits
			reverse = false,      -- List commits in reverse order
			},
		},
	key_bindings = {
         disable_defaults = false,                   -- Disable the default key bindings
         -- The `view` bindings are active in the diff buffers, only when the current
         -- tabpage is a Diffview.
         view = {
         	["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file 
         	["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
         	["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
         	["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
         	},
         file_panel = {
         	["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
         	["<down>"]        = cb("next_entry"),
         	["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
         	["<up>"]          = cb("prev_entry"),
         	["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
         	["o"]             = cb("select_entry"),
         	["<2-LeftMouse>"] = cb("select_entry"),
         	["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
         	["S"]             = cb("stage_all"),          -- Stage all entries.
         	["U"]             = cb("unstage_all"),        -- Unstage all entries.
         	["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
         	["<tab>"]         = cb("select_next_entry"),
         	["<s-tab>"]       = cb("select_prev_entry"),
         	["<leader>e"]     = cb("focus_files"),
         	["<leader>b"]     = cb("toggle_files"),
         	},
         file_history_panel = {
         	["g!"]            = cb("options"),            -- Open the option panel
         	["<C-d>"]         = cb("open_in_diffview"),   -- Open the entry under the cursor in a diffview
         	["zR"]            = cb("open_all_folds"),
         	["zM"]            = cb("close_all_folds"),
         	["j"]             = cb("next_entry"),
         	["<down>"]        = cb("next_entry"),
         	["k"]             = cb("prev_entry"),
         	["<up>"]          = cb("prev_entry"),
         	["<cr>"]          = cb("select_entry"),
         	["o"]             = cb("select_entry"),
         	["<2-LeftMouse>"] = cb("select_entry"),
         	["<tab>"]         = cb("select_next_entry"),
         	["<s-tab>"]       = cb("select_prev_entry"),
         	["gf"]            = cb("goto_file"),
         	["<C-w><C-f>"]    = cb("goto_file_split"),
         	["<C-w>gf"]       = cb("goto_file_tab"),
         	["<leader>e"]     = cb("focus_files"),
         	["<leader>b"]     = cb("toggle_files"),
         	},
         option_panel = {
         	["<tab>"] = cb("select"),
         	["q"]     = cb("close"),
         	},
}
}

-- Git symbols & mappings
require('gitsigns').setup {
	signs = {

		add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
		change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},

		-- add          = {hl = 'GitSignsAdd'   , text = '✚', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
		-- change       = {hl = 'GitSignsChange', text = '⚒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		-- delete       = {hl = 'GitSignsDelete', text = '✖', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		-- topdelete    = {hl = 'GitSignsDelete', text = '✗', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		-- changedelete = {hl = 'GitSignsChange', text = '✘', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		},
	signcolumn = true,
	numhl = false,
	linehl = false,
	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,

		['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
		['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

		['n <leader>ga'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		['v <leader>ga'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		['n <leader>gA'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		['v <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		['n <leader>gB'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

		-- Text objects
		['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
		['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
		},
	watch_gitdir = {
		interval = 1000,
		follow_files = true
		},
	preview_config = {
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
		},
	yadm = {
	enabled = false
	},
current_line_blame = false,
current_line_blame_opts = {
	delay = 1000,
	virt_text_pos = 'eol'
	},
sign_priority = 6,
update_debounce = 100,
status_formatter = nil, -- Use default
word_diff = false
}

-- BOTTOM LINE
local status, lualine = pcall(require, "lualine")
if (not status) then return end

	lualine.setup {
		options = {
			icons_enabled = true,
			theme = 'nord',
			section_separators = {'', ''},
			component_separators = {'', ''},
			disabled_filetypes = {}
			},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch'},
			lualine_c = {'filename'},
			lualine_x = {
				{ 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
				'encoding',
				'filetype'
				},
			lualine_y = {'progress'},
			lualine_z = {'location'}
			},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
			lualine_x = {'location'},
			lualine_y = {},
			lualine_z = {}
			},
		tabline = {},
		extensions = {'fugitive'}
		}

	-- TABLINE
	Tabline = require'luatab'.tabline
	vim.cmd[[ set tabline=%!luaeval('Tabline()') ]]

	-- Hop (easy motion)
	require'hop'.setup()
	vim.api.nvim_set_keymap('n', '<leader><leader>w', "<cmd>lua require'hop'.hint_words()<cr>", {})
	vim.api.nvim_set_keymap('n', '<leader><leader>l', "<cmd>lua require'hop'.hint_lines()<cr>", {})
	vim.api.nvim_set_keymap('n', '<leader><leader>p', "<cmd>lua require'hop'.hint_patterns()<cr>", {})
	vim.api.nvim_set_keymap('v', '<leader><leader>w', "<cmd>lua require'hop'.hint_words()<cr>", {})
	vim.api.nvim_set_keymap('v', '<leader><leader>l', "<cmd>lua require'hop'.hint_lines()<cr>", {})
	vim.api.nvim_set_keymap('v', '<leader><leader>p', "<cmd>lua require'hop'.hint_patterns()<cr>", {})

	-- Treesitter objects
	require'nvim-treesitter.configs'.setup {
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
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			}
		},
}

EOF

" TEST SUITE CONF
" Make pytest the default tests framework
let test#python#runner = 'pytest'
let g:test#python#pytest#file_pattern = '\v(test[s]?_[^/]+|[^/]+_test[s]?)\.py$'
"let test#python#pytest#executable = 'python -m pytest --no-cov -x'
let test#python#pytest#executable = 'python -m pytest'
let test#python#pytest#options = '--color=yes -vvv'

let g:ultest_attach_width = 180
let g:ultest_virtual_text = 0
let g:ultest_output_cols = 120
let g:ultest_max_threads = 4
let g:ultest_use_pty = 1

nmap <leader>tn :UltestNearest<CR>
nmap <leader>tf :Ultest<CR>
nmap <leader>tc :UltestClear<CR>
nmap <leader>ts :UltestSummary<CR>
nmap <leader>to :UltestOutput<CR>

