return {
  "vianney-g/linear.nvim",
  requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    require("linear").setup()
  end,
}
