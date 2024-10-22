-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = true


-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Preview substitute in preview window
vim.o.inccommand = 'split'

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- set conceallevel=1 to allow some characters to be replaced with conceal
-- Useful for markdown, but might slow down some files
vim.o.conceallevel = 1

-- Display tabs, trailing spaces and unbreaable spaces
vim.o.list = true

-- Change `list` characters
vim.o.listchars = 'tab:» ,trail:·,nbsp:,precedes:<,extends:>'

-- Hide command line if inactive
vim.o.cmdheight = 0

-- single status line
vim.o.laststatus = 3
