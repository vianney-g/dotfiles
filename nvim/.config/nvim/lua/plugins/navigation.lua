-- Navigate the code ⛵
return {
  -- a clean and small file explorer
  {
    'stevearc/oil.nvim',
    opts = {
      skip_confirm_for_simple_edits = true,
      float = {
        border = "single",
        title_pos = "center",
        padding = 10,
        win_options = {
          winblend = 0,
        },
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    'vianney-g/jetbrains-scopes.nvim',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    }
  },
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          require('telescope').setup({
            extensions = {
              ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                  winblend = 10,
                  border = true,
                  previewer = false,
                },
              }
            }
          })
          require('telescope').load_extension('ui-select')
        end,
      },
    },

  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  -- Display the current context of the cursor
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 4, -- How many lines the window should span. Values <= 0 mean no limit.
    }
  },
  {
    -- Well, let's give a try to famous primeagen's harpoon
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },


}
