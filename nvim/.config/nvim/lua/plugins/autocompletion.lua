-- All stuff related autocompletion
return {
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot", -- Exlicitly start Copilot with `:Copilot`
    event = "InsertEnter",
    opts = {
      filetypes = {
        markdown = true,
      },
      suggestion = {
        enable = false,
        auto_trigger = true,
        keymap = {
          accept = "<C-t>",
          dismiss = "<C-c>",
          next = "<C-n>",
          prev = "<C-p>",
        },
      },
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

}
