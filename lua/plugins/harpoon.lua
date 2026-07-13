return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()

      --toggle menu
      vim.keymap.set("n", "<leader>a", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      --add file
      vim.keymap.set("n", "<leader>A", function() 
        harpoon:list():add() 
        local current_file = vim.fn.expand("%:t")
        print("added " .. current_file .. " to harpoon list")
      end, { desc = "Add current file to harpoon file list" } )
      
    end
  },
}
