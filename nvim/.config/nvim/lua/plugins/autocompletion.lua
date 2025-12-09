-- All stuff related autocompletion
return {
  -- a basic one for vim config autocompletion
  {
    "folke/neodev.nvim",
    opts = {}
  },
  -- aider
  {
    "joshuavial/aider.nvim",
    opts = {
      auto_manage_context = true,
      default_bindings = true,
      debug = false,
    }
  },
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot", -- Exlicitly start Copilot with `:Copilot`
    event = "InsertEnter",
    opts = {
      -- copilot_model = "gpt-4o-copilot",
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
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets', 'Kaiser-Yang/blink-cmp-avante' },

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = { preset = 'enter' },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },
      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'avante' },
        providers = {
          -- add custom providers here
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {
              -- options for blink-cmp-avante
            }
          }
        },
      },
      -- disable autocompletion on cmdline
      cmdline = {
        enabled = false,
      },

      -- experimental signature help support
      -- signature = { enabled = true }
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" }
  },

}
