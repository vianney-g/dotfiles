return {
  {
    'RRethy/base16-nvim',
    priority = 1000,
    name = "base16 theme",
    config = function()
      vim.cmd.colorscheme('base16-ayu-dark')
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
    -- Colorize hex colors in code (and other color codes)
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = { AARRGGBB = true }
    },
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
    opts = {
      keywords = {
        GIVEN = { icon = "", color = "info", alt = { "Given" } },
        WHEN = { icon = "", color = "warning", alt = { "When" } },
        THEN = { icon = "", color = "hint", alt = { "Then" } },
      },
      highlight = {
        keyword = "wide",
        after = "fg",
        pattern = [[<(KEYWORDS)\s*:?]],
      },
    },
  }
}
