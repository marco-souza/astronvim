return {
  {
    "TimUntersberger/neogit",
    event = "VeryLazy",
    config = function()
      require('neogit').setup {}
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end
  },
}
