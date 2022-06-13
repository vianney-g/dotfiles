-- buffers quick navigation
vim.keymap.set("n", "<Leader>n", "<Cmd>bn<CR>", { silent = true })

-- center search
vim.keymap.set("n", "n", "nzz", { noremap = false, silent = true })
vim.keymap.set("n", "N", "Nzz", { noremap = false, silent = true })

-- bubble line(s)
vim.keymap.set("n", "<C-Up>", "<Cmd>m .-2<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "<C-Down>", "<Cmd>m .+1<CR>", { noremap = false, silent = true })
vim.keymap.set("v", "<C-Up>", [[@='"zxk"zP`[V`]'<CR>]], { silent = true })
vim.keymap.set("v", "<C-Down>", [[@='"zx"zp`[V`]'<CR>]], { silent = true })

-- file explorer
vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeFindFileToggle<CR>", { noremap = true })
