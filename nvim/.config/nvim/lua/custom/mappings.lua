---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- recenter while moving around
    ["n"] = { "nzzzv", "repeat the latest / or ?", opts = { nowait = true } },
    ["N"] = { "Nzzzv", "repeat the latest / or ? in opposite direction", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "Scroll window downward in the buffer", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "Scroll window upward in the buffer", opts = { nowait = true } },

    -- Git shortcuts
    ["gB"] = { "<cmd> G blame<CR>", "Blame file", opts = { nowait = true } },
    ["gS"] = { "<cmd> G <CR>", "Fugitive status", opts = { nowait = true } },

    -- Tab management
    ["<leader>n"] = { "<cmd>bn<CR>", "Next buffer", opts = { nowait = true } },
    ["<tab>"] = { "<cmd>bn<CR>", "Next buffer", opts = { nowait = true } },
    ["<leader>a"] = { "<cmd>bp<CR>", "Previous buffer", opts = { nowait = true } },
    ["<S-tab>"] = { "<cmd>bp<CR>", "Previous buffer", opts = { nowait = true } },
    ["<leader>x"] = { "<cmd>bdelete<CR>", "Close buffer", opts = { nowait = true } },
    ["<leader>X"] = { "<cmd>%bd|e#|bd#<CR>", "Close all buffers except current", opts = { nowait = true } },

    -- file system edition
    ["-"] = { "<cmd>Oil --float<CR>", "Open current dir in editable buffer" },

    -- comment
    ["<leader>gc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    -- comment
    ["<leader>gc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

-- more keybinds!

return M
