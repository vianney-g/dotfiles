return {
  {
    'RRethy/base16-nvim',
    priority = 1000,
    name = "base16 theme",
    config = function()
      vim.cmd.colorscheme('base16-tomorrow-night')
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        -- component_separators = '|',
        -- section_separators = '',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
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
      indent = {
        char = '▏',
      },
      enabled = true,
      scope = {
        char = '▍',
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
    --[[
    Highlight and fancy indicators for TODO, FIXME, etc. in code. Default keywords:
       - TODO,
       - FIX/FIXME/BUG/FIXIT/ISSUE
       - HACK
       - WARN/WARNING/XXX
       - PERF/OPTIM/PERFORMANCE/OPTIMIZE
       - NOTE/INFO
       - TEST/TESTING/PASSED/FAILED
    --]]
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  }
}
