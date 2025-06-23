local servers = {
  -- clangd = {},
  -- gopls = {},
  pyright = {},
  sqls = {},
  -- rust_analyzer = {},
  ts_ls = {},
  -- ruff_lsp = {},
  ruff = {},
  elmls = {},
  html = { filetypes = { 'html', 'twig', 'hbs', 'jinja', 'jinja2', 'htmldjango' } },
  cucumber_language_server = {
    version = '1.4.0',
    cmd = { 'cucumber-language-server', '--stdio' },
    cucumber = {
      features = { "ledger/tests/**/*.feature", "tests/alma/**/bdd/*.feature" },
      glue = { "ledger/tests/**/*.py", "tests/alma/**/bdd/*.py" },
    }
  },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

--
return {

  -- second vim legend after Tim Pope, the Primeagen.
  -- (It could have been TJ)
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup({})
    end,
  },
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    opts = {
      servers = servers,
    },
    config = function(_, opts)
      -- mason-lspconfig requires that these setup functions are called in this order
      -- before setting up the servers.
      require('mason').setup()
      require('mason-lspconfig').setup()

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }
    end
  },
}
