---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- recenter while moving around
    ["n"] = { "nzzzv", "repeat the latest / or ?", opts = { nowait = true } },
    ["N"] = { "Nzzzv", "repeat the latest / or ? in opposite direction", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "Scroll window downward in the buffer", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "Scroll window upward in the buffer", opts = { nowait = true } },
    ["gB"] = { "<cmd> G blame<CR>", "Blame file", opts = { nowait = true } },
    ["gS"] = { "<cmd> G <CR>", "Fugitive status", opts = { nowait = true } },
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
