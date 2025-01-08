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

-- Format on save
-- Use the language servers to automatically format code on save.
-- Adds additional commands as well to manage the behavior

-- Switch for controlling whether you want autoformatting.
--  Use :FormatOnSaveToggle to toggle autoformatting on or off
--
local format_is_enabled = true
vim.api.nvim_create_user_command('FormatOnSaveToggle', function()
  format_is_enabled = not format_is_enabled
  print('Setting autoformatting to: ' .. tostring(format_is_enabled))
end, {})

vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format()
end, {})

-- Create an augroup that is used for managing our formatting autocmds.
--      We need one augroup per client to make sure that multiple clients
--      can attach to the same buffer without interfering with each other.
local _augroups = {}
local get_augroup = function(client)
  if not _augroups[client.id] then
    local group_name = 'kickstart-lsp-format-' .. client.name
    local id = vim.api.nvim_create_augroup(group_name, { clear = true })
    _augroups[client.id] = id
  end

  return _augroups[client.id]
end
autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
  -- This is where we attach the autoformatting for reasonable clients
  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    local bufnr = args.buf

    -- Only attach to clients that support document formatting
    if not client.server_capabilities.documentFormattingProvider then
      return
    end

    -- Tsserver usually works poorly. Sorry you work with bad languages
    -- You can remove this line if you know what you're doing :)
    if client.name == 'tsserver' then
      return
    end

    -- Create an autocmd that will run *before* we save the buffer.
    --  Run the formatting command for the LSP that has just attached.
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = get_augroup(client),
      buffer = bufnr,
      callback = function()
        if not format_is_enabled then
          return
        end

        vim.lsp.buf.format {
          async = false,
          filter = function(c)
            return c.id == client.id
          end,
        }
      end,
    })
  end,
})
