return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()

      --add file
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
        local current_file = vim.fn.expand("%:t")
        print("added " .. current_file .. " to harpoon list")
      end, { desc = "Add current file to harpoon file list" } )

      --toggle menu
      vim.keymap.set("n", "+", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    end
  },
}
