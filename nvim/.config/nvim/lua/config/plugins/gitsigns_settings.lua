-- Git symbols & mappings
require('gitsigns').setup {
	signs = {

		add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
		change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },

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

		['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
		['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

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
