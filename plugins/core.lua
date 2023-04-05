return {
  {
    "dkarter/bullets.vim",
    event = "VeryLazy",
    config = require "user.plugins.configs.bullets"
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = require "user.plugins.configs.copilot"
  },
  {
    "TimUntersberger/neogit",
    event = "VeryLazy",
    config = require "user.plugins.configs.neogit"
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = require "user.plugins.configs.surround"
  },
  {
  "ThePrimeagen/harpoon",
    event = "VeryLazy",
    config = require "user.plugins.configs.harpoon"
  },
}
