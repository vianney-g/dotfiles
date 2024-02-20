-- some edition facilities

return {
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  -- Useful plugin to show you pending keybinds.
  { "folke/which-key.nvim",  opts = {} },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  -- ( "(surround)" )
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- align text
  {
    "junegunn/vim-easy-align",
    event = "VeryLazy",
    config = function()
      vim.cmd([[
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
      ]])
    end
  },
}
