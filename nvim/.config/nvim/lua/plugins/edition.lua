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
  {
    "folke/which-key.nvim",
    opts = {},
    config = function()
      require("which-key").add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>G', group = '[G]it' },
        { '<leader>h', group = 'More git' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>t', group = 'Search' },
        { '<leader>w', group = '[W]orkspace' },
      }
    end
  },

  -- ( "(surround)" )
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
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
