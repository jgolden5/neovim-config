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
        skip_confirm_for_simple_edits = false,
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
          preview
        }
      }
      vim.keymap.set("n", "-", function()
        local filename = vim.fn.expand("%:p")
        if vim.startswith(filename, "oil") then
          vim.api.nvim_feedkeys(vim.keycode("<C-o>"), "n", false)
        else
          vim.cmd("edit .") --equals ":e .<CR>"
        end
      end, { desc = "Toggle open parent directory in oil" })
    end
  }
}
--See more config options here - https://github.com/stevearc/oil.nvim#options
