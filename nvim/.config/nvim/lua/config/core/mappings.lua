-- buffers quick navigation
vim.keymap.set("n", "<Leader>n", "<Cmd>bn<CR>", { silent = true })
-- windows quick navigation
vim.keymap.set("n", "<Leader>w", "<C-w><C-w>", { silent = true })

-- center search
vim.keymap.set("n", "n", "nzz", { noremap = false, silent = true })
vim.keymap.set("n", "N", "Nzz", { noremap = false, silent = true })

-- center paging
vim.keymap.set("n", "<C-f>", "<C-f>zz", { noremap = false, silent = true })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { noremap = false, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = false, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = false, silent = true })

-- create a function that extract current buffer filename
--

-- bubble line(s)
vim.keymap.set("n", "<C-Up>", "<Cmd>m .-2<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "<C-Down>", "<Cmd>m .+1<CR>", { noremap = false, silent = true })
vim.keymap.set("v", "<C-Up>", [[@='"zxk"zP`[V`]'<CR>]], { silent = true })
vim.keymap.set("v", "<C-Down>", [[@='"zx"zp`[V`]'<CR>]], { silent = true })

-- file explorer
vim.keymap.set("n", "<Leader>ee", "<Cmd>NvimTreeFindFileToggle<CR>", { noremap = true })

-- NOTES MANAGEMENT
local opts = { noremap = true, silent = false }
-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zd", "<Cmd>ZkNew daily<CR>", opts)
-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)
-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)

-- git stuff
vim.keymap.set("n", "<Leader>gs", "<Cmd>Git!<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gb", "<Cmd>Git blame<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gd", "<Cmd>Gdiffsplit<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gD", "<Cmd>Gvdiffsplit!<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gm", "<Cmd>G mergetool<CR>", { silent = true })

-- system buffer
vim.keymap.set("v", "<Leader>y", '"*y')
vim.keymap.set({ "n", "v" }, "<Leader>p", '"*p')

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-L>", "<Plug>(copilot-next)", { silent = true })
vim.api.nvim_set_keymap("i", "<C-SHIFT-L>", "<Plug>(copilot-next)", { silent = true })
