return {
  {
    -- Theme inspired by Atom
    'catppuccin/nvim',
    priority = 1000,
    name = "catppuccin",
    config = function()
      local catppuccin = require 'catppuccin'
      catppuccin.setup {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {     -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
        term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,              -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,            -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,              -- Force no italic
        no_bold = false,                -- Force no bold
        no_underline = false,           -- Force no underline
        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },      -- Change the style of comments
          conditionals = { "bold" },
          loops = {},
          functions = {},
          keywords = { "bold" },
          strings = { "italic" },
          variables = {},
          numbers = {},
          booleans = { "bold" },
          properties = { "italic" },
          types = { "bold" },
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = { "all" },
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = false,
            indentscope_color = "",
          },
        }
      }
      vim.cmd.colorscheme('catppuccin')
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        -- component_separators = '|',
        -- section_separators = '',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'buffers' },
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
    },
  },
  {
    -- pretty code nav window
    'dnlhc/glance.nvim',
    config = function()
      require("glance").setup()
    end
  },
  {
    -- Colorize hex colors in code (and other color codes)
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({ user_default_options = { AARRGGBB = true } })
    end,
  },
  {
    -- Highlight and fancy indicators for TODO, FIXME, etc. in code
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  }
}
