-- mapleader
vim.g.mapleader = " "

-- cursor
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true

-- allow buffers to be hidden and not saved
vim.opt.hidden = true

-- do not display path of current file in terminal title
vim.opt.title = false

-- enable 24-bit RGB colors
vim.opt.termguicolors = true

-- global statusline
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.g.python3_host_prog = "~/.neovim/bin/python"
