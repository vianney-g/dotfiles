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
vim.api.nvim_create_user_command("Gb", "Git blame", { nargs = 0 })

-- :W as alias for :w
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })

-- harpoon keymaps
-- see `:help harpoon`
-- I can use `h` as a leader key for Harpoon as I do not use it for left navigation (bépo layout)
local harpoon = require("harpoon")
harpoon.setup()

vim.keymap.set("n", "ha", function() harpoon:list():add() end)
vim.keymap.set("n", "hd", function() harpoon:list():remove() end)
vim.keymap.set("n", "hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "ht", function() harpoon:list():select(1) end)
vim.keymap.set("n", "hs", function() harpoon:list():select(2) end)
vim.keymap.set("n", "hr", function() harpoon:list():select(3) end)
vim.keymap.set("n", "hn", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "hg", function() harpoon:list():prev() end)
vim.keymap.set("n", "hf", function() harpoon:list():next() end)

-- NOTE: Remember that lua is a real programming language, and as such it is possible
-- to define small helper and utility functions so you don't have to repeat yourself
-- many times.
--
-- In this case, we create a function that lets us more easily define mappings specific
-- for LSP related items. It sets the mode, buffer and description for us each time.
local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>rr', function() require("refactoring").select_refactor({}) end, "[RR]efactor")

nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition (buffer)')
nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
nmap('<leader>u', require('telescope.builtin').lsp_references, 'Goto References ([U]sages, telescope)')
nmap('<leader>É', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
nmap('<leader>é', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<leader>wS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace dynamic [S]ymbols')

nmap("<leader>ws", function()
  vim.ui.input({ prompt = "Workspace symbols: " }, function(query)
    require("telescope.builtin").lsp_workspace_symbols({ query = query })
  end)
end, "[W]orkspace [S]ymbols")

nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

-- switch , and ; I want it because it is more convenient with a bépo keyboard layout
nmap(',', ';')
nmap(';', ',')

-- Lesser used LSP functionality
-- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
nmap('<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')
