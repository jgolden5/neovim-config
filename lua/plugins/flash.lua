return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      { "<leader>n", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "<leader>N", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      --{ "<leader>#", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      --{ "<leader>$", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      --{ "<leader>@", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
