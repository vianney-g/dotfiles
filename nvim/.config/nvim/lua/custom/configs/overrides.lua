local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "elm",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "Select function scope" },
        ["if"] = { query = "@function.inner", desc = "Select inner function" },
        ["ac"] = { query = "@class.outer", desc = "Select class scope" },
        ["ic"] = { query = "@class.inner", desc = "Select inner class" },
        ["al"] = { query = "@loop.outer", desc = "Select loop scope" },
        ["il"] = { query = "@loop.inner", desc = "Select inner loop" },
        ["iib"] = { query = "@block.inner", desc = "Select block scope" },
        ["aab"] = { query = "@block.outer", desc = "Select inner block" },
        ["iic"] = { query = "@comment.inner", desc = "select comment scope" },
        ["aac"] = { query = "@comment.outer", desc = "select inner comment" },
        ["iii"] = { query = "@conditional.inner", desc = "select conditional scope" },
        ["aai"] = { query = "@conditional.outer", desc = "select inner conditional" },
        ["iis"] = { query = "@statement.inner", desc = "select statement scope" },
        ["aas"] = { query = "@statement.outer", desc = "select inner statement" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>o"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>O"] = "@parameter.inner",
      },
    },
    move = {
      enable = false,
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python stuff
    "ruff",
    "ruff-lsp",
    "mypy",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.copilot = {
  suggestion = {
    enable = false,
    auto_trigger = true,
    keymap = {
      accept = "<C-f>",
    },
  },
}

return M
