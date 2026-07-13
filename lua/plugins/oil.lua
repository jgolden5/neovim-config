return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      require("oil").setup {
        columns = {
          { "icon", add_padding = false },
        },        
          view_options = {
          show_hidden = true,
        },
        skip_confirm_for_simple_edits = true,
        keymaps = {
          ["-"] = false, --ignore default so I can do my own
        },
        float = {
          padding = 0,
          max_width = .9999,
          max_height = .9999,
          border = nil,
          win_options = {
            winblend = 0,
          },
        }
      }
      vim.keymap.set("n", "-", require("oil").toggle_float, { desc = "Toggle open parent directory in oil" })
      --vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory in floating window" })
    end
  }
}
--See more config options here - https://github.com/stevearc/oil.nvim#options
