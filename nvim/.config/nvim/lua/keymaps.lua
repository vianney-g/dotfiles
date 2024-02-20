-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '\\', "<cmd>nohl<cr>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quick buffer nav
vim.keymap.set('n', '<leader>n', "<cmd>bn<cr>", { desc = "[N]ext buffer", silent = true })
vim.keymap.set('n', '<leader>a', "<cmd>bp<cr>", { desc = "Previous buffer", silent = true })

-- Win navigation
vim.keymap.set('n', '<leader>v', '<C-W>v<C-W>l', { desc = "[V]ertical split" })
vim.keymap.set('n', '<leader>^', '<C-W>s<C-W>j', { desc = "Horizontal split" })
vim.keymap.set('n', '<leader>d', '<C-W>w', { desc = "Next win" })
vim.keymap.set('n', '<leader>p', '<C-W>W', { desc = "Previous win" })
vim.keymap.set('n', '<leader>x', '<C-W>c', { desc = "Close window" })


-- Diagnostic keymaps
vim.keymap.set('n', '<leader>eR', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>er', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- open oil file explorer
vim.keymap.set("n", "-", "<cmd>Oil --float<cr>", { desc = "Open parent directory" })

-- telescope bindings
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').oldfiles, { desc = '[ ] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = 'Find existing [B]uffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>Gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>s', require('telescope.builtin').find_files, { desc = '[S]earch Files' })
vim.keymap.set('n', '<leader>th', require('telescope.builtin').help_tags, { desc = 'Search [H]elp' })
vim.keymap.set('n', '<leader>tG', require('telescope.builtin').grep_string, { desc = 'Search current [W]ord' })
vim.keymap.set('n', '<leader>tg', require('telescope.builtin').live_grep, { desc = 'Search by [G]rep' })
vim.keymap.set('n', '<leader>tw', ':LiveGrepGitRoot<cr>', { desc = 'Search by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = 'Search [D]iagnostics' })
vim.keymap.set('n', '<leader>tr', require('telescope.builtin').resume, { desc = 'Search [R]esume' })

vim.keymap.set('n', '<leader>tn', "<cmd>ObsidianSearch<cr>", { desc = 'Search [N]otes' })
vim.keymap.set('n', '<leader>Nn', "<cmd>ObsidianNew<cr>", { desc = 'New [N]ote' })
vim.keymap.set('n', '<leader>Nt', "<cmd>ObsidianToday<cr>", { desc = '[T]oday [N]ote' })

local function fugitive_toggle()
  local buf_win_id = vim.fn.bufwinid('^fugitive:')
  if buf_win_id >= 0 then
    vim.api.nvim_win_close(buf_win_id, false)
  else
    vim.cmd(":G")
  end
end
vim.keymap.set('n', '<leader>g', fugitive_toggle, { desc = "[G]it status" })
vim.keymap.set('n', '<leader>Gb', "<cmd>Git blame<cr>", { desc = "[G]it [B]lame" })
