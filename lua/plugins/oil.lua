return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          --["<C-h>"] = { "actions.show_help", mode = "n" },
          --["<M-h>"] = "actions.select.split",
        },
        view_options = {
          show_hidden = true,
        },
        skip_confirm_for_simple_edits = true,
      }
      vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory in current window" })

      vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory in floating window" })
    end
  }
}
