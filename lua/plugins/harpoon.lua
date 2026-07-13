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
      vim.keymap.set("n", "<leader>aA", function() harpoon:list():add() end, { desc = "Add current file to harpoon file list buffer" } )
      
      --toggle menu
      vim.keymap.set("n", "<leader>A", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      --navigate
      vim.keymap.set("n", "<leader>aa", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>ab", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>ac", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>ad", function() harpoon:list():select(4) end)
      vim.keymap.set("n", "<leader>ae", function() harpoon:list():select(5) end)
      vim.keymap.set("n", "<leader>af", function() harpoon:list():select(6) end)
      vim.keymap.set("n", "<leader>ag", function() harpoon:list():select(7) end)
      vim.keymap.set("n", "<leader>ah", function() harpoon:list():select(8) end)
      vim.keymap.set("n", "<leader>ai", function() harpoon:list():select(9) end)
      vim.keymap.set("n", "<leader>aj", function() harpoon:list():select(10) end)
      vim.keymap.set("n", "<leader>ak", function() harpoon:list():select(11) end)
      vim.keymap.set("n", "<leader>al", function() harpoon:list():select(12) end)
      vim.keymap.set("n", "<leader>am", function() harpoon:list():select(13) end)
      vim.keymap.set("n", "<leader>an", function() harpoon:list():select(14) end)
      vim.keymap.set("n", "<leader>ao", function() harpoon:list():select(15) end)
      vim.keymap.set("n", "<leader>ap", function() harpoon:list():select(16) end)

      -- Toggle previous & next bufaers stored within Harpoon list
      vim.keymap.set("n", "<leader>a.", function() harpoon:list():next() end)
      vim.keymap.set("n", "<leader>a,", function() harpoon:list():prev() end)
    end
  },
}
