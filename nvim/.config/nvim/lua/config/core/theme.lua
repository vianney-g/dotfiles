vim.opt.background = "dark" -- or "light" for light mode
vim.g.neon_style = "dark"
vim.g.neon_italic_comment = true
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = false
vim.g.neon_italic_variable = false
vim.g.neon_italic_boolean = true
vim.g.neon_bold = true
vim.g.neon_transparent = true

vim.cmd([[colorscheme neon]])
vim.cmd([[hi Normal guibg=NONE]])
