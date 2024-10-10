local autocmd = vim.api.nvim_create_autocmd

local random_group = vim.api.nvim_create_augroup('Random', { clear = true })

autocmd('VimResized', {
  desc = 'Keep windows equal size',
  group = random_group,
  command = "tabdo wincmd =",
})

autocmd('TermOpen', {
  desc = 'Set terminal options',
  group = random_group,
  command = [[
    setlocal nonumber norelativenumber signcolumn=no
    setlocal nospell
  ]],
})


-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  desc = 'Consider Jinja as htmldjango',
  callback = function()
    vim.bo.filetype = 'htmldjango'
  end,
  group = highlight_group,
  pattern = { '*.jinja', '*.jinja2' },
})
