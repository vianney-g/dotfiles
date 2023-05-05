---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>n"] = { "<cmd>bnext<CR>", "next buffer" },
    ["<leader>a"] = { "<cmd>bprevious<CR>", "previous buffer" },
  },
}

-- more keybinds!

return M
